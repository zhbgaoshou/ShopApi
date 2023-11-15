from django.db import models


# Create your models here.

class Coupon(models.Model):
    """
    优惠券表
    """
    status_choices = ((0, '官方优惠券'), (1, '店铺优惠券'))
    price = models.DecimalField(verbose_name='优惠券金额', help_text='优惠券金额', max_digits=10, decimal_places=1)
    valve = models.IntegerField(verbose_name='门槛', help_text='门槛,0为无门槛')
    start_time = models.BigIntegerField(verbose_name='有效开始时间', help_text='有效开始时间(时间戳)')
    end_time = models.BigIntegerField(verbose_name='有效结束时间', help_text='有效结束时间(时间戳)')
    count = models.IntegerField(help_text='库存', verbose_name='库存')
    status = models.SmallIntegerField(choices=status_choices, help_text='优惠券类型(0:官方优惠券,1:店铺优惠券)', verbose_name='优惠券类型')
