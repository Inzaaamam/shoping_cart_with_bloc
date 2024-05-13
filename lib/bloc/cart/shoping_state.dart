import 'package:bloc_example/shoping_cart/model_class.dart';
import 'package:equatable/equatable.dart';
abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}
class CartInitial extends CartState {}
class CartLoaded extends CartState {
  final List<CartItem> listItems;
  CartLoaded({required this.listItems});
  @override
  List<Object?> get props => [listItems];
}

class AddToCartFailureState extends CartState {
  final String errorMessage;

  AddToCartFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
