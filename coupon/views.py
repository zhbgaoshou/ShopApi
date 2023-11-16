from rest_framework.viewsets import ModelViewSet
from . import serializers
from . import models


# Create your views here.

class CouponView(ModelViewSet):
    """
    对优惠券表的增、删、改、查
    """
    serializer_class = serializers.CouponSerializer
    queryset = models.Coupon.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['status']
    search_fields = ['valve']
