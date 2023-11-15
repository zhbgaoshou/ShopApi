# Generated by Django 4.2.7 on 2023-11-13 16:23

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("coupon", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="coupon",
            name="status",
            field=models.SmallIntegerField(
                choices=[(0, "官方优惠券"), (1, "店铺优惠券")],
                help_text="优惠券类型(0:官方优惠券,1:店铺优惠券)",
                verbose_name="优惠券类型",
            ),
        ),
    ]
