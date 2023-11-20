# Generated by Django 4.2.7 on 2023-11-20 08:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0018_alter_productimg_image_and_more"),
        ("index", "0003_alter_indexcarousel_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="indexcarousel",
            name="product",
            field=models.ForeignKey(
                blank=True,
                default=None,
                help_text="产品ID",
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="product.product",
                verbose_name="轮播图产品",
            ),
        ),
        migrations.AlterField(
            model_name="indexseckill",
            name="product",
            field=models.ForeignKey(
                blank=True,
                default=None,
                help_text="产品ID",
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="product.product",
                verbose_name="秒杀区产品",
            ),
        ),
        migrations.AlterField(
            model_name="indexsuggest",
            name="product",
            field=models.ForeignKey(
                blank=True,
                default=None,
                help_text="产品ID",
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                to="product.product",
                verbose_name="首页推荐产品",
            ),
        ),
    ]
