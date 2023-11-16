from django.utils.decorators import method_decorator
from drf_yasg.utils import swagger_auto_schema
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from . import serializers
from . import models
from rest_framework.mixins import ListModelMixin, DestroyModelMixin, RetrieveModelMixin


class AccountView(GenericViewSet, ListModelMixin, DestroyModelMixin, RetrieveModelMixin):
    """
    对客户表的增、删、改、查
    """
    serializer_class = serializers.AccountSerializer
    queryset = models.Account.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    search_fields = ['username']


class RegisterView(APIView):
    """
    客户注册
    """

    def post(self, request):
        ser = serializers.AccountSerializer(data=request.data)
        if ser.is_valid():
            # ser.validated_data
            data = models.Account.objects.create_user(**ser.validated_data)
            ser.instance = data
            return Response(ser.data)
        else:
            return Response(ser.errors)


class SetPasswordView(APIView):
    """
    修改客户密码
    """

    def post(self, request, aid):
        pwd = request.data.get('password')
        try:
            u = models.Account.objects.get(pk=aid)
        except models.Account.DoesNotExist:
            return Response({'msg': '用户不存在'}, status=404)
        if u:
            u.set_password(pwd)
            u.save()
            ser = serializers.AccountSerializer(instance=u)
            return Response({'msg': '修改成功', "data": ser.data})
        else:
            pass


class UserInfoView(APIView):
    """
    获取客户的信息，需要携带v2版本和token(放在请求头)
    比如：Authorization + Bearer + token
    """

    def get(self, request):
        ser = serializers.AccountSerializer(instance=request.user)
        print(ser.data)
        return Response(ser.data)


@method_decorator(name="list", decorator=swagger_auto_schema(
    operation_summary='获取客户店铺信息',
    operation_description='获取客户店铺信息\n'
                          '注：需要登录',
))
@method_decorator(name="create", decorator=swagger_auto_schema(
    operation_summary='添加店铺信息',
    operation_description='添加店铺信息',
    request_body=serializers.ShopSerializer
))
@method_decorator(name="update", decorator=swagger_auto_schema(
    operation_summary='修改店铺信息',
    operation_description='应答和 PATCH 方法相同，但 PUT 要求在请求中提交所有信息，不推荐使用',
    request_body=serializers.ShopSerializer
))
class ShopView(ModelViewSet):
    """
    对客户店铺表的增、删、改、查
    """

    serializer_class = serializers.ShopSerializer
    queryset = models.Shop.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['account', 'score']
    search_fields = ['name', 'description']


class ShopProductView(ModelViewSet):
    """
    对客户店铺表的增、删、改、查
    """
    serializer_class = serializers.ShopProductSerializer
    queryset = models.ShopProduct.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['account', 'shop', 'product']
