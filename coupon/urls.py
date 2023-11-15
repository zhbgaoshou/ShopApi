from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register('all', views.CouponView, basename='coupon')

urlpatterns = [
    path('coupon/', include(router.urls))
]
