import os

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.dispatch import receiver
from product.models import Product
from django.db.models.signals import post_delete


# Create your models here.
class Account(AbstractUser):
    """
    客户表
    """
    level_choices = ((3, 'admin'), (2, 'editor'), (1, 'other'))
    level = models.SmallIntegerField(choices=level_choices, default=1, verbose_name='级别',
                                     help_text="角色/身份(3, 'admin'), (2, 'editor'), (1, 'other')")
    avatar = models.ImageField(verbose_name='头像', null=True, blank=True, default=None,
                               upload_to='static/account/avatar/images/%Y-%m-%d', help_text='客户头像')


class Shop(models.Model):
    """
    客户的店铺表
    """
    account = models.ForeignKey(to='Account', on_delete=models.CASCADE, null=True, blank=True, default=None,
                                help_text='客户ID')
    name = models.CharField(verbose_name='店铺名称', max_length=225, help_text='店铺名称')
    image = models.ImageField(verbose_name='图片地址', upload_to='static/account/shop/images/%Y-%m-%d', help_text='店铺的封面')
    score = models.SmallIntegerField(verbose_name='星级', default=1, help_text='店铺星级')
    description = models.TextField(verbose_name='店铺描述', help_text='店铺描述')


class ShopProduct(models.Model):
    """
    店铺产品表
    """
    account = models.ForeignKey(to='Account', on_delete=models.CASCADE, null=True, blank=True, default=None,
                                verbose_name='客户', help_text='客户ID')
    shop = models.ForeignKey(to=Shop, on_delete=models.CASCADE, verbose_name='店铺', help_text='店铺ID')
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, null=True, blank=True, default=None,
                                verbose_name='商品', help_text='产品ID')


@receiver(post_delete, sender=Shop)
def del_shop_static(sender, instance, **kwargs):
    image_path = instance.image.path
    if image_path and os.path.exists(image_path):
        os.remove(image_path)


@receiver(post_delete, sender=Account)
def del_shop_static(sender, instance, **kwargs):
    image_path = instance.avatar.path
    if image_path and os.path.exists(image_path):
        os.remove(image_path)
