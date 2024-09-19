import 'package:flutter/material.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/services/store_service.dart';
import 'package:store_app/views/fav_page.dart';
import 'package:store_app/views/profile_page.dart';
import 'package:store_app/widget/home/head_home_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';
import 'package:store_app/widget/home/product_card.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const primaryColor = Colors.blue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<ProductModel> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      ProductServices productServices = ProductServices(Dio());
      List<ProductModel> fetchedProducts = await productServices.getProducts();
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
      bottomNavigationBar: CustomBottomNavBar(
        pages: const [
          HomePage(),
          FavPage(),
          ProfilePage(),
        ],
        color: HomePage.primaryColor,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const HeadHomePage(),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.48),
                      itemBuilder: (context, index) {
                        return ProductCard(productModel: products[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
