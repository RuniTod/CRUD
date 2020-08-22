from django.db import models
# -*- coding: utf-8 -*-
# Create your models here.
from django.db.models import CharField, IntegerField, ForeignKey, FloatField, TextField


class TypeProduct(models.Model):

    name = CharField(max_length=100, verbose_name=u'Категория товара')


class Product(models.Model):
    name = CharField(max_length=100, verbose_name=u'Наименование товара')
    type = ForeignKey(TypeProduct, verbose_name=u'тип товара', on_delete=models.CASCADE)
    article = IntegerField(verbose_name=u'код товара')
    price = FloatField(verbose_name=u'Цена товара')
    description = TextField(verbose_name=u'Описание')


class TypePersonal(models.Model):
    name = CharField(max_length=100, verbose_name=u'Наименование должности')
    slug = CharField(max_length=100, verbose_name=u'Код должности')


class Personal(models.Model):
    fio = CharField(max_length=100, verbose_name=u'ФИО')
    age = IntegerField(verbose_name=u'Возраст')
    type = ForeignKey(TypePersonal, verbose_name=u'должность', on_delete=models.CASCADE)


class PersonalProduct(models.Model):

    person = ForeignKey(Personal, verbose_name=u'сотрудник', on_delete=models.CASCADE)
    type_product = ForeignKey(TypeProduct, verbose_name=u'категория товара', on_delete=models.CASCADE)
