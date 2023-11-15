# Generated by Django 4.2.6 on 2023-11-06 08:37

from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="WxUser",
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
                ("username", models.CharField(max_length=225, verbose_name="用户名")),
                ("openId", models.CharField(max_length=100, verbose_name="openId")),
                (
                    "avatar",
                    models.FileField(
                        upload_to="User/static/User/images", verbose_name="微信头像"
                    ),
                ),
            ],
        ),
    ]
