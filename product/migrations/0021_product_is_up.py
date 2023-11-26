# Generated by Django 4.2.7 on 2023-11-26 12:37

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0020_category1_product_check_status_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="product",
            name="is_up",
            field=models.BooleanField(
                blank=True,
                default=False,
                help_text="是否上架(是否上架，布尔型)",
                null=True,
                verbose_name="是否上架",
            ),
        ),
    ]
