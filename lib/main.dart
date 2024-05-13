import 'package:bloc_example/bloc/cart/shoping_bloc.dart';
import 'package:bloc_example/bloc/product/products_bloc.dart';
import 'package:bloc_example/shoping_cart/ui_screen/shoping_screen.dart';
import 'package:bloc_example/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductsBloc()),
          BlocProvider(create: (context) => CartBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ShopingScreen(),
        ));
  }
}
