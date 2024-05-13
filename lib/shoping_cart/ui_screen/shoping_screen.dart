
import 'package:bloc_example/bloc/product/products_bloc.dart';
import 'package:bloc_example/shoping_cart/ui_screen/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/bloc/cart/shoping_bloc.dart';
import 'package:bloc_example/bloc/cart/shoping_event.dart';
import 'package:bloc_example/bloc/cart/shoping_state.dart';

class ShopingScreen extends StatefulWidget {
  const ShopingScreen({super.key});

  @override
  State<ShopingScreen> createState() => _ShopingScreenState();
}

class _ShopingScreenState extends State<ShopingScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductLoad());
    context.read<CartBloc>().add(EventLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Shopping Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  int itemCount = state.listItems.length;
                  return IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectedListItems(),
                        ),
                      );
                    },
                    icon: Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              '$itemCount', // Cart count
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ListView.builder(
              itemCount: state.listItems.length,
              itemBuilder: (context, index) {
                final item = state.listItems[index];
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(item.imagUrl!),
                          Text(
                            '${item.productname}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text('price: \$${item.price}'),
                          Text('Total Quantity:${item.quantity}'),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              context.read<CartBloc>().add(AddItemToCart(item));
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
