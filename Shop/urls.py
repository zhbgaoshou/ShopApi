from django.contrib import admin
from django.urls import path, include
from .routers import Routers
from account.router import account_info_router
from doc.router import doc_router

urlpatterns = [
    path("admin/", admin.site.urls),
    path('api/', include(Routers.get_router())),
    path('chat/', include('chat.urls'))
]

# token路由和文档路由
urlpatterns += account_info_router() + doc_router()
