# Generated by Django 4.2.6 on 2023-11-09 10:14

from django.db import migrations, models
import utils.utils


class Migration(migrations.Migration):
    dependencies = [
        ("User", "0003_userorder_product_userproductcart_product_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="userorder",
            name="order_number",
            field=models.BigIntegerField(
                default=utils.utils.generate_order_number, verbose_name="订单号"
            ),
        ),
        migrations.AlterField(
            model_name="userorder",
            name="deliver_time",
            field=models.BigIntegerField(
                blank=True, help_text="发货时间", null=True, verbose_name="发货时间"
            ),
        ),
        migrations.AlterField(
            model_name="userorder",
            name="order_time",
            field=models.BigIntegerField(
                blank=True, help_text="下单时间", null=True, verbose_name="下单时间"
            ),
        ),
        migrations.AlterField(
            model_name="userorder",
            name="pay_time",
            field=models.BigIntegerField(
                blank=True, help_text="支付时间", null=True, verbose_name="支付时间"
            ),
        ),
        migrations.AlterField(
            model_name="userorder",
            name="received_time",
            field=models.BigIntegerField(
                blank=True, help_text="签收时间", null=True, verbose_name="签收时间"
            ),
        ),
    ]
