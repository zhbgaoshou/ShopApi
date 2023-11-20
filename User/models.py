import os
from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver
from product.models import Product, ProductSpecGroup
from utils import utils


# Create your models here.

class WxUser(models.Model):
    """
    微信用户表
    """
    username = models.CharField(verbose_name='用户名', max_length=225, help_text='微信用户名字')
    openId = models.CharField(verbose_name='openId', max_length=100, help_text='openId')
    avatar = models.ImageField(verbose_name='微信头像', upload_to='static/User/images/%Y-%m-%d', help_text='用户头像')


class UserAddress(models.Model):
    """
    用户地址表
    """
    receiver = models.CharField(verbose_name='收件人姓名', max_length=32, help_text='收件人姓名')
    address = models.CharField(verbose_name='收货地址', help_text='收货地址', max_length=225)
    cellphone = models.CharField(verbose_name='收件人手机号', help_text='收件人手机号', max_length=11)
    is_default = models.BooleanField(verbose_name='是否默认地址', help_text='是否默认地址', default=False)
    create_time = models.DateTimeField(verbose_name='创建时间', help_text='创建时间', null=True, blank=True,
                                       auto_now_add=True)
    user = models.ForeignKey(to='WxUser', on_delete=models.CASCADE, null=True, blank=True, default=None,
                             verbose_name='用户', help_text='用户ID')


class UserProductCart(models.Model):
    """
    用户购物车表
    """
    count = models.IntegerField(verbose_name='购买数量', help_text='购买数量')
    user = models.ForeignKey(verbose_name='用户', help_text='用户ID', null=True, blank=True, default=None, to='WxUser',
                             on_delete=models.CASCADE)
    product = models.ForeignKey(to=Product, verbose_name='商品', null=True, blank=True, default=None,
                                help_text='商品ID', on_delete=models.CASCADE)
    spec = models.ForeignKey(to=ProductSpecGroup, verbose_name='规格',null=True, blank=True, default=None,
                             help_text='商品规格ID', on_delete=models.CASCADE)


class UserOrder(models.Model):
    """
    用户订单表
    """

    status_choices = ((1, '等待付款'), (2, '等待发货'), (3, '运输中'), (4, "已签收"), (5, '已取消'))
    order_number = models.BigIntegerField(verbose_name='订单号', default=utils.generate_order_number)
    user = models.ForeignKey(to='WxUser', null=True, blank=True, default=None, on_delete=models.CASCADE,
                             help_text='用户ID', verbose_name='用户')
    status = models.SmallIntegerField(choices=status_choices, default=1, verbose_name='订单状态',
                                      help_text="订单状态(1, '等待付款'), (2, '等待发货'), (3, '运输中'), (4, '已签收'), (5, '已取消')")
    order_time = models.BigIntegerField(verbose_name='下单时间', help_text='下单时间', null=True, blank=True)
    pay_time = models.BigIntegerField(verbose_name='支付时间', help_text='支付时间', null=True, blank=True)
    deliver_time = models.BigIntegerField(verbose_name='发货时间', help_text='发货时间', null=True, blank=True)
    received_time = models.BigIntegerField(verbose_name='签收时间', help_text='签收时间', null=True, blank=True)
    postage = models.DecimalField(verbose_name='运费', help_text='运费', max_digits=10, decimal_places=2, default=0,
                                  null=True, blank=True)
    product = models.ForeignKey(to=Product, null=True, blank=True, default=None, verbose_name='商品',
                                help_text='商品ID', on_delete=models.CASCADE)


@receiver(post_delete, sender=WxUser)
def del_static(sender, instance, **kwargs):
    if instance.avatar:
        image_path = instance.avatar.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)
