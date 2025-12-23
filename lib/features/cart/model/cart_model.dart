import 'package:product_cart_app/features/products/model/product_model.dart';

class Item {
  final int itemId;
  final Product? product;
  int quantity;

  Item({
    required this.itemId,
    this.product,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'cartid': itemId,
      'product': product?.toJson(),
      'quantity': quantity,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['cartid'],
      product:
          json["product"] != null ? Product.fromJson(json["product"]) : null,
      quantity: json['quantity'],
    );
  }
}
