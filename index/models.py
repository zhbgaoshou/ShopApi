import os

from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver

from product.models import Product


# Create your models here.
class IndexCarousel(models.Model):
    """
    首页轮播图产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='轮播图产品', help_text='产品ID',
                                null=True, blank=True, default=None)
    image = models.ImageField(upload_to='static/index/images/%Y-%m-%d')


class IndexSeckill(models.Model):
    """
    首页秒杀产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='秒杀区产品', help_text='产品ID',
                                null=True, blank=True, default=None)

    count = models.IntegerField(verbose_name='秒杀数量', help_text='秒杀数量(库存)', default=0, null=True, blank=True)

    sell = models.IntegerField(verbose_name='出售', help_text='出售数量', default=0, null=True, blank=True)

    surplus = models.IntegerField(verbose_name='剩余', help_text='剩余数量', default=0, null=True, blank=True)


class IndexSuggest(models.Model):
    """
    首页推荐产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='首页推荐产品', help_text='产品ID',
                                null=True, blank=True, default=None)


@receiver(post_delete, sender=IndexCarousel)
def del_static(sender, instance, **kwargs):
    if instance.image:
        image_path = instance.image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)
