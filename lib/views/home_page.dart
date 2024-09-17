import 'package:flutter/material.dart';
import 'package:store_app/views/fav_page.dart';
import 'package:store_app/views/profile_page.dart';
import 'package:store_app/widget/home/head_home_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';
import 'package:store_app/widget/home/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const primaryColor = Colors.blue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
