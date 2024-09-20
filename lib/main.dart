import 'package:flutter/material.dart';
import 'package:store_app/views/Login.dart';
import 'package:store_app/views/details_page.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/views/signup_page.dart';
import 'package:store_app/widget/home/product_card.dart';

void main() {
  runApp(const StoreApp());
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
