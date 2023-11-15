from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()


router.register('carousel', views.IndexCarouselView, basename='index')
router.register('seckill', views.IndexSeckillView, basename='index')
router.register('suggest', views.IndexSuggestView, basename='index')

urlpatterns = [
    path('index/page/', include(router.urls)),
]


