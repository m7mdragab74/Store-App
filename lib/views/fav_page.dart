import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/store_model.dart';
import '../services/store_service.dart';
import '../widget/home/product_card.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key, required this.username});
  final String username;

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int _selectedIndex = 1;
  bool isFavorite = false;
  List<Product> products = [];
  bool isLoading = true;
  Future<void> fetchProducts() async {
    try {
      ProductServices productServices = ProductServices(Dio());
      List<Product> fetchedProducts = await productServices.getProducts();
      setState(() {
       products = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2531),
      appBar: AppBar(
        backgroundColor: const Color(0xff1a2531),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_left,
              size: 35, color: Colors.white),
        ),
        title: Text(
          'Favourites',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:GridView.builder(
        itemCount: products.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.48),
        itemBuilder: (context, index) {
          return ProductCard(productModel: products[index],username: widget.username,);
        },
      ),
    );
  }
}
