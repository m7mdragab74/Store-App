import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/store_model.dart';
import 'package:store_app/statemanagement/cart_provider.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key, required this.productModel, required this.username});
  final Product productModel;
  final String username;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  late CartProvider _cartProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  void _addToCart() async {
    bool isInCart = await _cartProvider.isProductInCart(
        widget.username, widget.productModel.title);
    if (isInCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product is already in the cart!')),
      );
    } else {
      await _cartProvider.addToCart(widget.username, {
        'title': widget.productModel.title,
        'price': widget.productModel.price,
        'description': widget.productModel.description,
        'category': widget.productModel.category,
        'image': widget.productModel.image,
        'rating_rate': widget.productModel.rating.rate,
        'rating_count': widget.productModel.rating.count,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added to the cart!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(33), topRight: Radius.circular(33)),
          color: Color(0xff1a2531)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            widget.productModel.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'On sale',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                '${widget.productModel.rating.rate}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.comment, color: Colors.white70, size: 18),
              const SizedBox(width: 4),
              Text(
                '${widget.productModel.rating.count} reviews',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Text(
            widget.productModel.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 1,
            color: Color(0xff7B8085),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '\$${widget.productModel.price + 10}',
                    style: const TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '\$${widget.productModel.price}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 205, 125, 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
