import os
from datetime import timedelta
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = "django-insecure-@1@47z5c6a63^4avv=l$6efw%ox5#fw9m-6j=khvvk**!np@"

DEBUG = False

ALLOWED_HOSTS = ["*"]


CORS_ALLOW_CREDENTIALS = True
# CORS_ORIGIN_WHITELIST = ["http://127.0.0.1:8080",["http://192.168.10.1:8080"]  # 指定能够访问后端接口的ip或域名列表
CORS_ORIGIN_ALLOW_ALL = True


# 允许访问的请求方法
CORS_ALLOW_METHODS = (
    'DELETE',
    'GET',
    'OPTIONS',
    'PATCH',
    'POST',
    'PUT',
    'VIEW',
)

# 允许的headers
CORS_ALLOW_HEADERS = (
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
)

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    'rest_framework',
    'rest_framework_simplejwt',
    'django_filters',
    'User',
    'product',
    'account',
    'comment',
    'coupon',
    'index',
    'coreapi',
    'drf_yasg',
    "corsheaders",
    'chat',
    'echarts',
    'channels'
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "Shop.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "Shop.wsgi.application"
# ASGI_APPLICATION = "Shop.routing.application"

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "shop",
        "USER": "root",
        "PASSWORD": "123456",
        "HOST": "127.0.0.1",
        "PORT": '3306',
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]

LANGUAGE_CODE = "zh-hans"

TIME_ZONE = "Asia/Shanghai"

USE_I18N = True

USE_TZ = True

# 认证模型类
AUTH_USER_MODEL = 'account.Account'

STATIC_URL = "static/"
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

# STATICFILES_DIRS = [
#     os.path.join(BASE_DIR, 'static'),
# ]

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

REST_FRAMEWORK = {
    # 认证
    "DEFAULT_AUTHENTICATION_CLASSES": ["rest_framework_simplejwt.authentication.JWTAuthentication"],

    # 权限
    "DEFAULT_PERMISSION_CLASSES": ['Shop.permissions.VersionPermission'],

    # schemas
    'DEFAULT_SCHEMA_CLASS': 'rest_framework.schemas.coreapi.AutoSchema',

    # 分页
    'DEFAULT_PAGINATION_CLASS': 'Shop.paginations.PublicPagination',

    # 'PAGE_SIZE': 20,

    # 渲染器
    'DEFAULT_RENDERER_CLASSES': ['Shop.renderer.PublicRenderer'],

    # 版本
    'DEFAULT_VERSIONING_CLASS': 'rest_framework.versioning.AcceptHeaderVersioning',
    'DEFAULT_VERSION': 'v1',
    'ALLOWED_VERSIONS': ['v1', 'v2'],

    # 分页or排序
    'DEFAULT_FILTER_BACKENDS': [
        'django_filters.rest_framework.DjangoFilterBackend',
        'rest_framework.filters.OrderingFilter',
        'rest_framework.filters.SearchFilter'
    ],
    'SEARCH_PARAM': 'search_value'
}

# JWT配置
SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(days=7),  # Access Token的有效期
    'REFRESH_TOKEN_LIFETIME': timedelta(days=30),  # Refresh Token的有效期

    # 对于大部分情况，设置以上两项就可以了，以下为默认配置项目，可根据需要进行调整

    # 是否自动刷新Refresh Token
    'ROTATE_REFRESH_TOKENS': False,
    # 刷新Refresh Token时是否将旧Token加入黑名单，如果设置为False，则旧的刷新令牌仍然可以用于获取新的访问令牌。需要将'rest_framework_simplejwt.token_blacklist'加入到'INSTALLED_APPS'的配置中
    'BLACKLIST_AFTER_ROTATION': False,
    'ALGORITHM': 'HS256',  # 加密算法
    'SIGNING_KEY': SECRET_KEY,  # 签名密匙，这里使用Django的SECRET_KEY
    # 如为True，则在每次使用访问令牌进行身份验证时，更新用户最后登录时间
    "UPDATE_LAST_LOGIN": False,
    # 用于验证JWT签名的密钥返回的内容。可以是字符串形式的密钥，也可以是一个字典。
    "VERIFYING_KEY": "",
    "AUDIENCE": None,  # JWT中的"Audience"声明,用于指定该JWT的预期接收者。
    "ISSUER": None,  # JWT中的"Issuer"声明，用于指定该JWT的发行者。
    "JSON_ENCODER": None,  # 用于序列化JWT负载的JSON编码器。默认为Django的JSON编码器。
    "JWK_URL": None,  # 包含公钥的URL，用于验证JWT签名。
    "LEEWAY": 0,  # 允许的时钟偏差量，以秒为单位。用于在验证JWT的过期时间和生效时间时考虑时钟偏差。
    # 用于指定JWT在HTTP请求头中使用的身份验证方案。默认为"Bearer"
    "AUTH_HEADER_TYPES": ("Bearer",),
    # 包含JWT的HTTP请求头的名称。默认为"HTTP_AUTHORIZATION"
    "AUTH_HEADER_NAME": "HTTP_AUTHORIZATION",
    # 用户模型中用作用户ID的字段。默认为"id"。
    "USER_ID_FIELD": "id",
    # JWT负载中包含用户ID的声明。默认为"user_id"。
    "USER_ID_CLAIM": "user_id",

    # 用于指定用户身份验证规则的函数或方法。默认使用Django的默认身份验证方法进行身份验证。
    "USER_AUTHENTICATION_RULE": "rest_framework_simplejwt.authentication.default_user_authentication_rule",
    #  用于指定可以使用的令牌类。默认为"rest_framework_simplejwt.tokens.AccessToken"。
    "AUTH_TOKEN_CLASSES": ("rest_framework_simplejwt.tokens.AccessToken",),
    # JWT负载中包含令牌类型的声明。默认为"token_type"。
    "TOKEN_TYPE_CLAIM": "token_type",
    # 用于指定可以使用的用户模型类。默认为"rest_framework_simplejwt.models.TokenUser"。
    "TOKEN_USER_CLASS": "rest_framework_simplejwt.models.TokenUser",
    # JWT负载中包含JWT ID的声明。默认为"jti"。
    "JTI_CLAIM": "jti",

    # 在使用滑动令牌时，JWT负载中包含刷新令牌过期时间的声明。默认为"refresh_exp"。
    "SLIDING_TOKEN_REFRESH_EXP_CLAIM": "refresh_exp",
    # 滑动令牌的生命周期。默认为5分钟。
    "SLIDING_TOKEN_LIFETIME": timedelta(minutes=5),
    # 滑动令牌可以用于刷新的时间段。默认为1天。
    "SLIDING_TOKEN_REFRESH_LIFETIME": timedelta(days=1),
    # 用于生成访问令牌和刷新令牌的序列化器。
    "TOKEN_OBTAIN_SERIALIZER": "rest_framework_simplejwt.serializers.TokenObtainPairSerializer",
    # 用于刷新访问令牌的序列化器。默认
    "TOKEN_REFRESH_SERIALIZER": "rest_framework_simplejwt.serializers.TokenRefreshSerializer",
    # 用于验证令牌的序列化器。
    "TOKEN_VERIFY_SERIALIZER": "rest_framework_simplejwt.serializers.TokenVerifySerializer",
    # 用于列出或撤销已失效JWT的序列化器。
    "TOKEN_BLACKLIST_SERIALIZER": "rest_framework_simplejwt.serializers.TokenBlacklistSerializer",
    # 用于生成滑动令牌的序列化器。
    "SLIDING_TOKEN_OBTAIN_SERIALIZER": "rest_framework_simplejwt.serializers.TokenObtainSlidingSerializer",
    # 用于刷新滑动令牌的序列化器。
    "SLIDING_TOKEN_REFRESH_SERIALIZER": "rest_framework_simplejwt.serializers.TokenRefreshSlidingSerializer",
}

# SWAGGER文档配置
SWAGGER_SETTINGS = {
    'DEFAULT_MODEL_RENDERING': 'example'
}

# channel layer配置
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels.layers.InMemoryChannelLayer",
    }
}


try:
    from .local_settings import *
except ModuleNotFoundError as e:
    pass
