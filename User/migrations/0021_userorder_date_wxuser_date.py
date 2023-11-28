# Generated by Django 4.2.7 on 2023-11-28 14:03

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("User", "0020_userorder_money"),
    ]

    operations = [
        migrations.AddField(
            model_name="userorder",
            name="date",
            field=models.DateField(
                auto_now_add=True, help_text="日期", null=True, verbose_name="日期"
            ),
        ),
        migrations.AddField(
            model_name="wxuser",
            name="date",
            field=models.DateField(
                auto_now_add=True, help_text="注册日期", null=True, verbose_name="注册日期"
            ),
        ),
    ]