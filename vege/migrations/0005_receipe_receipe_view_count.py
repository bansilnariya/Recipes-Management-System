# Generated by Django 4.2.4 on 2023-08-30 15:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vege', '0004_remove_receipe_receipe_view_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='receipe',
            name='receipe_view_count',
            field=models.ImageField(default=1, upload_to=''),
        ),
    ]