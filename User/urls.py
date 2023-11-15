from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('address', views.UserAddressView)
router.register('order', views.UserOrderView)
router.register('cart', views.UserProductCartView)
router.register('all', views.WxUserView)

urlpatterns = [
    path('user/', include(router.urls)),
]
