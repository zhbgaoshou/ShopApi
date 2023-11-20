from rest_framework import serializers
from . import models


class Category1Serializer(serializers.ModelSerializer):
    class Meta:
        model = models.Category1
        fields = "__all__"


class Category2Serializer(serializers.ModelSerializer):
    category1_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.Category2
        fields = "__all__"

    def get_category1_info(self, obj):
        ser = Category1Serializer(instance=obj.category1)
        return ser.data


class ProductTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Type
        fields = ['id', 'className']
        extra_kwargs = {
            "id": {"read_only": True},
        }


class ProductSerializer(serializers.ModelSerializer):
    type_info = serializers.SerializerMethodField(read_only=True)
    category1_info = serializers.SerializerMethodField(read_only=True)
    category2_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.Product
        fields = "__all__"
        extra_kwargs = {
            "id": {"read_only": True},
        }

    def get_type_info(self, obj):
        ser = ProductTypeSerializer(instance=obj.type)
        return ser.data

    def get_category1_info(self, obj):
        ser = Category1Serializer(instance=obj.category1)
        return ser.data

    def get_category2_info(self, obj):
        ser = Category2Serializer(instance=obj.category2)
        return ser.data


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
    property_obj = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.ProductSpec
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data

    def validated_property(self, value):
        pass

    def get_property_obj(self, obj):
        return obj.property_name.split("|")


class ProductPropertyGroupSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.ProductSpecGroup
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data
