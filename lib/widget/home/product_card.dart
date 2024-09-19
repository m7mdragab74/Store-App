import 'package:flutter/material.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/views/details_page.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productModel});
  bool isFavorite = false;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(),
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
                      productModel.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff1a2531),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite,
                          color: isFavorite
                              ? const Color(0xffea4e25)
                              : const Color(0xff7B8085),
                          size: 30,
                        )),
                  ),
                )
              ],
            ),
            Text(
              productModel.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              '\$${productModel.price}',
              style: TextStyle(
                color: Color(0xffEBC7A7),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              productModel.category,
              style: TextStyle(color: Color(0xff7B8085)),
            )
          ],
        ),
      ),
    );
  }
}
