from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()

router.register('all', views.AccountView, basename='account')
router.register('shop', views.ShopView, basename='account')
router.register('shop_product', views.ShopProductView, basename='account')

urlpatterns = [
    path('account/', include(router.urls)),
    path('account/setpassword/<int:aid>/', views.SetPassword.as_view())
]


