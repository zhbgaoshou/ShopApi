import re
from rest_framework import serializers
from . import models
from product.serializers import ProductSerializer


class WxUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.WxUser
        fields = ['id', 'username', 'openId', 'avatar']
        extra_kwargs = {
            'id': {'read_only': True},
        }


class UserAddressSerializer(serializers.ModelSerializer):
    userInfo = WxUserSerializer(read_only=True, source='user')

    class Meta:
        model = models.UserAddress
        fields = ['receiver', 'address', 'cellphone', 'is_default', 'create_time', 'user', 'userInfo']


class UserProductCartSerializer(serializers.ModelSerializer):
    userInfo = WxUserSerializer(read_only=True, source='user')
    productInfo = WxUserSerializer(read_only=True, source='product')

    class Meta:
        model = models.UserProductCart
        fields = ['count', 'user', 'userInfo', 'product', 'productInfo']


class UserOrderSerializer(serializers.ModelSerializer):
    status_info = serializers.SerializerMethodField()

    class Meta:
        model = models.UserOrder
        fields = "__all__"
        extra_kwargs = {
            "order_number": {
                "read_only": True
            }
        }

    def get_status_info(self, data):

        return data.get_status_display()
