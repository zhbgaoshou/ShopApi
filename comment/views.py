from rest_framework.viewsets import ModelViewSet
from . import serializers
from . import models


# Create your views here.

class CommentView(ModelViewSet):
    """
    对评论表的增、删、改、查
    """
    serializer_class = serializers.CommentSerializer
    queryset = models.Comment.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'product', 'user']
    search_fields = ['title']


class CommentImageView(ModelViewSet):
    """
    对评论图片表的增、删、改、查
    """
    serializer_class = serializers.CommentImageSerializer
    queryset = models.CommentImage.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['comment']


class CommentUpvoteView(ModelViewSet):
    """
    对点赞(评论)表的增、删、改、查
    """
    serializer_class = serializers.CommentUpvoteSerializer
    queryset = models.CommentUpvote.objects.all()
    ordering_fields = "__all__"
    ordering = ['id']
    filterset_fields = ['id', 'comment', 'user']
    search_fields = ['count']
