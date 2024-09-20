import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate/rate.dart';
import 'package:store_app/statemanagement/favorite_provider.dart';
import 'package:store_app/views/details_page.dart';
import '../model/store_model.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key, required this.username});
  final String username;
  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  void initState() {
    super.initState();
    // Load favorite products when the screen is initialized
    Future.microtask(() => Provider.of<FavoriteProvider>(context, listen: false)
        .loadFavoriteProducts(widget.username));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff1a2531),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 33, 48, 65),
            title: const Text('Favorites',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
          body: Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, child) {
              if (favoriteProvider.favoriteProducts.isEmpty) {
                return const Center(
                    child: Text(
                  'No favorite products found',
                  style: TextStyle(color: Colors.white),
                ));
              }
              return ListView.builder(
                itemCount: favoriteProvider.favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProvider.favoriteProducts[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 35, 52, 71),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image section
                            Container(
                              width: 120,
                              height: 170,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(product['image']))),
                                ),
                              ),
                            ),
                            // Text and arrow section
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      product['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      product['category'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$${product['price']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Rate(
                                      iconSize: 15,
                                      color: Colors.yellow.shade700,
                                      allowHalf: true,
                                      allowClear: true,
                                      initialValue: product['rating_rate'],
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Rating rating = Rating(
                                  rate: product['rating_rate'],
                                  count: product['rating_count'],
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      productModel: Product(
                                        title: product['title'],
                                        price: product['price'],
                                        description: product['description'],
                                        category: product['category'],
                                        image: product['image'],
                                        rating: rating,
                                      ),
                                      username: widget.username,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ));
                },
              );
            },
          )),
    );
  }
}
