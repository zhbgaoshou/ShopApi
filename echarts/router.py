from django.urls import path
from . import views


def echarts_router():
    urls = [
        path('api/echarts/SalesOrder', views.SalesOrderView.as_view()),
        path('api/echarts/ProductProportion', views.ProductProportionView.as_view()),
        path('api/echarts/RegisterData', views.SevenDayRegisterView.as_view())
    ]
    return urls
