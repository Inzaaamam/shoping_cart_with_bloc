import 'package:bloc_example/bloc/cart/shoping_event.dart';
import 'package:bloc_example/bloc/cart/shoping_state.dart';
import 'package:bloc_example/shoping_cart/model_class.dart';
import 'package:bloc_example/shoping_cart/shoping_cart_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(CartInitial()) {
    on<EventLoad>(_onLoad);
    on<AddItemToCart>(_onAddItem);
    on<RemoveItemFromCart>(_onRemoveItem);
  }

  void _onLoad(EventLoad event, Emitter<CartState> emit) async {
    // ignore: unused_local_variable
    ShopingCardDataProvider items = ShopingCardDataProvider();
    emit(CartLoaded(listItems: const []));
  }

  void _onAddItem(AddItemToCart event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is CartLoaded) {
      bool existed = false;
      final List<CartItem> cartList = List.from(currentState.listItems);
      for (int i = 0; i < cartList.length; i++) {
        if (cartList[i].product.id == event.item.id) {
          existed = true;
          cartList[i] =
              cartList[i].copyWith(quantity: cartList[i].quantity + 1);
          break;
        }
      }

      if (!existed) {
        cartList.add(CartItem(product: event.item, quantity: 1));
      }
      emit(CartLoaded(listItems: cartList));
    }
  }

  void _onRemoveItem(RemoveItemFromCart event, Emitter<CartState> emit) {
  if (state is CartLoaded) {
    CartLoaded currentState = state as CartLoaded;
    List<CartItem> updatedList = List<CartItem>.from(currentState.listItems);
    updatedList.removeAt(event.index);
    emit(CartLoaded(listItems: updatedList));
  }

}

  double getTotalPrice(List<CartItem> items) {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.product.price! * item.quantity;
    }
    return totalPrice;
  }
  int getTotalQuantity(List<CartItem> items) {
    int totalQuantity = 0;
    for (var item in items) {
      totalQuantity += item.product.quantity!;
    }
    return totalQuantity;
  }
  // ignore: unused_element
//   void _onDecreaseItem(DecreaseItemQuantity event, Emitter<CartState> emit) {
//   final currentState = state;
//   if (currentState is CartLoaded) {
//     List<CartItem> cartList = List.from(currentState.listItems);
//     for (int i = 0; i < cartList.length; i++) {
//       if (cartList[i].quantity == event) {
//         if (cartList[i].quantity > 1) {
//           cartList[i] = cartList[i].copyWith(quantity: cartList[i].quantity - 1);
//         } else {
//           cartList.removeAt(i);
//         }
//         break;
//       }
//     }
//     emit(CartLoaded(listItems: cartList));
//   }
// }
}
