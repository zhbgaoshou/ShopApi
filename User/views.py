from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import WxUserSerializer
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import mixins
from . import models
from . import serializers


# Create your views here.

class WxUserView(GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin, mixins.RetrieveModelMixin):
    queryset = models.WxUser.objects.all()
    serializer_class = serializers.WxUserSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['openId']
    search_fields = ['username']


class UserAddressView(ModelViewSet):
    queryset = models.UserAddress.objects.all()
    serializer_class = serializers.UserAddressSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['user']
    search_fields = ['receiver', 'address', 'cellphone']


class UserProductCartView(ModelViewSet):
    queryset = models.UserProductCart.objects.all()
    serializer_class = serializers.UserProductCartSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['user', 'product']


class UserOrderView(ModelViewSet):
    queryset = models.UserOrder.objects.all()
    serializer_class = serializers.UserOrderSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['order_number', 'user', 'status', 'product']
