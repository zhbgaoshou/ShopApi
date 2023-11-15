from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()

router.register('all', views.CommentView, basename='comment')
router.register('image', views.CommentImageView, basename='comment')
router.register('upvote', views.CommentUpvoteView, basename='comment')

urlpatterns = [
    path('comment/', include(router.urls)),
]


