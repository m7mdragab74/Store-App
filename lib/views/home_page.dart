import 'package:flutter/material.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/services/store_service.dart';
import 'package:store_app/widget/home/category_nsv_bar.dart';
import 'package:store_app/widget/home/head_home_page.dart';
import 'package:store_app/widget/home/product_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  static const primaryColor = Colors.blue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> futureProducts;
  String selectedCategory = 'All';
  //Created to managed text input in search TextField
  TextEditingController searchController = TextEditingController();
  //List holds all products fetched from api
  List<Product> allProducts = [];
  //holds products currently displayed based on applied(category,search)
  List<Product> displayedProducts = [];

  void onCategorySelcted(String category) {
    setState(() {
      //Updates the selected category when the category is selected from CategoryNavBar Class
      selectedCategory = category;
      //filter products based on selected category
      filterProducts();
    });
  }

  //Method filter allProducts List on (selectedCategory,searchQuary)
  void filterProducts() {
    List<Product> filteredProducts = allProducts;
    //Filter based on selectedCategory
    if (selectedCategory != 'All') {
      filteredProducts = filteredProducts.where((product) {
        switch (selectedCategory) {
          case 'Men':
            return product.category == "men's clothing";
          case 'Women':
            return product.category == "women's clothing";
          case 'Electronics':
            return product.category == "electronics";
          case 'Jewelery':
            return product.category == "jewelery";
          default:
            return false;
        }
      }).toList();
    }
    //Filter based on search when any part on (product.title) typed on Search TextField
    //if any part of title found the product added to filteredProducts List
    String searchQuery = searchController.text.toLowerCase();
    if (searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts.where((product) {
        return product.title.toLowerCase().contains(searchQuery);
      }).toList();
    }
    //Finally the displayedProducts updates with filteredProducts.
    setState(() {
      displayedProducts = filteredProducts;
    });
  }

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    //Fetch all products from server by class ProductService
    futureProducts = ProductServices.getProducts();
    //then after fetch put all products to allProducts List and displayedProducts List
    futureProducts.then((products) {
      setState(() {
        allProducts = products;
        displayedProducts = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2531),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            HeadHomePage(
              username: widget.username,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                filterProducts();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryNavBar(
              onCategorySelected: onCategorySelcted,
              categorySelected: selectedCategory,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Falid to load products'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No products available'),
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: displayedProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.62),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          productModel: displayedProducts[index],
                          username: widget.username,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
