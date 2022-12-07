// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:need_to/models/user_model.dart';

class CartItemListModel {
  final BestsellerProduct product;
  final int qty;
  CartItemListModel({
    required this.product,
    required this.qty,
  });

  CartItemListModel copyWith({
    BestsellerProduct? product,
    int? qty,
  }) {
    return CartItemListModel(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'qty': qty,
    };
  }

  factory CartItemListModel.fromMap(Map<String, dynamic> map) {
    return CartItemListModel(
      product:
          BestsellerProduct.fromMap(map['product'] as Map<String, dynamic>),
      qty: map['qty'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemListModel.fromJson(String source) =>
      CartItemListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartItemListModel(product: $product, qty: $qty)';

  @override
  bool operator ==(covariant CartItemListModel other) {
    if (identical(this, other)) return true;

    return other.product == product && other.qty == qty;
  }

  @override
  int get hashCode => product.hashCode ^ qty.hashCode;
}
