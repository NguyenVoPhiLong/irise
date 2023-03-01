from operator import imod
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.core.paginator import Paginator

from homepage.models import *
import json, os, random
from datetime import datetime, timedelta
import subprocess

# Module Blockchain
from Crypto.Signature import DSS
from Crypto.Hash import SHA256

from repuchain.blockchain.wallet import Wallet
from repuchain.blockchain.blockchain import Blockchain
from repuchain.blockchain.ftx import FTXSet
from repuchain import settings
from repuchain.blockchain.ipfs import IPFSCluster_api_add, IPFS_api_cat
from repuchain.functions import send_txipfs



# Variable
timenow = datetime.now()

info_9box = {
    '00': '"Bad Hires" because you are scoring low on both performance and potential.',
    '10': '"Up or Out Grinders" because you are scoring moderate performance and low potential.',
    '01': '"Up or Out Dilemmas" because you are scoring low performance and moderate potential.',
    '20': '"Workhorses" because you are scoring high performance and low potential.',
    '02': '"Dysfunctional Geniuses" because you are scoring low performance and high potential.',
    '11': '"Core Players" because you are scoring moderate performance and moderate potential.',
    '12': '"High Potentials" because you are scoring moderate performance and high potential.',
    '21': '"High Performances" because you are scoring high performance and moderate potential.',
    '22': '"Stars" because you are scoring high performance and high potential.',
}

# Homepage index
def index(request):
    global timenow

    print(timenow)
    deltatime = datetime.now() - timenow
    print(deltatime.total_seconds())
    # 10800
    if  deltatime.total_seconds() > 180:
        timenow = datetime.now()
        try:
            refresh_solutions()
            refresh_reputationscore()
        except:
            pass

    is_log = 0
    if request.user.is_authenticated:
        is_log = 1
        user = request.user
        if user.is_staff == True:
            try:
                account = Account.objects.get(userid = user.pk)
            except:
                account = Account()
                account.userid = user
                account.competencelevel = 1
                account.reputationscore = 0
                account.save()

        account = Account.objects.get(userid = user.pk)

        solutions = Solution.objects.filter(accountid = account.accountid).filter(status = 'not')
        is_sol = 0
        if len(solutions) > 0:
            is_sol = 1
        

        context = {
            'is_log': is_log,
            'account': account,
            'is_sol': is_sol
        }
        return render(request, 'homepage/index.html', context)

    context = {
       'is_log': is_log,
    }
    return render(request, 'homepage/index.html', context)


def signup(request):
    if request.user.is_authenticated:
        return redirect('homepage:index')
    else:
        if request.method == 'POST':    
            username = request.POST.get('username')
            password1 = request.POST.get('password1')
            password2 = request.POST.get('password2')
            email = request.POST.get('email')
            firstname = request.POST.get('firstname')
            lastname = request.POST.get('lastname')

            try:
                existemail = User.objects.get(email=email)
                existusername = User.objects.get(username=username)
                return render(request, 'homepage/signup.html',{'message':'username hoặc email đã được sử dụng', 'is_log': 0})
            except:
                pass
            

            if password1 == '' or password2 == '' or password1 != password2:
                return render(request, 'homepage/signup.html',{'message':'password không trùng khớp hoặc không hợp lệ', 'is_log': 0})
            else:
                new_user = User()
                new_user.username = username
                new_user.email = email
                new_user.first_name = firstname
                new_user.last_name = lastname
                new_user.set_password(password1)
                new_user.save()
                user = authenticate(username=username, password=password1)
                login(request, user)

                new_account = Account()
                new_account.userid = new_user
                new_account.competencelevel = 1
                new_account.reputationscore = 0

        
                new_account.save()
                return redirect('homepage:index')
        
        return render(request, 'homepage/signup.html', {'is_log': 0})

def signin(request):
    if request.user.is_authenticated: 
        return redirect('homepage:index')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')  
            user = authenticate(username=username, password=password)
            if user is not None: 
                if user.is_active: 
                    login(request, user)
                    return redirect('homepage:index')
                else:
                    return render(request, 'homepage/signin.html', {'message':'Tài khoản đã bị vô hiệu hóa', 'is_log': 0})
            else:
                return render(request, 'homepage/signin.html', {'message':'Tài khoản không tồn tại', 'is_log': 0})

        return render(request, 'homepage/signin.html', {'is_log': 0})
    
def signout(request):
    try:
        logout(request)
        del request.session['manageblockchain']
        del request.session['mnbc']
    except:
        pass
    return redirect('homepage:index')

def profile(request):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        is_log = 1
        user = request.user
        account = Account.objects.get(userid = user.pk)
        competence = Competence.objects.get(level = account.competencelevel)

        is_mnbc = 0
        if request.session.get('manageblockchain', False):
            is_mnbc = 1

        try:
            addresswallets = account.addresswallet.split('_')
            pubkeys = account.publickey.split('_')
        except:
            addresswallets = ['Chưa có']
            pubkeys = ['Chưa có']

        ## Draw 9-box
        bc = Blockchain.new_blockchain()
        ftx = FTXSet(bc)
        repulist = ftx.get_repulist()
        try:
            pro_avgscore =  int(repulist[account.publickey]['pro'])
            pot_avgscore =  int(repulist[account.publickey]['pot'])
        except:
            # if repulist = {} 
            pro_avgscore = 0
            pot_avgscore = 0
        
        ## Advise
        pro_low = False
        pro_moderate = False
        pro_high = False
        pot_low = False
        pot_moderate = False
        pot_high = False
        s_low = 33
        s_moderate = 66
        s_high = 99
        
        pro_advice = ''
        if pro_avgscore <= s_low:
            pro_advice = f'- You need {s_low-pro_avgscore} more points to grow to low performance.'
            pro_low = True
        elif pro_avgscore <= s_moderate:
            pro_advice = f'- You need {s_moderate-pro_avgscore} more points to grow to moderate performance.'
            pro_moderate = True
        elif pro_avgscore <= s_high:
            pro_advice = f'- You need {s_high-pro_avgscore} more points to grow to high performance.'
            pro_high = True
        
        pot_advice = ''
        if pot_avgscore <= s_low:
            pot_advice = f'- You need {s_low-pot_avgscore} more points to grow to low potential.'
            pot_low = True
        elif pot_avgscore <= s_moderate:
            pot_advice = f'- You need {s_moderate-pot_avgscore} more points to grow to moderate potential.'
            pot_moderate = True
        elif pot_avgscore <= s_high:
            pot_advice = f'- You need {s_high-pot_avgscore} more points to grow to high potential.'
            pot_high = True
        
        position = '- You are in group '
        global info_9box

        if pro_low and pot_low:
            position += info_9box['00']
        elif pro_low and pot_moderate:
            position += info_9box['01']
        elif pro_low and pot_high:
            position += info_9box['02']
        elif pro_moderate and pot_low:
            position += info_9box['10']
        elif pro_moderate and pot_moderate:
            position += info_9box['11']
        elif pro_moderate and pot_high:
            position += info_9box['12']
        elif pro_high and pot_low:
            position += info_9box['20']
        elif pro_high and pot_moderate:
            position += info_9box['21']
        elif pro_high and pot_high:
            position += info_9box['22']

        if request.method == 'POST':
            password = request.POST.get('password')
            flag = user.check_password(password)
            if not flag:
                return render(request, 'homepage/errors.html', {'message': 'Your password is incorrect!'})
            if flag:
                w = Wallet()
                w.create_wallet()
                account = Account.objects.get(userid = user.pk)
                new_address = w.get_address()
                new_pubkey = w.publickey.decode()
                new_prikey = w.privatekey.decode()

                if not os.path.isfile(settings.BASE_DIR_BC + '/wallet.json'):
                    repufile = open(settings.BASE_DIR_BC + '/wallet.json', 'w')
                    # init reputation list
                    wallet = {
                        'address': new_address,
                        'privatekey': new_prikey,
                        'publickey': new_pubkey
                    }
                    # write file
                    repufile.write(json.dumps(wallet, indent = 4))
                    repufile.close()

                if account.addresswallet == None:
                    account.addresswallet = new_address
                    account.publickey = new_pubkey
                    account.privatekey = new_prikey
                    account.save()
                # else: # Acept many wallets
                #     str_address = account.addresswallet
                #     account.addresswallet = str_address + '_' + new_address
                #     str_publickey = account.publickey
                #     account.publickey = str_publickey + '_' + new_pubkey
                #     str_privatekey = account.privatekey
                #     account.privatekey = str_privatekey + '_' + new_prikey
                #     account.save()
                
                context = {
                    'new_address': new_address,
                    'new_pubkey': new_pubkey,
                    'new_prikey': new_prikey,
                }
                return render(request, 'homepage/wallet.html', context)
            else:
                context = {
                    'message':'Wrong Password',
                    'is_log': is_log,
                    'pro_avgscore': pro_avgscore,
                    'pot_avgscore': pot_avgscore,
                    'is_mnbc': is_mnbc,
                    'position':position,
                    'pot_advice': pot_advice,
                    'pro_advice': pro_advice
                }
                return render(request, 'homepage/profile.html', context)

        
        context = {
            'addresswallets': addresswallets,
            'pubkeys': pubkeys,
            'is_log': is_log,
            'account': account,
            'competence': competence,
            'pro_avgscore': pro_avgscore,
            'pot_avgscore': pot_avgscore,
            'is_mnbc': is_mnbc,
            'position':position,
            'pot_advice': pot_advice,
            'pro_advice': pro_advice
        }
        return render(request, 'homepage/profile.html', context)

def editprofile(request, id):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        is_log = 1
        account = Account.objects.get(accountid = id)

        if request.method == 'POST':
            education = request.POST.get('education')
            workexperience = request.POST.get('workexperience')
            skill = request.POST.get('skill')
            project = request.POST.get('project')

            account.workexperience = workexperience 
            account.education = education 
            account.skill = skill
            account.project = project 
            account.save()
            
            return redirect('homepage:profile')

        context = {
            'is_log': is_log,
            'account': account,
        }
        return render(request, 'homepage/editprofile.html', context)

def test(request, typeskill):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        is_log = 1
        user = request.user
        account = Account.objects.get(userid = user.pk)
        
        if account.addresswallet == None:
            return render(request, 'homepage/errors.html', {'message': 'You need create your wallet first!'})

        competence = Competence.objects.get(level = account.competencelevel)
        # check solution
        solutions = Solution.objects.filter(accountid = account.accountid).filter(status = 'not')

        if len(solutions) == 0:

            rand_questionandhint = None
            rand_activity = None
            while rand_questionandhint == None:
                activities_1 = Activity.objects.filter(competenceid = competence.competenceid)
                activities_2 = Activity.objects.filter(competenceid = None)
                activities = activities_1 | activities_2

                activities_by_type = []
                # check type of skill area
                for activity in activities:
                    skill = Skill.objects.get(keyname = activity.keynameskill.keyname)
                    skillarea = SkillArea.objects.get(keyname = skill.keynameskillarea.keyname)
                    if skillarea.typeskill == typeskill:
                        activities_by_type.append(activity)

                rand_activity = random.choice(activities_by_type)

                questionandhints = QuestionAndHint.objects.filter(keynameactivity=rand_activity.keyname)
                
                if len(questionandhints) > 0:
                    rand_questionandhint = random.choice(questionandhints)

                if rand_questionandhint != None:
                    # Check cau hoi đã kiểm tra rồi cho kiểm lại hay không
                    results = Result.objects.filter(accountid = account)
                    for result in results:
                        if result.solutionid.questionandhintid == rand_questionandhint.questionandhintid:
                            rand_questionandhint = None
                            break

            # print(rand_questionandhint)

            new_solution = Solution()
            new_solution.questionandhintid = rand_questionandhint
            new_solution.accountid = account
            new_solution.status = 'not'
            new_solution.starttime = datetime.now()
            new_solution.typesolution = 'answer'
            new_solution.note = f'Level {competence.level} - {competence.name}'
            new_solution.save()

            solution = new_solution
        else:
            solution = solutions[0]
            rand_questionandhint = solution.questionandhintid
            rand_activity = Activity.objects.get(keyname = rand_questionandhint.keynameactivity.keyname) 


        # show list activities
        list_skills = []
        skill = Skill.objects.get(keyname = rand_activity.keynameskill.keyname) 
        list_skills.append(f'{skill.keyname} - {skill.name}')
        if rand_questionandhint.note != None:
            for s in rand_questionandhint.note.split(';'):
                list_skills.append(s.strip())
        list_skills = list(set(list_skills))

        # show question
        question = ''
        answers = ''
        if rand_questionandhint.typequestion == 'singlechoice':
            split_str = rand_questionandhint.contentquestion.split('_')
            question = split_str[0]
            answers = split_str[1:]

        if request.method == 'POST':
            privatekey = request.POST.get('privatekey')
            answer = request.POST.get('answer')

            try:
                priK = Wallet.decode_key(privatekey.encode())
                pubkey = priK.public_key()
                pubkey2 = Wallet.decode_key(account.publickey.encode())
                if pubkey != pubkey2:
                    context = {
                        'message': 'Invalid Privatekey',
                        'account': account,
                        'questionandhint': rand_questionandhint,
                        'question':question,
                        'answers': answers,
                        'solution': solution,
                        'list_skills': list_skills,
                        'competence': competence
                    }
                    return render(request, 'homepage/test.html', context)
            except:
                context = {
                    'message': 'Invalid Privatekey',
                    'account': account,
                    'questionandhint': rand_questionandhint,
                    'question':question,
                    'answers': answers,
                    'solution': solution,
                    'list_skills': list_skills,
                    'competence': competence
                }
                return render(request, 'homepage/test.html', context)
            signer = DSS.new(priK, 'fips-186-3')
            signature = signer.sign(SHA256.new(answer.encode()))
            # create file
            data = {
                "content": answer,
                "signature": signature.hex(),
                "publickey": account.publickey,
                "levelcompetence": account.competencelevel
            }
            namefile = 'ques_' + str(solution.questionandhintid.questionandhintid) + f'_addr_{account.addresswallet}_' + str(solution.starttime.timestamp())
            pathstore = settings.BASE_DIR_BC + f'/ipfs/media/solution/{namefile}.json'
            solfile = open(pathstore, 'w')
            solfile.write(json.dumps(data, indent = 4))
            solfile.close()
            # add ipfs 
            # ihash = IPFSCluster__add(settings.BASE_DIR_BC, pathstore)
            ihash = IPFSCluster_api_add(pathstore)
            # change status solution
            solution.ifpshashcontent = ihash
            solution.endtime = datetime.now()
            solution.status = 'checking'
            solution.save()

            # Check type question: Trắc nghiệm => chấm điểm
            if solution.questionandhintid.typequestion == 'singlechoice':
                ## struct
                    # hash_solution: ['hash_solution', 'pubkey'] 
                    # hash_rates: ['list_pubkeys': 'list_rates']
                    # score_solution: score
                    # score_rates: score
                    # type_solution: pro or pot
                ## end struct
                data = {
                    "hash_solution": [ihash, account.publickey],
                    "hash_rates": {},
                    "score_solution": 0,
                    "score_rates": int(int(solution.questionandhintid.scorebase)/20),
                    "type_solution": rand_activity.keynameskill.keynameskillarea.typeskill,
                    "black_rates": []
                }
                # check correct
                if answer == solution.questionandhintid.contenthint:
                    data["score_solution"] = int(solution.questionandhintid.scorebase)

                # create result to add ipfs
                namefile = 'ques_' + str(solution.questionandhintid.questionandhintid) + f'_addr_{account.addresswallet}_' + str(solution.starttime.timestamp())
                pathstore = settings.BASE_DIR_BC + f'/ipfs/media/result/{namefile}.json'
                resfile = open(pathstore, 'w')
                resfile.write(json.dumps(data, indent = 4))
                resfile.close()
                # add ipfs
                # ihash = IPFSCluster__add(settings.BASE_DIR_BC, pathstore)
                ihash = IPFSCluster_api_add(pathstore)
                # change status
                solution.status = 'done'
                solution.save()
                # add result
                result = Result()
                result.accountid = account
                result.solutionid = solution
                result.ifpshashcontent = ihash
                result.save()
                # create tx
                send_txipfs(ipfshash=ihash)  

            return redirect('homepage:index')

        context = {
            'is_log': is_log,
            'account': account,
            'questionandhint': rand_questionandhint,
            'question':question,
            'answers': answers,
            'solution': solution,
            'list_skills': list_skills,
            'competence': competence
        }
        return render(request, 'homepage/test.html', context)

class ShowSolution:
    def __init__(self, order, solution, list_skills, evaluaters, max_evaluaters, level):
        self.order = order
        self.solution = solution
        self.list_skills = list_skills
        self.evaluaters = evaluaters
        self.max_evaluaters = max_evaluaters
        self.level = level


def evaluatetest(request):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        is_log = 1
        user = request.user
        account = Account.objects.get(userid = user.pk)

        if int(account.reputationscore) < -10:
            return render(request, 'homepage/errors.html', {'message': 'Your Reputation Scores are not enough!'})

        if account.addresswallet == None:
            return render(request, 'homepage/errors.html', {'message': 'You need create your wallet first!'})

        solutions = Solution.objects.filter(status = 'checking').order_by('endtime')
        # Nếu đã đánh giá thì không show
        # Nếu của người tạo thì không show
        solutions = list(solutions)
        rates = RateSolution.objects.filter(accountid = account)
        for rate in rates:
            for solution in solutions:
                if rate.solutionid.solutionid == solution.solutionid:
                    solutions.remove(solution)
        for solution in solutions:
            if account.accountid == solution.accountid.accountid:
                solutions.remove(solution)

        showsolutions = []
        order = 1
        for solution in solutions:
            # list skill
            list_skills = []
            activity = Activity.objects.get(keyname = solution.questionandhintid.keynameactivity.keyname)
            skill = Skill.objects.get(keyname = activity.keynameskill.keyname) 
            list_skills.append(f'{skill.keyname} - {skill.name}')
            if solution.questionandhintid.note != None:
                for s in solution.questionandhintid.note.split(';'):
                    list_skills.append(s.strip())
            list_skills = list(set(list_skills))
            

            # list evaluaters
            evaluaters = RateSolution.objects.filter(solutionid = solution)
            accounts = Account.objects.all()
            max_evaluaters = int(len(accounts)*settings.percentnodes) + 1

            cls_sol = ShowSolution(order, solution, list_skills, len(evaluaters), max_evaluaters, 0)
            order += 1
            showsolutions.append(cls_sol)
        
        # Pages
        paginator = Paginator(showsolutions, 5)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)


        if request.method == 'POST':
            return redirect('homepage:index')

        context = {
            'is_log': is_log,
            'account': account,
            'showsolutions': showsolutions,
            'page_obj': page_obj
        }
        return render(request, 'homepage/evaluatetest.html', context)

def evaluatetestdetail(request, id):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        is_log = 1
        user = request.user
        account = Account.objects.get(userid = user.pk)
        solution = Solution.objects.get(solutionid = id)
        list_skills = []
        activity = Activity.objects.get(keyname = solution.questionandhintid.keynameactivity.keyname)
        skill = Skill.objects.get(keyname = activity.keynameskill.keyname) 
        list_skills.append(f'{skill.keyname} - {skill.name}')
        if solution.questionandhintid.note != None:
            for s in solution.questionandhintid.note.split(';'):
                list_skills.append(s.strip())
        
        list_skills = list(set(list_skills))

        skilltype = skill.keynameskillarea.typeskill
        if skilltype == 'pro':
            skilltype = 'Professional Skill'
        else:
            skilltype = 'Potence Skill'
        
        sol_time = solution.endtime - solution.starttime
        sol_time = round((sol_time.total_seconds())/60)

        # data = IPFS__cat(settings.BASE_DIR_BC, solution.ifpshashcontent)
        data = IPFS_api_cat(solution.ifpshashcontent)
        data = json.loads(data)

        hintscalegeneral = HintScale.objects.all()[0]

        # check if solution is valid
        sol_encodepubkey = data['publickey'].encode()
        sol_sign = bytes.fromhex(data['signature']) 
        sol_pubkey = Wallet.decode_key(sol_encodepubkey)
        verifier = DSS.new(sol_pubkey, 'fips-186-3')
        try:
            verifier.verify(SHA256.new(data['content'].encode()), sol_sign)
        except:
            context = {
                'message': 'Invalid Solution'
            }
            return render(request, 'homepage/errors.html', context)

        if request.method == 'POST':
            privatekey = request.POST.get('privatekey')
            score = request.POST.get('score')

            try:
                priK = Wallet.decode_key(privatekey.encode())
            except:
                context = {
                    'message': 'Invalid Privatekey',
                    'is_log': is_log,
                    'account': account,
                    'solution':solution,
                    'list_skills': list_skills,
                    'skilltype': skilltype,
                    'activity': activity,
                    'sol_time': sol_time,
                    'content': data['content'],
                    'hintscalegeneral': hintscalegeneral
                }
                return render(request, 'homepage/evaluatetestdetail.html', context)
            
            signer = DSS.new(priK, 'fips-186-3')
            signature = signer.sign(SHA256.new(score.encode()))
            
            # create file
            data = {
                "score": int(score),
                "comment": "",
                "signature": signature.hex(),
                "publickey": account.publickey
            }
            
            namefile = 'ques_' + str(solution.questionandhintid.questionandhintid) + f'_addr_{account.addresswallet}_' + str(solution.starttime.timestamp())
            pathstore = settings.BASE_DIR_BC + f'/ipfs/media/rate/{namefile}.json'
            rfile = open(pathstore, 'w')
            rfile.write(json.dumps(data, indent = 4))
            rfile.close()
            # add ipfs 
            # ihash = IPFSCluster__add(settings.BASE_DIR_BC, pathstore)
            ihash = IPFSCluster_api_add(pathstore)
            # ratesolution
            ratesolution = RateSolution()
            ratesolution.solutionid = solution
            ratesolution.accountid = account
            ratesolution.ifpshashcontent = ihash
            ratesolution.save()

            return redirect('homepage:index')

        context = {
            'is_log': is_log,
            'account': account,
            'solution':solution,
            'list_skills': list_skills,
            'skilltype': skilltype,
            'activity': activity,
            'sol_time': sol_time,
            'content': data['content'],
            'hintscalegeneral': hintscalegeneral
        }
        return render(request, 'homepage/evaluatetestdetail.html', context)

def errors(request):
    return render(request, 'homepage/errors.html')

# 180 mins -> check status solution
def refresh_solutions():
    # get solutions with status checking
    solutions = Solution.objects.filter(status = 'checking')
    # get rates of solution
    accounts = Account.objects.all()
    max_evaluaters = int(len(accounts)*settings.percentnodes) + 1
    for solution in solutions:
        rates = RateSolution.objects.filter(solutionid = solution)
        
        # check done solution 
        if len(rates) >= max_evaluaters:
            solution.status = 'done'
            solution.save()

            # get users of rate and get score
            hash_rates = dict()
            for rate in rates:
                hash_rates[rate.accountid.publickey] = rate.ifpshashcontent
                
            # cal weight
            votes = dict()
            list_numb = []
            for pubkey, ihash in hash_rates.items():
                account = Account.objects.get(publickey = pubkey)
                # data = IPFS__cat(settings.BASE_DIR_BC, ihash)
                data = IPFS_api_cat(ihash)
                data = json.loads(data)
                # verify
                sol_encodepubkey = data['publickey'].encode()
                sol_sign = bytes.fromhex(data['signature']) 
                sol_pubkey = Wallet.decode_key(sol_encodepubkey)
                verifier = DSS.new(sol_pubkey, 'fips-186-3')
                score = int(data['score'])
                try:
                    verifier.verify(SHA256.new(str(score).encode()), sol_sign)
                    list_numb.append(score)
                except:
                    continue

                votes[pubkey] = [account.reputationscore, score]
            
            # check score sai khác nhiều
            black_rates = []
            avg_numb = int(sum(list_numb)/len(list_numb)) 

            sum_score = 0
            for _, values in votes.items():
                if abs(avg_numb - int(values[1])) <= 20:
                    sum_score += int(values[0])
                else:
                    continue

            for pubk, values in votes.items():
                if abs(avg_numb - int(values[1])) <= 20:
                    weight = int(values[0])/sum_score
                    votes[pubk].append(round(weight, 2))
                else:
                    continue

            # Caculation
            cac_score = 0
            for pubk, values in votes.items():
                if abs(avg_numb - int(values[1])) <= 20:
                    cac_score += int(values[1])*float(values[2])
                else:
                    black_rates.append(pubk)

            # get type sol
            act = Activity.objects.get(keyname = solution.questionandhintid.keynameactivity.keyname) 
            type_solution = act.keynameskill.keynameskillarea.typeskill

            data = {
                "hash_solution": [solution.ifpshashcontent, solution.accountid.publickey],
                "hash_rates": hash_rates,
                "score_solution": int(cac_score),
                "score_rates": int(int(solution.questionandhintid.scorebase)/20),
                "type_solution": type_solution,
                "black_rates": black_rates
            }
        
            # create file
            namefile = 'ques_' + str(solution.questionandhintid.questionandhintid) + f'_addr_{solution.accountid.addresswallet}_' + str(solution.starttime.timestamp())
            pathstore = settings.BASE_DIR_BC + f'/ipfs/media/result/{namefile}.json'
            resfile = open(pathstore, 'w')
            resfile.write(json.dumps(data, indent = 4))
            resfile.close()
            # add ipfs 
            # ihash = IPFSCluster__add(settings.BASE_DIR_BC, pathstore)
            ihash = IPFSCluster_api_add(pathstore)
            # update result
            result = Result()
            result.accountid = solution.accountid
            result.solutionid = solution
            result.ifpshashcontent = ihash
            result.save()
            # Tạo Tx & send Tx
            send_txipfs(ipfshash=ihash)  

# After 180 mins update
def refresh_reputationscore():
    repufile = open(settings.BASE_DIR_BC + '/repulist.json', 'r+')
    data_json = json.load(repufile)
    repufile.close()
    users = data_json['users']
    
    for user in users:
        account = Account.objects.get(publickey = user['pubkey'])
        account.reputationscore = user['score']
        if account.reputationscore >= settings.score_lv1:
            account.reputationscore = 2
        # continue level 3 4 5
        account.save()
    print('Updated Reputation Score of All account!')

# Mange Blockchain
def checkmanage_blockchain(request):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        user = request.user
        account = Account.objects.get(userid = user.pk)

        if request.method == 'POST':
            password = request.POST.get('password')
            privatekey = request.POST.get('privatekey')
            flag = user.check_password(password)
            if flag:
                walletfile = open(settings.BASE_DIR_BC + '/wallet.json', 'r+')
                data_json = json.load(walletfile)
                walletfile.close()
                if data_json['privatekey'] == privatekey:
                    request.session['manageblockchain'] = True
                    return redirect('homepage:manageblockchain')
                else:
                    context = {
                        'message': 'Wrong Private Key'
                    }
                    return render(request, 'homepage/errors.html', context)

            else:
                context = {
                    'message': 'Wrong Password'
                }
                return render(request, 'homepage/errors.html', context)
        return redirect('homepage:profile')

def manage_blockchain(request):
    if not request.user.is_authenticated: 
        return redirect('homepage:signin')
    else:
        user = request.user
        account = Account.objects.get(userid = user.pk)


        if not request.session.get('manageblockchain', False):
            return redirect('homepage:index')
        mnbc = 0
        if request.session.get('mnbc', False):
            mnbc = 1

        context = {
            'is_log': 1,
            'account': account,
            'mnbc': mnbc
        }
        return render(request, 'homepage/manageblockchain.html', context)

# def start_blockchain(request):
#     path = settings.BASE_DIR_BC

#     process = subprocess.Popen(['python', 'runnode.py'], stdout=subprocess.PIPE, stdin=subprocess.PIPE, cwd=path, shell=True)
#     print('Run Blockchain Success!')

#     txt = process.stdout.read().decode()
#     txt = txt.replace('\n','')
#     var = txt.split('\r')[1]
#     if var == 'Blockchain is running':
#         request.session['mnbc'] = var
#     else:
#         del request.session['mnbc']
#     return redirect('homepage:manageblockchain')


def get_privatekey_fromfile(path):
    confpath = path.replace('\\', '/')
    f = open(confpath, 'r+')
    data = f.read()
    prik = data.split(' ')
    f.close()

    return prik[-1]

