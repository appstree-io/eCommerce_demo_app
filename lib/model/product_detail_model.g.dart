// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailData _$ProductDetailDataFromJson(Map<String, dynamic> json) =>
    ProductDetailData(
      prodname: json['title'] as String?,
      price: (json['price'] as num).toDouble(),
      id: json['id'] as int,
      category: json['category'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String,
      brand: json['brand'] as String,
      rating: (json['rating'] as num).toDouble(),
      images: json['images'] as List<dynamic>,
    );

Map<String, dynamic> _$ProductDetailDataToJson(ProductDetailData instance) =>
    <String, dynamic>{
      'title': instance.prodname,
      'price': instance.price,
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'brand': instance.brand,
      'rating': instance.rating,
      'images': instance.images,
    };
