from rest_framework.viewsets import ModelViewSet
from . import serializers
from . import models
from .filters import ProductFileter


# Create your views here.

class ProductView(ModelViewSet):
    """
    对产品表的增、删、改、查
    """
    queryset = models.Product.objects.all().order_by('id')
    serializer_class = serializers.ProductSerializer
    filterset_class = ProductFileter
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'type']
    search_fields = ['title', 'description']


class ProductTypeView(ModelViewSet):
    """
    对产品分类表的增、删、改、查
    """
    serializer_class = serializers.ProductTypeSerializer
    queryset = models.Type.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id']
    search_fields = ['className']


class ProductImageView(ModelViewSet):
    """
        对产品图片表的增、删、改、查
        注意：产品表有数据才能对这张表进行操作
        """
    serializer_class = serializers.ProductImageSerializer
    queryset = models.ProductImg.objects.all()
    filterset_fields = ['product', 'img_type']
    ordering_fields = "__all__"
    ordering = ['id']


class ProductPropertyView(ModelViewSet):
    """
    产品规格视图
    """
    serializer_class = serializers.ProductPropertySerializer
    queryset = models.ProductProperty.objects.all()
    filterset_fields = ['product', 'id']
    ordering_fields = "__all__"
    ordering = ['id']
    search_fields = ['property_name']


class ProductPropertyGroupView(ModelViewSet):
    """
    产品SKU视图
    """
    serializer_class = serializers.ProductPropertyGroupSerializer
    queryset = models.ProductPropertyGroup.objects.all()
    filterset_fields = ['product', 'id', 'group']
    ordering_fields = "__all__"
    ordering = ['id']
