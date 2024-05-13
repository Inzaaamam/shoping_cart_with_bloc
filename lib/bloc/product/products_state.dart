part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ShopingCartItems> listItems;

 const  ProductsLoaded({required this.listItems});
}
