# Generated by Django 4.2.7 on 2023-11-14 15:16

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("account", "0004_alter_shopproduct_account"),
    ]

    operations = [
        migrations.AddField(
            model_name="shop",
            name="description",
            field=models.TextField(default=1, help_text="店铺描述", verbose_name="店铺描述"),
            preserve_default=False,
        ),
    ]
