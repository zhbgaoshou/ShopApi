# Generated by Django 4.2.7 on 2023-11-14 15:57

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0010_alter_productimg_img_url"),
    ]

    operations = [
        migrations.RenameField(
            model_name="productimg",
            old_name="img_url",
            new_name="image",
        ),
    ]
