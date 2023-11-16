from django.db import models
from utils import utils


# Create your models here.
class Type(models.Model):
    """
    产品分类
    """
    className = models.CharField(verbose_name='产品分类', max_length=10, help_text='产品分类名字')


class ProductImg(models.Model):
    """
    产品图片
    """
    image_type_choices = ((0, '产品轮播'), (1, '产品详情'))
    image = models.ImageField(verbose_name='图片地址', upload_to='static/product/images', help_text='产品图片')
    img_type = models.SmallIntegerField(choices=image_type_choices, verbose_name='图片类型',
                                        help_text='图片类型(0:产品轮播,1:产品详情')
    product = models.ForeignKey(verbose_name='产品', to='Product', null=True, blank=True, default=None,
                                on_delete=models.CASCADE, help_text='产品ID')


class Product(models.Model):
    """
        产品表
    """
    title = models.CharField(verbose_name='标题', max_length=225, help_text='标题')
    price = models.DecimalField(verbose_name='价格', help_text='价格', max_digits=10, decimal_places=2,
                                default=0,
                                null=True, blank=True)
    type = models.ForeignKey(to='Type', null=True, blank=True, default=None, on_delete=models.CASCADE,
                             related_name='type_id', help_text='产品分类ID')
    description = models.TextField(verbose_name='产品描述', help_text='产品描述')
    cover = models.ImageField(upload_to='static/product/cover/images', verbose_name='产品封面', help_text='产品封面')


class ProductSpec(models.Model):
    """
    产品规格表
    """
    product = models.ForeignKey(to=Product, null=True, blank=True, default=None, on_delete=models.CASCADE,
                                verbose_name='产品', help_text='产品ID')
    property = models.CharField(verbose_name='规格详情', max_length=225, help_text='规格详情')
    property_name = models.CharField(verbose_name='规格名字', max_length=225, help_text='规格名字')


class ProductSpecGroup(models.Model):
    """
     产品规格组合(前端通过笛卡尔乘积计算)
     """
    product = models.ForeignKey(to=Product, null=True, blank=True, default=None, on_delete=models.CASCADE,
                                verbose_name='产品', help_text='产品ID')
    group = models.CharField(verbose_name='产品规格组合', max_length=225, help_text='产品规格组合')
    group_price = models.DecimalField(verbose_name='组合价格', max_digits=10, decimal_places=2, help_text='组合价格')
    group_sales = models.IntegerField(verbose_name='组合销售量', default=0, help_text='组合销售量')
    group_image = models.ImageField(verbose_name='组合图片', upload_to='static/product/spec/images',
                                    help_text='该组合的图片')
