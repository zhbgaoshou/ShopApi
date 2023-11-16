from rest_framework import serializers
from . import models


class ProductTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Type
        fields = ['id', 'className']
        extra_kwargs = {
            "id": {"read_only": True},
        }


class ProductSerializer(serializers.ModelSerializer):
    typeInfo = ProductTypeSerializer(read_only=True, source='type')

    class Meta:
        model = models.Product
        fields = ["id", "title", 'price', 'type', "typeInfo", 'cover']
        extra_kwargs = {
            "id": {"read_only": True},
        }


class ProductImageSerializer(serializers.ModelSerializer):
    type = serializers.CharField(source="get_img_type_display", read_only=True)
    type_status = serializers.IntegerField(source='img_type')
    product_data = ProductSerializer(read_only=True, source='product')

    class Meta:
        model = models.ProductImg
        fields = ["id", "type_status", "image", "type", "product", 'product_data']
        extra_kwargs = {
            "id": {"read_only": True},
        }


class ProductPropertySerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.ProductSpec
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data

    def validated_property(self, value):
        pass


class ProductPropertyGroupSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.ProductSpecGroup
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data

    def validated_group(self, value):
        pass
