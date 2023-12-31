# Generated by Django 4.2.7 on 2023-11-20 11:15

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0018_alter_productimg_image_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="type",
            name="image",
            field=models.ImageField(
                blank=True,
                default=None,
                help_text="分类图片",
                null=True,
                upload_to="static/product/type/images/%Y-%m-%d",
                verbose_name="分类图片",
            ),
        ),
        migrations.AlterField(
            model_name="product",
            name="cover",
            field=models.ImageField(
                help_text="产品封面",
                upload_to="static/product/cover/images/%Y-%m-%d",
                verbose_name="产品封面",
            ),
        ),
    ]
