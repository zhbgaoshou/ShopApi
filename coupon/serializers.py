from rest_framework import serializers
from . import models


class CouponSerializer(serializers.ModelSerializer):
    coupon_status = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.Coupon
        fields = "__all__"

    def get_coupon_status(self, obj):
        return obj.get_status_display()
