from rest_framework.viewsets import ModelViewSet
from . import serializers
from . import models


# Create your views here.

class IndexCarouselView(ModelViewSet):
    """
    对首页轮播图的增、删、改、查
    """
    serializer_class = serializers.IndexCarouselSerializer
    queryset = models.IndexCarousel.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'product']


class IndexSeckillView(ModelViewSet):
    """
    对首页秒杀的增、删、改、查
    """
    serializer_class = serializers.IndexSeckillSerializer
    queryset = models.IndexSeckill.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'product']


class IndexSuggestView(ModelViewSet):
    """
    对首页推荐的增、删、改、查
    """
    serializer_class = serializers.IndexSuggestSerializer
    queryset = models.IndexSuggest.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'product']
