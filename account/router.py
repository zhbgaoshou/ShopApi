from django.urls import path
from rest_framework.routers import DefaultRouter
from . import views
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


def account_router():
    router = DefaultRouter()
    router.register('account', views.AccountView)
    router.register('account_shop', views.ShopView)
    router.register('account_shop_product', views.ShopProductView)
    return router.urls


def account_info_router():
    urls = [
        path('api/token/register', views.RegisterView.as_view()),
        path('api/token/set_password/<int:aid>/', views.SetPasswordView.as_view()),
        path('api/token/userinfo', views.UserInfoView.as_view()),
        path('api/token/login', TokenObtainPairView.as_view()),
        path('api/token/refresh_token', TokenRefreshView.as_view())
    ]
    return urls
