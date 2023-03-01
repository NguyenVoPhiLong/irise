from import_export import resources, fields
from import_export.admin import ImportExportModelAdmin
from import_export.widgets import ForeignKeyWidget
from django.contrib import admin
from homepage.models import *

# Account
admin.site.register(Account)

# Career
class CareerResource(resources.ModelResource):
    class Meta:
        model = Career
        import_id_fields = ('careerid','name','description','createdate', 'editdate', 'isenable', 'note')
        
class CareerAdmin(ImportExportModelAdmin):
    resource_classes = [CareerResource]

admin.site.register(Career, CareerAdmin)

# HintScale
class HintScaleResource(resources.ModelResource):
    class Meta:
        model = HintScale
        import_id_fields = ('hintscaleid','name','description','createdate', 'editdate', 'isenable', 'note')
        
class HintScaleAdmin(ImportExportModelAdmin):
    resource_classes = [HintScaleResource]

admin.site.register(HintScale, HintScaleAdmin)

# SkillArea
class SkillAreaResource(resources.ModelResource):
    class Meta:
        model = SkillArea
        import_id_fields = ('skillareaid','careerid','keyname','name','description','typeskill','createdate', 'editdate', 'isenable', 'note')

class SkillAreaAdmin(ImportExportModelAdmin):
    resource_classes = [SkillAreaResource]

admin.site.register(SkillArea, SkillAreaAdmin)

# Competence
class CompetenceResource(resources.ModelResource):
    class Meta:
        model = Competence
        import_id_fields = ('competenceid','careerid','name','level','requirement','description','createdate', 'editdate', 'isenable', 'note')
        
class CompetenceAdmin(ImportExportModelAdmin):
    resource_classes = [CompetenceResource]

admin.site.register(Competence, CompetenceAdmin)

# Skill
class SkillResource(resources.ModelResource):
    keynameskillarea = fields.Field(
        column_name='keynameskillarea',
        attribute='keynameskillarea',
        widget=ForeignKeyWidget(
            SkillArea, field='keyname'
        )
    )
    class Meta:
        model = Skill
        import_id_fields = ('skillid','keynameskillarea','keyname','name','description','createdate', 'editdate', 'isenable', 'note')
        export_order = ('skillid','keynameskillarea','keyname','name','description','createdate', 'editdate', 'isenable', 'note')

class SkillAdmin(ImportExportModelAdmin):
    resource_classes = [SkillResource]

admin.site.register(Skill, SkillAdmin)

# Activity
class ActivityResource(resources.ModelResource):
    keynameskill = fields.Field(
        column_name='keynameskill',
        attribute='keynameskill',
        widget=ForeignKeyWidget(
            Skill, field='keyname'
        )
    )
    class Meta:
        model = Activity
        import_id_fields = ('activityid','keynameskill', 'competenceid','keyname','name','requirement','description','createdate', 'editdate', 'isenable', 'note')
        export_order = ('activityid','keynameskill', 'competenceid','keyname','name','requirement','description','createdate', 'editdate', 'isenable', 'note')

class ActivityAdmin(ImportExportModelAdmin):
    resource_classes = [ActivityResource]

admin.site.register(Activity, ActivityAdmin)

# QuestionAndHint
class QuestionAndHintResource(resources.ModelResource):
    keynameactivity = fields.Field(
        column_name='keynameactivity',
        attribute='keynameactivity',
        widget=ForeignKeyWidget(
            Activity, field='keyname'
        )
    )
    class Meta:
        model = QuestionAndHint
        import_id_fields = ('questionandhintid','keynameactivity','typequestion','contentquestion','contenthint','scorebase','typegroup','createdate', 'editdate', 'isenable', 'note')
        export_order = ('questionandhintid','keynameactivity','typequestion','contentquestion','contenthint','scorebase','typegroup','createdate', 'editdate', 'isenable', 'note')

class QuestionAndHintAdmin(ImportExportModelAdmin):
    resource_classes = [QuestionAndHintResource]

admin.site.register(QuestionAndHint, QuestionAndHintAdmin)