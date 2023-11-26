from rest_framework import serializers

from . import models


class WxUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.WxUser
        fields = ['id', 'username', 'openId', 'avatar']
        extra_kwargs = {
            'id': {'read_only': True},
        }


class UserAssetSerializer(serializers.ModelSerializer):
    user_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.UserAsset
        fields = '__all__'

    def get_user_info(self, obj):
        ser = WxUserSerializer(instance=obj.user)
        return ser.data


class UserAddressSerializer(serializers.ModelSerializer):
    userInfo = WxUserSerializer(read_only=True, source='user')
    create_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = models.UserAddress
        fields = ['id', 'receiver', 'address', 'cellphone', 'is_default', 'create_time', 'user', 'userInfo']


class UserProductCartSerializer(serializers.ModelSerializer):
    user_info = serializers.SerializerMethodField(read_only=True)
    product_info = serializers.SerializerMethodField(read_only=True)
    spec_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.UserProductCart
        fields = "__all__"

    @staticmethod
    def get_user_info(obj):
        ser = WxUserSerializer(instance=obj.user)
        return ser.data

    @staticmethod
    def get_product_info(obj):
        ser = WxUserSerializer(instance=obj.product)
        return ser.data

    @staticmethod
    def get_spec_info(obj):
        ser = WxUserSerializer(instance=obj.spec)
        return ser.data


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

    @staticmethod
    def get_status_info(data):
        return data.get_status_display()
