from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from . import serializers


# Create your views here.


class SalesOrderView(APIView):
    def get(self, request):

        return Response({'message': '请求成功'})


class ProductProportionView(APIView):
    def get(self, request):
        return Response({'message': '请求成功'})


class SevenDayRegisterView(APIView):
    def get(self, request):
        return Response({'message': '请求成功'})
