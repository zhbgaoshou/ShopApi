from rest_framework.routers import DefaultRouter
from . import views


def index_router():
    router = DefaultRouter()

    router.register('index_page_carousel', views.IndexCarouselView, basename='index')
    router.register('index_page_seckill', views.IndexSeckillView, basename='index')
    router.register('index_page_suggest', views.IndexSuggestView, basename='index')
    return router.urls

