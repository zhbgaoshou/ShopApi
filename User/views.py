from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from . import models
from . import serializers
import requests


# Create your views here.

class OpenIdView(APIView):
    def get(self, request):
        codeId = request.query_params.get('codeId')
        url = 'https://api.weixin.qq.com/sns/jscode2session'
        params = {
            'appid': 'wx9674c609e85cacac',
            'secret': '5878e672812d914734b7e9be1c09e2ed',
            'js_code': codeId,
            'grant_type': 'authorization_code'
        }
        response = requests.get(url=url, params=params)
        response.encoding = 'utf-8'

        return Response(response.json())


class WxUserView(ModelViewSet):
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
    filterset_fields = ['user']


class UserOrderView(ModelViewSet):
    queryset = models.UserOrder.objects.all()
    serializer_class = serializers.UserOrderSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['order_number', 'user', 'status', 'product']


class UserAssetView(ModelViewSet):
    """
    用户余额管理
    """
    queryset = models.UserAsset.objects.all()
    serializer_class = serializers.UserAssetSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['user']


class AfterSaleView(ModelViewSet):
    queryset = models.AfterSale.objects.all()
    serializer_class = serializers.AfterSaleSerializer
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['user', 'product', 'after_sale_status']
    search_fields = ['cause']
