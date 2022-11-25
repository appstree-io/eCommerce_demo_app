// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      prodname: json['title'] as String?,
      price: (json['price'] as num).toDouble(),
      id: json['id'] as int,
      category: json['category'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String,
      brand: json['brand'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'title': instance.prodname,
      'price': instance.price,
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'brand': instance.brand,
      'rating': instance.rating,
    };
