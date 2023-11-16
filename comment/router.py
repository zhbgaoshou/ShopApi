from rest_framework.routers import DefaultRouter
from . import views


def comment_router():
    router = DefaultRouter()

    router.register('comment', views.CommentView, basename='comment')
    router.register('comment_image', views.CommentImageView, basename='comment')
    router.register('comment_upvote', views.CommentUpvoteView, basename='comment')
    return router.urls
