# Generated by Django 4.2.7 on 2023-11-29 02:10

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("echarts", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="sevendayregister",
            name="expected_register",
            field=models.IntegerField(
                default=11, help_text="预计注册量", verbose_name="预计注册量"
            ),
        ),
    ]