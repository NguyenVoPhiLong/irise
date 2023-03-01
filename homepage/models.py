from django.db import models
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField


# User gồm: ID, username, password, first_name, last_name, email.
class Account(models.Model):
    accountid = models.AutoField(primary_key = True)
    userid = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True, related_name='userid')
    addresswallet = RichTextUploadingField(blank=True, null=True)
    publickey = RichTextUploadingField(blank=True, null=True)
    privatekey = models.CharField(max_length=250, blank=True, null=True) # only location
    # important
    education = RichTextUploadingField(blank=True, null=True)
    skill = RichTextUploadingField(blank=True, null=True)
    workexperience = RichTextUploadingField(blank=True, null=True)
    project = RichTextUploadingField(blank=True, null=True)
    # score
    reputationscore = models.CharField(max_length=250, blank=True, null=True)           # total score get from Txs of BC
    competencelevel = models.CharField(max_length=250, blank=True, null=True)           # 1 2 3 4 5
    # not important
    phonenumber = models.CharField(max_length=250, blank=True, null=True)
    avatar = models.CharField(max_length=250, blank=True, null=True) 
    birthday = models.DateTimeField(blank=True, null=True)
    job = models.CharField(max_length=250, blank=True, null=True)
    gender = models.CharField(max_length=250, blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'Account'

class Career(models.Model):
    careerid = models.AutoField(primary_key = True)
    name = models.CharField(max_length=250, blank=True, null=True)
    description = models.CharField(max_length=250, blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    # def __str__(self):
    #     return self.name

    class Meta:
        managed = True
        db_table = 'Career'

class HintScale(models.Model):
    hintscaleid = models.AutoField(primary_key = True)
    name = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextUploadingField(blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'HintScale'

class SkillArea(models.Model):
    skillareaid = models.AutoField(primary_key = True)
    careerid = models.ForeignKey(Career,on_delete =  models.DO_NOTHING, blank=True, null=True)
    keyname = models.CharField(max_length=250, unique=True)
    name = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextUploadingField(blank=True, null=True)
    typeskill = models.CharField(max_length=250, blank=True, null=True) # Professional skill or Potence skill (Pro or Pot)
    
    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    # def __str__(self):
    #     return self.name

    class Meta:
        managed = True
        db_table = 'SkillArea'

class Competence(models.Model):
    competenceid = models.AutoField(primary_key = True)
    careerid = models.ForeignKey(Career, on_delete = models.DO_NOTHING, blank=True, null=True)
    name = models.CharField(max_length=250, blank=True, null=True)
    level = models.CharField(max_length=250, blank=True, null=True)
    requirement = models.CharField(max_length=250, blank=True, null=True) # score to level up
    description = RichTextUploadingField(blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    # def __str__(self):
    #     return self.name

    class Meta:
        managed = True
        db_table = 'Competence'

class Skill(models.Model):
    skillid = models.AutoField(primary_key = True)
    keynameskillarea = models.ForeignKey(SkillArea, to_field='keyname', on_delete = models.DO_NOTHING)
    keyname = models.CharField(max_length=250, unique=True)
    name = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextUploadingField(blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    # def __str__(self):
    #     return self.name

    class Meta:
        managed = True
        db_table = 'Skill'

class Activity(models.Model):
    activityid = models.AutoField(primary_key = True)
    keynameskill = models.ForeignKey(Skill, to_field='keyname', on_delete = models.DO_NOTHING)
    competenceid = models.ForeignKey(Competence, on_delete =  models.DO_NOTHING, blank=True, null=True)
    keyname = models.CharField(max_length=250, unique=True)
    name = models.CharField(max_length=250, blank=True, null=True)
    requirement = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextUploadingField(blank=True, null=True)

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    # def __str__(self):
    #     return self.description

    class Meta:
        managed = True
        db_table = 'Activity'

class QuestionAndHint(models.Model):
    questionandhintid = models.AutoField(primary_key = True)
    # activityid = models.ForeignKey(Activity,on_delete = models.DO_NOTHING, blank=True, null=True)
    keynameactivity = models.ForeignKey(Activity, models.DO_NOTHING, blank=True, null=True, to_field='keyname')
    typequestion = models.CharField(max_length=250, blank=True, null=True)              # Assignment, Singlechoice
    contentquestion = RichTextUploadingField(blank=True, null=True)
    contenthint = RichTextUploadingField(blank=True, null=True)
    scorebase = models.CharField(max_length=250, blank=True, null=True)                 # 100 point
    typegroup = models.CharField(max_length=250, blank=True, null=True)                 # group of questions

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'QuestionAndHint'

# Storage hashfile on BD: an toàn và không bị mất
class Solution(models.Model):
    solutionid = models.AutoField(primary_key = True)
    questionandhintid = models.ForeignKey(QuestionAndHint,on_delete = models.DO_NOTHING, blank=True, null=True)
    accountid = models.ForeignKey(Account,on_delete =  models.DO_NOTHING, blank=True, null=True)
    typesolution = models.CharField(max_length=250, blank=True, null=True)      # Answer or Question

    ifpshashcontent = models.CharField(max_length=250, blank=True, null=True)   # ipfsHash -> store json content {'content', 'signature', 'pubkey'}
    status = models.CharField(max_length=250, blank=True, null=True)            # default = 'not', if enough mentor => 'checking' => 'done'
    starttime = models.DateTimeField(blank=True, null=True) 
    endtime = models.DateTimeField(blank=True, null=True)  

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'Solution'

class Result(models.Model):
    resultid = models.AutoField(primary_key = True)
    solutionid = models.ForeignKey(Solution,on_delete = models.DO_NOTHING, blank=True, null=True)
    accountid = models.ForeignKey(Account,on_delete =  models.DO_NOTHING, blank=True, null=True)

    ifpshashcontent = models.CharField(max_length=250, blank=True, null=True) 

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'Result'

class RateSolution(models.Model):
    ratesolutionid = models.AutoField(primary_key = True)
    solutionid = models.ForeignKey(Solution,on_delete =  models.DO_NOTHING, blank=True, null=True)
    accountid = models.ForeignKey(Account, on_delete = models.DO_NOTHING, blank=True, null=True)
    ifpshashcontent = models.CharField(max_length=250, blank=True, null=True)   # ipfsHash -> store json content {'score', 'comment', 'signature', 'pubkey'}

    createdate = models.DateTimeField(blank=True, null=True)  
    editdate = models.DateTimeField(blank=True, null=True) 
    isenable = models.IntegerField(blank=True, null=True)
    note = RichTextUploadingField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'RateSolution'