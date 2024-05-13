
part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductLoad extends ProductsEvent {
  // final ShopingCartItems item;
  // const EventLoad(this.item);
  @override
  List<Object> get props => [];
}
