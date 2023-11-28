# Generated by Django 4.2.7 on 2023-11-28 14:03

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0022_alter_productspecgroup_group"),
    ]

    operations = [
        migrations.AddField(
            model_name="product",
            name="sold",
            field=models.IntegerField(
                blank=True, default=0, help_text="已售产品", null=True, verbose_name="已售"
            ),
        ),
    ]
