# Generated by Django 4.2.7 on 2023-11-15 13:53

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("product", "0013_productpropertygroup_group_image"),
    ]

    operations = [
        migrations.RenameModel(
            old_name="ProductProperty",
            new_name="ProductSpec",
        ),
        migrations.RenameModel(
            old_name="ProductPropertyGroup",
            new_name="ProductSpecGroup",
        ),
    ]
