from rest_framework import serializers
from . import models


class SalesOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.SalesOrder
        fields = "__all__"


class ProductProportionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.ProductProportion
        fields = "__all__"


class SevenDayRegister(serializers.ModelSerializer):
    class Meta:
        model = models.SevenDayRegister
        fields = "__all__"
