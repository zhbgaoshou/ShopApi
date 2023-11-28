# Generated by Django 4.2.7 on 2023-11-28 10:35

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("index", "0004_alter_indexcarousel_product_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="indexseckill",
            name="count",
            field=models.IntegerField(
                blank=True,
                default=0,
                help_text="秒杀数量(库存)",
                null=True,
                verbose_name="秒杀数量",
            ),
        ),
        migrations.AddField(
            model_name="indexseckill",
            name="sell",
            field=models.IntegerField(
                blank=True, default=0, help_text="出售数量", null=True, verbose_name="出售"
            ),
        ),
        migrations.AddField(
            model_name="indexseckill",
            name="surplus",
            field=models.IntegerField(
                blank=True, default=0, help_text="剩余数量", null=True, verbose_name="剩余"
            ),
        ),
    ]
