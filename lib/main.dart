import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/statemanagement/cart_provider.dart';
import 'package:store_app/statemanagement/favorite_provider.dart';
import 'package:store_app/views/Login.dart';
import 'package:store_app/views/details_page.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/views/signup_page.dart';
import 'package:store_app/widget/home/product_card.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const StoreApp()));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
