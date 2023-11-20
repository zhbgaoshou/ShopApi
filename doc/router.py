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
       # 天使童装API接口文档说明

+++

### 接口调用注意事项

+ 后台管理系统跟前台的权限不一样，后台管理系统所有的操作都需要token才能进行，而前台则不需要任何权限就能访问接口，所以需要再请求头加上版本信息，比如 `Accept:application/json; version=v2`
+ 数据库层面我应用了外键，但是都是可以为空的，如果你不确定从表是否有数据那就先不要填写外键，等后面从表加了数据在回来修改，以免报错
+ 这是第一版接口，有什么建议可以跟我说，我到时候再弄
+ 关于登录注册等接口跟token相关的接口我写在token模块里面，原因是为了方便管理
+ **接口前缀记得要加 api** 例子:`http://112.74.75.211:8000/api`





### 模块

+ **account 客户模块：**

	-- account:客户管理

	-- account_shop:客户的店铺

	-- account_shop_product:店铺里面的商品

+ **comment 评论模块：**

   -- comment:评论

   -- comment_image:评论图片

   -- comment_upvote:评论点赞

+ **coupon 优惠券模块：**

   -- coupon:评论管理

+ **index 首页模块：**

   -- index_page_carousel：首页轮播图

   -- index_page_seckill：首页秒杀

   -- index_page_suggest：首页推荐

+ **product 产品模块：**

   -- product：产品管理

   -- product_image：产品图片管理

   -- product_spec：产品规格管理

   -- product_spec_group：产品规格组合(SKU)管理

   -- product_type：产品分类管理(只有一级分类)

+ **token 模块：**

   --跟客户相关的请求，具体看文档或者问我

+ **user 微信用户模块：**

   -- user:微信用户管理

   -- user_address:用户地址管理

   -- user_cart:用户购物车管理

   -- user_order:用户订单管理
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
        path('docs/coreapi/',
             include_docs_urls(title='天使童装接口文档', permission_classes=[], authentication_classes=[]))
    ]
    return doc_urls
