from rest_framework.routers import DefaultRouter
from . import views


def user_router():
    router = DefaultRouter()
    router.register('user_address', views.UserAddressView)
    router.register('user_order', views.UserOrderView)
    router.register('user_cart', views.UserProductCartView)
    router.register('user_asset', views.UserAssetView),
    router.register('user', views.WxUserView)
    return router.urls
