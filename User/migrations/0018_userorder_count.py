# Generated by Django 4.2.7 on 2023-11-28 01:33

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("User", "0017_remove_userproductcart_product"),
    ]

    operations = [
        migrations.AddField(
            model_name="userorder",
            name="count",
            field=models.IntegerField(default=1, help_text="购买数量", verbose_name="购买数量"),
            preserve_default=False,
        ),
    ]
