from rest_framework import serializers
from . import models
from product.serializers import ProductSerializer


class AccountSerializer(serializers.ModelSerializer):
    level_info = serializers.SerializerMethodField()
    date_joined = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)

    class Meta:
        model = models.Account
        fields = "__all__"
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def get_level_info(self, obj):
        return obj.get_level_display()


class ShopSerializer(serializers.ModelSerializer):
    account_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.Shop
        fields = "__all__"
        extra_kwargs = {
            'account_id': {
                'write_only': True
            }
        }

    def get_account_info(self, obj):
        ser = AccountSerializer(instance=obj.account)
        return ser.data


class ShopProductSerializer(serializers.ModelSerializer):
    account_info = serializers.SerializerMethodField(read_only=True)
    shop_info = serializers.SerializerMethodField(read_only=True)
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.ShopProduct
        fields = "__all__"

    def get_account_info(self, obj):
        ser = AccountSerializer(instance=obj.account)
        return ser.data

    def get_shop_info(self, obj):
        ser = ShopSerializer(instance=obj.shop)
        return ser.data

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data
