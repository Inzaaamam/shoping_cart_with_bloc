import 'package:bloc_example/bloc/cart/shoping_bloc.dart';
import 'package:bloc_example/bloc/cart/shoping_event.dart';
import 'package:bloc_example/bloc/cart/shoping_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedListItems extends StatefulWidget {
  const SelectedListItems({super.key});

  @override
  State<SelectedListItems> createState() => _SelectedListItemsState();
}

class _SelectedListItemsState extends State<SelectedListItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Selected List Of Items',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  int itemCount = state.listItems.length;
                  return IconButton(
                    onPressed: () {},
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            double totalPrice =
                context.read<CartBloc>().getTotalPrice(state.listItems);
            // ignore: unused_local_variable
            int totalQuantity =
                context.read<CartBloc>().getTotalQuantity(state.listItems);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.listItems.length, // Update itemCount here
                    itemBuilder: (context, index) {
                      final item = state.listItems[index];
                      return ListTile(
                        title: Text(item.product.productname ?? ''),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(RemoveItemFromCart(index));
                            // Update state here
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   'Total Quantity: $totalQuantity',
                      //   style: const TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
