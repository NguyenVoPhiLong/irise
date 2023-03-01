from django.urls import path
from homepage.views import *

app_name = 'homepage'

urlpatterns = [
    path('', index, name='index'),
    path('signup', signup, name='signup'),
    path('signin', signin, name='signin'),
    path('signout', signout, name='signout'),
    path('profile', profile, name='profile'),
    path('profile/edit/<int:id>', editprofile, name='editprofile'),
    path('test/<slug:typeskill>', test, name='test'),
    path('evaluatetest', evaluatetest, name='evaluatetest'),
    path('evaluatetest/<int:id>', evaluatetestdetail, name='evaluatetestdetail'),
    path('manage/checkmanage_blockchain', checkmanage_blockchain, name='checkmanage_blockchain'),
    path('manage/blockchain', manage_blockchain, name='manageblockchain'),
    # path('start/blockchain', start_blockchain, name="startblockchain"),

    path('errors', errors, name='errors'),
]

# myexam + program list