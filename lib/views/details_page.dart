import 'package:flutter/material.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/widget/productDetails/product_details_card.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel productModel;

  DetailsPage({super.key, required this.productModel});

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  productModel.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 867.4,
                ),
                Positioned(
                  top: 32,
                  right: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff1a2531),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? const Color(0xffea4e25)
                            : const Color(0xff7B8085),
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff1a2531),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 543,
                  left: 0,
                  right: 0,
                  child: DetailsCard(productModel: productModel),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
