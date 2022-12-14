import 'dart:convert';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/model/product_modal.dart';
import '../model/product_modal.dart';

Future<List<ProductData>> fetchProductdata() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    var proddata = <ProductData>[];
    proddata = <ProductData>[
      ...data['products']
          .map((proddatas) => ProductData.fromJson(proddatas))
          .toList()
    ];

    return proddata;
  } else {
    throw Exception('Failed to fetch products');
  }
}

Future<List<ProductData>> fetchProductCategoryData() async {
  final response = await http
      .get(Uri.parse('https://dummyjson.com/products/category/smartphones'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    var prodcategorydata = <ProductData>[];

    prodcategorydata = <ProductData>[
      ...data['products']
          .map((proddatas) => ProductData.fromJson(proddatas))
          .toList()
    ];
    return prodcategorydata;
  } else {
    throw Exception('Failed to fetch products');
  }
}

Future<ProductDetailData> fetchProductDetail(int productid) async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/products/$productid'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    var detailprod = ProductDetailData.fromJson(data);
    print(detailprod.images);
    return detailprod;
  } else {
    throw Exception('Failed to fetch products');
  }
}
