# Generated by Django 3.2 on 2022-11-02 09:07

import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('accountid', models.AutoField(primary_key=True, serialize=False)),
                ('addresswallet', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('publickey', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('privatekey', models.CharField(blank=True, max_length=250, null=True)),
                ('education', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('skill', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('workexperience', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('project', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('reputationscore', models.CharField(blank=True, max_length=250, null=True)),
                ('competencelevel', models.CharField(blank=True, max_length=250, null=True)),
                ('phonenumber', models.CharField(blank=True, max_length=250, null=True)),
                ('avatar', models.CharField(blank=True, max_length=250, null=True)),
                ('birthday', models.DateTimeField(blank=True, null=True)),
                ('job', models.CharField(blank=True, max_length=250, null=True)),
                ('gender', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('userid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='userid', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'Account',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('activityid', models.AutoField(primary_key=True, serialize=False)),
                ('keyname', models.CharField(max_length=250, unique=True)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('requirement', models.CharField(blank=True, max_length=250, null=True)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
            ],
            options={
                'db_table': 'Activity',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Career',
            fields=[
                ('careerid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('description', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
            ],
            options={
                'db_table': 'Career',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='HintScale',
            fields=[
                ('hintscaleid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
            ],
            options={
                'db_table': 'HintScale',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='QuestionAndHint',
            fields=[
                ('questionandhintid', models.AutoField(primary_key=True, serialize=False)),
                ('typequestion', models.CharField(blank=True, max_length=250, null=True)),
                ('contentquestion', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('contenthint', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('scorebase', models.CharField(blank=True, max_length=250, null=True)),
                ('typegroup', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('activityid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.activity')),
            ],
            options={
                'db_table': 'QuestionAndHint',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Solution',
            fields=[
                ('solutionid', models.AutoField(primary_key=True, serialize=False)),
                ('typesolution', models.CharField(blank=True, max_length=250, null=True)),
                ('ifpshashcontent', models.CharField(blank=True, max_length=250, null=True)),
                ('status', models.CharField(blank=True, max_length=250, null=True)),
                ('starttime', models.DateTimeField(blank=True, null=True)),
                ('endtime', models.DateTimeField(blank=True, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('accountid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.account')),
                ('questionandhintid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.questionandhint')),
            ],
            options={
                'db_table': 'Solution',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SkillArea',
            fields=[
                ('skillareaid', models.AutoField(primary_key=True, serialize=False)),
                ('keyname', models.CharField(max_length=250, unique=True)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('typeskill', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('careerid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.career')),
            ],
            options={
                'db_table': 'SkillArea',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Skill',
            fields=[
                ('skillid', models.AutoField(primary_key=True, serialize=False)),
                ('keyname', models.CharField(max_length=250, unique=True)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('keynameskillarea', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.skillarea', to_field='keyname')),
            ],
            options={
                'db_table': 'Skill',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='RateSolution',
            fields=[
                ('ratesolutionid', models.AutoField(primary_key=True, serialize=False)),
                ('ifpshashcontent', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('accountid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.account')),
                ('solutionid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.solution')),
            ],
            options={
                'db_table': 'RateSolution',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Competence',
            fields=[
                ('competenceid', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=250, null=True)),
                ('level', models.CharField(blank=True, max_length=250, null=True)),
                ('requirement', models.CharField(blank=True, max_length=250, null=True)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('careerid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.career')),
            ],
            options={
                'db_table': 'Competence',
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='activity',
            name='competenceid',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.competence'),
        ),
        migrations.AddField(
            model_name='activity',
            name='keynameskill',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.skill', to_field='keyname'),
        ),
    ]