import 'package:bloc_example/shoping_cart/model_class.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvents extends Equatable {
  const CartEvents();
  @override
  //
  List<Object> get props => [];
}

class EventLoad extends CartEvents {
  // final ShopingCartItems item;

  // const EventLoad (this.item);
  @override
  List<Object> get props => [];
}

class AddItemToCart extends CartEvents {
  final ShopingCartItems item;

  const AddItemToCart(this.item);
  @override
  List<Object> get props => [item];
}

class RemovItemToCart extends CartEvents {
  // final ShopingCartItems item;

  // const RemovItemToCart(this.item);
  @override
  List<Object> get props => [];
}

class RemoveItemFromCart extends CartEvents {
  final int index;

  const RemoveItemFromCart(this.index);

  @override
  List<Object> get props => [index];
}
// class DecreaseItemQuantity extends CartEvents {
//   final ShopingCartItems item;

//   const DecreaseItemQuantity(this.item);
//   @override
//   List<Object> get props => [item];
// }