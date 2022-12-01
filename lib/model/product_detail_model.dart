import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailData {
  @JsonKey(name: 'title')
  final String? prodname;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'category')
  final String? category;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  @JsonKey(name: 'brand')
  final String brand;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'images')
  final List? images;

  ProductDetailData({
    required this.prodname,
    required this.price,
    required this.id,
    this.category,
    this.description,
    required this.thumbnail,
    required this.brand,
    required this.rating,
    this.images,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailDataToJson(this);
}
