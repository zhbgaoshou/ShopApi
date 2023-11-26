# Generated by Django 4.2.7 on 2023-11-26 12:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("User", "0015_alter_wxuser_avatar"),
    ]

    operations = [
        migrations.AddField(
            model_name="userproductcart",
            name="is_select",
            field=models.BooleanField(
                blank=True,
                default=True,
                help_text="是否选中",
                null=True,
                verbose_name="是否选择",
            ),
        ),
        migrations.CreateModel(
            name="UserAsset",
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
                (
                    "balance",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        default=0,
                        help_text="余额",
                        max_digits=10,
                        null=True,
                        verbose_name="余额",
                    ),
                ),
                (
                    "freeze_balance",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        default=0,
                        help_text="冻结余额",
                        max_digits=10,
                        null=True,
                        verbose_name="冻结余额",
                    ),
                ),
                (
                    "balance_available",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        default=0,
                        help_text="可用余额",
                        max_digits=10,
                        null=True,
                        verbose_name="可用余额",
                    ),
                ),
                (
                    "accumulative_consumption",
                    models.DecimalField(
                        blank=True,
                        decimal_places=2,
                        default=0,
                        help_text="累计消费",
                        max_digits=10,
                        null=True,
                        verbose_name="累计消费",
                    ),
                ),
                (
                    "integral",
                    models.IntegerField(default=0, help_text="积分", verbose_name="积分"),
                ),
                (
                    "growth_value",
                    models.IntegerField(default=0, help_text="成长值", verbose_name="成长值"),
                ),
                (
                    "user",
                    models.ForeignKey(
                        blank=True,
                        default=None,
                        help_text="用户ID",
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="User.wxuser",
                        verbose_name="用户ID",
                    ),
                ),
            ],
        ),
    ]
