// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'product_modal.g.dart';

@JsonSerializable()
class ProductData {
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

  ProductData({
    required this.prodname,
    required this.price,
    required this.id,
    this.category,
    this.description,
    required this.thumbnail,
    required this.brand,
    required this.rating,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
