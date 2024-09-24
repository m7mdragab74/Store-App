import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/statemanagement/favorite_provider.dart';
import 'package:store_app/widget/productDetails/product_details_card.dart';

class DetailsPage extends StatefulWidget {
  final Product productModel;
  final String username;
  const DetailsPage(
      {super.key, required this.productModel, required this.username});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  late FavoriteProvider _favoriteProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<FavoriteProvider>(
              builder: (context, favoriteProvider, child) {
            bool isFavorite = favoriteProvider.isFavorite(
              widget.username,
              widget.productModel.title,
            );
            return IconButton(
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
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? const Color(0xffea4e25)
                    : const Color(0xff7B8085),
                size: 30,
              ),
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.network(
              widget.productModel.image,
              width: double.infinity,
              height: 350,
            ),
          ),
          const Spacer(),
          DetailsCard(
            productModel: widget.productModel,
            username: widget.username,
          ),
        ],
      ),
    );
  }
}
