import os

from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver

from utils import utils


# Create your models here.
class Type(models.Model):
    """
    产品分类
    """
    className = models.CharField(verbose_name='产品分类', max_length=10, help_text='产品分类名字')
    image = models.ImageField(upload_to='static/product/type/images/%Y-%m-%d', verbose_name='分类图片',
                              help_text='分类图片', null=True, blank=True, default=None)


class Category1(models.Model):
    """
    一级分类表
    """

    name = models.CharField(help_text='一级分类名字', verbose_name='一级分类名字', max_length=225)
    image = models.ImageField(help_text='一级分类图片', verbose_name='一级分类图片',
                              upload_to='static/product/Category1/images/%Y-%m-%d', null=True, blank=True, default=None)

    sort = models.IntegerField(help_text='排序', verbose_name='排序', default=1)


class Category2(models.Model):
    """
    二级分类表
    """
    name = models.CharField(help_text='二级分类名字', verbose_name='二级分类名字', max_length=225)
    image = models.ImageField(help_text='二级分类图片', verbose_name='二级分类图片',
                              upload_to='static/product/Category2/images/%Y-%m-%d', null=True, blank=True, default=None)

    category1 = models.ForeignKey(to=Category1, on_delete=models.CASCADE, null=True, blank=True, default=None,
                                  verbose_name='一级分类ID', help_text='一级分类ID')
    sort = models.IntegerField(help_text='排序', verbose_name='排序', default=1)


class ProductImg(models.Model):
    """
    产品图片
    """
    image_type_choices = ((0, '产品轮播'), (1, '产品详情'))
    image = models.ImageField(verbose_name='图片地址', upload_to='static/product/images/%Y-%m-%d', help_text='产品图片')
    img_type = models.SmallIntegerField(choices=image_type_choices, verbose_name='图片类型',
                                        help_text='图片类型(0:产品轮播,1:产品详情')
    product = models.ForeignKey(verbose_name='产品', to='Product', null=True, blank=True, default=None,
                                on_delete=models.CASCADE, help_text='产品ID')


class Product(models.Model):
    """
        产品表
    """
    check_choices = ((0, '未审核'), (1, '已审核'))
    title = models.CharField(verbose_name='标题', max_length=225, help_text='标题')
    price = models.DecimalField(verbose_name='价格', help_text='价格', max_digits=10, decimal_places=2,
                                default=0,
                                null=True, blank=True)
    type = models.ForeignKey(to='Type', null=True, blank=True, default=None, on_delete=models.CASCADE,
                             related_name='type_id', help_text='产品分类ID')
    description = models.TextField(verbose_name='产品描述', help_text='产品描述')
    cover = models.ImageField(upload_to='static/product/cover/images/%Y-%m-%d', verbose_name='产品封面',
                              help_text='产品封面')
    category1 = models.ForeignKey(to=Category1, on_delete=models.CASCADE, null=True, blank=True, default=None,
                                  verbose_name='一级分类ID', help_text='一级分类ID')
    category2 = models.ForeignKey(to=Category2, on_delete=models.CASCADE, null=True, blank=True, default=None,
                                  verbose_name='二级分类ID', help_text='二级分类ID')
    check_status = models.SmallIntegerField(choices=check_choices, help_text="审核状态(0, '未审核'), (1, '已审核')",
                                            verbose_name="审核状态(0, '未审核'), (1, '已审核')", default=0)

    is_up = models.BooleanField(default=False, null=True, blank=True, verbose_name='是否上架',
                                help_text='是否上架(是否上架，布尔型)')

    sold = models.IntegerField(default=0, null=True, blank=True, verbose_name='已售', help_text='已售产品')


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
    group = models.CharField(verbose_name='产品规格组合', max_length=225, help_text='产品规格组合(xx|xx|)|分割')
    group_price = models.DecimalField(verbose_name='组合价格', max_digits=10, decimal_places=2, help_text='组合价格')
    group_sales = models.IntegerField(verbose_name='组合销售量', default=0, help_text='组合销售量')
    group_image = models.ImageField(verbose_name='组合图片', null=True, blank=True, default=None,
                                    upload_to='static/product/spec/images/%Y-%m-%d',
                                    help_text='该组合的图片')
    count = models.IntegerField(verbose_name='组合库存', help_text='组合库存')


@receiver(post_delete, sender=ProductImg)
def del_static(sender, instance, **kwargs):
    if instance.image:
        image_path = instance.image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)


@receiver(post_delete, sender=ProductSpecGroup)
def del_static(sender, instance, **kwargs):
    if instance.group_image:
        image_path = instance.group_image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)


@receiver(post_delete, sender=Product)
def del_static(sender, instance, **kwargs):
    if instance.cover:
        image_path = instance.cover.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)


@receiver(post_delete, sender=Type)
def del_static(sender, instance, **kwargs):
    if instance.image:
        image_path = instance.image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)


@receiver(post_delete, sender=Category1)
def del_static(sender, instance, **kwargs):
    if instance.image:
        image_path = instance.image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)


@receiver(post_delete, sender=Category2)
def del_static(sender, instance, **kwargs):
    if instance.image:
        image_path = instance.image.path
        if image_path and os.path.exists(image_path):
            os.remove(image_path)
