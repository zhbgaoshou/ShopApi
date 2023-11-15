from rest_framework import serializers
from . import models
from product.serializers import ProductSerializer
from User.serializers import WxUserSerializer


class CommentSerializer(serializers.ModelSerializer):
    product_info = serializers.SerializerMethodField(read_only=True)
    user_info = serializers.SerializerMethodField(read_only=True)
    upvote = serializers.SerializerMethodField(read_only=True, default=0)

    class Meta:
        model = models.Comment
        fields = "__all__"
        extra_kwargs = {
            "upvote": {"read_only": True}
        }

    def get_product_info(self, obj):
        ser = ProductSerializer(instance=obj.product)
        return ser.data

    def get_user_info(self, obj):
        ser = WxUserSerializer(instance=obj.user)
        return ser.data

    def get_upvote(self, obj):
        return 0


class CommentImageSerializer(serializers.ModelSerializer):
    comment_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.CommentImage
        fields = "__all__"

    def get_comment_info(self, obj):
        ser = CommentSerializer(instance=obj.comment)
        return ser.data


class CommentUpvoteSerializer(serializers.ModelSerializer):
    comment_info = serializers.SerializerMethodField(read_only=True)
    user_info = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = models.CommentUpvote
        fields = "__all__"

    def get_comment_info(self, obj):
        ser = CommentSerializer(instance=obj.comment)
        return ser.data

    def get_user_info(self, obj):
        ser = WxUserSerializer(instance=obj.user)
        return ser.data
