import re

import django_filters
from . import models
from rest_framework.exceptions import ValidationError


class ProductSpecGroupFileter(django_filters.FilterSet):
    group = django_filters.CharFilter(method='group_filter')

    class Meta:
        model = models.ProductSpecGroup
        fields = ['group', 'product']

    def group_filter(self, queryset, name, value):
        set1 = set(value.split("|"))
        for query in queryset:
            set2 = set(query.group.split("|"))
            if set1 == set2:
                return queryset.filter(group=query.group)
        raise ValidationError({"msg":'规格组不存在,请通过笛卡尔乘积或者其他方法计算然后上传到数据库'})
