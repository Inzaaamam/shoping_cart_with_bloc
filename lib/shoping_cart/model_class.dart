
import 'package:equatable/equatable.dart';

class ShopData {
  List<ShopingCartItems> shopitems;
  ShopData({
    required this.shopitems,
  });
}

class ShopingCartItems {
  String id;
  String? imagUrl;
  String? productname;
  double? price;
  int? quantity;
  ShopingCartItems({
    required this.id,
    this.imagUrl,
    this.productname,
    this.price,
    this.quantity,
  });

  ShopingCartItems copyWith({
    String? id,
    String? imagUrl,
    String? productname,
    double? price,
    int? quantity,
  }) {
    return ShopingCartItems(
      id: id ?? this.id,
      imagUrl: imagUrl ?? this.imagUrl,
      productname: productname ?? this.productname,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

// ignore: must_be_immutable
class CartItem extends Equatable {
  ShopingCartItems product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product, quantity];

  CartItem copyWith({
    ShopingCartItems? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
