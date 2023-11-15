# Generated by Django 4.2.6 on 2023-11-09 00:53

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0001_initial"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="product",
            name="image",
        ),
        migrations.AddField(
            model_name="product",
            name="image",
            field=models.ManyToManyField(to="product.productimg", verbose_name="商品ID"),
        ),
    ]
