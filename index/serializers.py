from rest_framework import serializers
from . import models
from product.serializers import ProductSerializer


class IndexCarouselSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.IndexCarousel
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data


class IndexSeckillSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.IndexSeckill
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data


class IndexSuggestSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.IndexSuggest
        fields = "__all__"

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data
