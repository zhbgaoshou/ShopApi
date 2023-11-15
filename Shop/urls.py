from django.contrib import admin
from django.urls import path, include

from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

from rest_framework.documentation import include_docs_urls

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from account import views

schema_view = get_schema_view(
    openapi.Info(
        title="API文档",
        default_version='v1',
        description="API文档描述",
        terms_of_service="https://www.example.com/policies/terms/",
        contact=openapi.Contact(email="contact@example.com"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=[permissions.AllowAny]
)

urlpatterns = [
    path("admin/", admin.site.urls),
    path('api/', include('User.urls')),
    path('api/', include('product.urls')),
    path('api/', include('account.urls')),
    path('api/', include('comment.urls')),
    path('api/', include('index.urls')),
    path('api/', include('coupon.urls')),
    # 登录返回Token
    path('api/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # 刷新Token
    path('api/token/refresh', TokenRefreshView.as_view(), name='token_refresh'),
    # 获取客户信息(v2版本，需要携带Token)
    path('api/userinfo/', views.UserInfo.as_view()),
    path('docs/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('docs/coreapi/', include_docs_urls(title='天使童装接口文档'))
]
