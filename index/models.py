from django.db import models
from product.models import Product


# Create your models here.
class IndexCarousel(models.Model):
    """
    首页轮播图产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='轮播图产品', help_text='产品ID')
    image = models.ImageField(upload_to='static/index/images')


class IndexSeckill(models.Model):
    """
    首页秒杀产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='秒杀区产品', help_text='产品ID')


class IndexSuggest(models.Model):
    """
    首页推荐产品
    """
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, verbose_name='首页推荐产品', help_text='产品ID')
