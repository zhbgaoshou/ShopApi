from django.db import models
from product.models import Product
from User.models import WxUser


# Create your models here.

class Comment(models.Model):
    """
    用户评论表，针对一个产品进行评论
    """
    title = models.TextField(verbose_name='评论详情', help_text='评论详情')
    product = models.ForeignKey(to=Product, on_delete=models.CASCADE, null=True, blank=True, default=None,
                                verbose_name='产品', help_text='产品ID')
    user = models.ForeignKey(to=WxUser, null=True, blank=True, default=None, on_delete=models.CASCADE,
                             verbose_name='评论产品', help_text='用户ID')


class CommentImage(models.Model):
    """
    评论对应的图片
    """
    image = models.ImageField(upload_to='static/comment/images', help_text='评论图片')
    comment = models.ForeignKey(to=Comment, null=True, blank=True, default=None, on_delete=models.CASCADE,
                                verbose_name='评论', help_text='评论ID(哪个评论的图片)')


class CommentUpvote(models.Model):
    """
    评论的点赞表
    """
    count = models.IntegerField(verbose_name='评论的点赞数量', default=0, help_text='评论的点赞数')
    user = models.ForeignKey(to=WxUser, null=True, blank=True, default=None, on_delete=models.CASCADE,
                             verbose_name='点赞用户', help_text='用户ID')
    comment = models.ForeignKey(to=Comment, null=True, blank=True, default=None, on_delete=models.CASCADE,
                                verbose_name='产品', help_text='评论ID(哪个评论的数量)')
