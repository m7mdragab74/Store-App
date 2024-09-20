import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/statemanagement/favorite_provider.dart';
import 'package:store_app/views/details_page.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.productModel, required this.username});
  final Product productModel;
  final String username;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late FavoriteProvider _favoriteProvider;

  @override
  void initState() {
    super.initState();
    // Initialize the provider
    _favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    // Check the initial favorite status when the card is created
    _favoriteProvider.checkIfFavorite(widget.username, widget.productModel.title);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DetailsPage(productModel: widget.productModel,username: widget.username,),
          ),
        );
      },
      child: Card(
        color: const Color(0xff2f3d4e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      widget.productModel.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, child) {
                      // Check if the current product is a favorite
                      bool isFavorite = favoriteProvider.isFavorite(
                        widget.username,
                        widget.productModel.title,
                      );

                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff1a2531),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Toggle favorite status for this specific product
                            favoriteProvider.toggleFavorite(widget.username, {
                              'title': widget.productModel.title,
                              'price': widget.productModel.price,
                              'description': widget.productModel.description,
                              'category': widget.productModel.category,
                              'image': widget.productModel.image,
                              'rating_rate': widget.productModel.rating.rate,
                              'rating_count': widget.productModel.rating.count,
                            });
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? const Color(0xffea4e25)
                                : const Color(0xff7B8085),
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Text(
              widget.productModel.title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 3),
            Text(
              '\$${widget.productModel.price}',
              style: const TextStyle(
                color: Color(0xffEBC7A7),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.productModel.category,
              style: const TextStyle(color: Color(0xff7B8085)),
            ),
          ],
        ),
      ),
    );
  }
}
