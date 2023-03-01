# Generated by Django 3.2 on 2022-11-09 13:56

import ckeditor_uploader.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Result',
            fields=[
                ('resultid', models.AutoField(primary_key=True, serialize=False)),
                ('ifpshashcontent', models.CharField(blank=True, max_length=250, null=True)),
                ('createdate', models.DateTimeField(blank=True, null=True)),
                ('editdate', models.DateTimeField(blank=True, null=True)),
                ('isenable', models.IntegerField(blank=True, null=True)),
                ('note', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('accountid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.account')),
                ('solutionid', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='homepage.solution')),
            ],
            options={
                'db_table': 'Result',
                'managed': True,
            },
        ),
    ]