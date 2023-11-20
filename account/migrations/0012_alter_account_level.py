# Generated by Django 4.2.7 on 2023-11-20 11:15

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("account", "0011_alter_account_avatar_alter_shop_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="account",
            name="level",
            field=models.SmallIntegerField(
                choices=[(3, "admin"), (2, "editor"), (1, "other")],
                default=2,
                help_text="角色/身份(3, 'admin'), (2, 'editor'), (1, 'other')",
                verbose_name="级别",
            ),
        ),
    ]
