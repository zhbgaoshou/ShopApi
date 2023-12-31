from rest_framework.routers import DefaultRouter
from . import views


def product_router():
    router = DefaultRouter()

    router.register('product', views.ProductView, basename='product')
    router.register('product_type', views.ProductTypeView, basename='product')
    router.register('product_image', views.ProductImageView, basename='product')
    router.register('product_spec', views.ProductSpecView, basename='product')
    router.register('product_spec_group', views.ProductSpecGroupView, basename='product')
    router.register('product_category1', views.Category1View, basename='product')
    router.register('product_category2', views.Category2View, basename='product')

    return router.urls
