# Generated by Django 4.2.7 on 2023-11-15 05:10

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("account", "0006_alter_account_level"),
    ]

    operations = [
        migrations.RenameField(
            model_name="shop",
            old_name="img_url",
            new_name="image",
        ),
    ]
