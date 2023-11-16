from django.urls import path
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from rest_framework.documentation import include_docs_urls
from rest_framework import permissions


schema_view = get_schema_view(
    openapi.Info(
        title="API文档",
        default_version='v1',
        description="""
        天使童装API文档描述
        
        **接口调用事项**
        
            1.后台管理系统跟前台的权限不一样，后台管理系统所有的操作都需要token才能进行，而前台则不需要任何权限就能访问接口，所以需要再请求头加上版本信息，比如
        
                Accept:application/json; version=v2
        
            2.数据库层面我应用了外键，但是都是可以为空的，如果你不确定从表是否有数据那就先不要填写外键，等后面从表加了数据在回来修改，以免报错
            
            3.这是第一版接口，有什么建议可以跟我说，我到时候再弄
            
            4.关于登录注册等接口跟token相关的接口我写在token模块里面，原因是为了方便管理
        
        """,
        terms_of_service="https://www.example.com/policies/terms/",
        contact=openapi.Contact(email="contact@example.com"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=[permissions.AllowAny]
)


def doc_router():
    doc_urls = [
        path('docs/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
        path('docs/coreapi/', include_docs_urls(title='天使童装接口文档', permission_classes=[], authentication_classes=[]))
    ]
    return doc_urls
