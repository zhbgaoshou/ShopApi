from rest_framework.routers import DefaultRouter
from . import views


def coupon_router():
    router = DefaultRouter()
    router.register('coupon', views.CouponView, basename='coupon')
    return router.urls
