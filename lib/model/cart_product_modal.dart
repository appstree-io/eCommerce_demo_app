// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartProduct {
  final String image;
  final String name;
  final double price;
  final String description;
  final int id;
  final int qty;

  CartProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.id,
    this.qty = 1,
  });

  CartProduct copyWith({
    String? image,
    String? name,
    double? price,
    String? description,
    int? id,
    int? qty,
  }) {
    return CartProduct(
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      id: id ?? this.id,
      qty: qty ?? this.qty,
    );
  }
}
