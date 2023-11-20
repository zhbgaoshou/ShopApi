# Generated by Django 4.2.7 on 2023-11-20 07:47

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0017_alter_productspecgroup_group_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="productimg",
            name="image",
            field=models.ImageField(
                help_text="产品图片",
                upload_to="static/product/images/%Y-%m-%d",
                verbose_name="图片地址",
            ),
        ),
        migrations.AlterField(
            model_name="productspecgroup",
            name="group_image",
            field=models.ImageField(
                blank=True,
                default=None,
                help_text="该组合的图片",
                null=True,
                upload_to="static/product/spec/images/%Y-%m-%d",
                verbose_name="组合图片",
            ),
        ),
    ]
