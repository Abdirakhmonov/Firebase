// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      images: json['images'][0] as String,
      price: (json['price'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'images': instance.images,
      'price': instance.price,
      'title': instance.title,
    };
