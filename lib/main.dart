import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/statemanagement/cart_provider.dart';
import 'package:store_app/statemanagement/favorite_provider.dart';
import 'package:store_app/statemanagement/user_provider.dart';
import 'package:store_app/views/Login.dart';
import 'package:store_app/views/fav_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const StoreApp()));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
