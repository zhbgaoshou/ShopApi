# Generated by Django 4.2.7 on 2023-11-26 14:26

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0021_product_is_up"),
    ]

    operations = [
        migrations.AlterField(
            model_name="productspecgroup",
            name="group",
            field=models.CharField(
                help_text="产品规格组合(xx|xx|)|分割", max_length=225, verbose_name="产品规格组合"
            ),
        ),
    ]
