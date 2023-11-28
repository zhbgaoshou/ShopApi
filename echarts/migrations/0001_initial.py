# Generated by Django 4.2.7 on 2023-11-28 14:06

from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="ProductProportion",
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
                    "product_name",
                    models.CharField(
                        help_text="商品名称", max_length=20, verbose_name="商品名称"
                    ),
                ),
                ("count", models.IntegerField(help_text="数量", verbose_name="数量")),
            ],
        ),
        migrations.CreateModel(
            name="SalesOrder",
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
                    "date",
                    models.DateField(
                        auto_now_add=True, help_text="日期", verbose_name="日期"
                    ),
                ),
                (
                    "order_count",
                    models.IntegerField(help_text="订单数量", verbose_name="订单数量"),
                ),
                (
                    "order_money",
                    models.IntegerField(help_text="订单金额", verbose_name="订单金额"),
                ),
            ],
        ),
        migrations.CreateModel(
            name="SevenDayRegister",
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
                    "date",
                    models.DateField(
                        auto_now_add=True, help_text="注册日期", verbose_name="注册日期"
                    ),
                ),
                (
                    "expected_register",
                    models.IntegerField(
                        default=15, help_text="预计注册量", verbose_name="预计注册量"
                    ),
                ),
                (
                    "register_count",
                    models.IntegerField(help_text="实际注册量", verbose_name="实际注册量"),
                ),
            ],
        ),
    ]
