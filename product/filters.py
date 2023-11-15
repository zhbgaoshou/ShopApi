import django_filters
from . import models


class ProductFileter(django_filters.FilterSet):
    title = django_filters.CharFilter(lookup_expr='icontains')  # title字段按照模糊查询

    class Meta:
        model = models.Product
        fields = ['title', "id"]
