# Generated by Django 4.2.6 on 2023-11-09 00:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="ProductImg",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "img_url",
                    models.ImageField(
                        upload_to="static/product/images", verbose_name="图片地址"
                    ),
                ),
                (
                    "img_type",
                    models.SmallIntegerField(
                        choices=[(0, "商品轮播"), (1, "商品详情")], verbose_name="图片类型"
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Type",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("className", models.CharField(max_length=10, verbose_name="产品分类")),
            ],
        ),
        migrations.CreateModel(
            name="TypeClassify",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Product",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "title",
                    models.CharField(help_text="标题", max_length=225, verbose_name="标题"),
                ),
                (
                    "price",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        default=0,
                        help_text="价格",
                        max_digits=10,
                        null=True,
                        verbose_name="价格",
                    ),
                ),
                (
                    "cover",
                    models.ImageField(
                        help_text="图片封面",
                        upload_to="static/product/images",
                        verbose_name="图片封面",
                    ),
                ),
                (
                    "image",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="product.productimg",
                        verbose_name="商品ID",
                    ),
                ),
                (
                    "type",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="type_id",
                        to="product.type",
                    ),
                ),
            ],
        ),
    ]
