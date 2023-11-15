from django.urls import path, include, re_path
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register('all', views.ProductView, basename='product')
router.register('type', views.ProductTypeView, basename='product')
router.register('image', views.ProductImageView, basename='product')

urlpatterns = [
    path('product/', include(router.urls)),
]
