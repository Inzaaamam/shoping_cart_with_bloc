import 'package:bloc_example/shoping_cart/model_class.dart';
import 'package:bloc_example/shoping_cart/shoping_cart_items.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductLoad>((event, emit) {
      ShopingCardDataProvider items = ShopingCardDataProvider();
      emit(ProductsLoaded(listItems: items.getShopItems().shopitems));
    });
  }
}