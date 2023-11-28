from django.db import models
import random


# Create your models here.
class SalesOrder(models.Model):
    """
    订单销售图表数据
    """
    date = models.DateField(auto_now_add=True, verbose_name='日期', help_text='日期')
    order_count = models.IntegerField(verbose_name='订单数量', help_text='订单数量')
    order_money = models.IntegerField(verbose_name='订单金额', help_text='订单金额')


class ProductProportion(models.Model):
    """
    商品占比图表数据
    """
    product_name = models.CharField(max_length=20, verbose_name='商品名称', help_text='商品名称')
    count = models.IntegerField(verbose_name='数量', help_text='数量')


class SevenDayRegister(models.Model):
    """
    七日注册数量图表数据
    """
    date = models.DateField(auto_now_add=True, verbose_name='注册日期', help_text='注册日期')
    expected_register = models.IntegerField(verbose_name='预计注册量', help_text='预计注册量',
                                            default=random.randint(1, 20))
    register_count = models.IntegerField(verbose_name='实际注册量', help_text='实际注册量')
