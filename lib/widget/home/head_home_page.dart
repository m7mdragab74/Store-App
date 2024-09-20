import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/statemanagement/cart_provider.dart';
import 'package:store_app/views/cart.dart';

class HeadHomePage extends StatefulWidget {
  const HeadHomePage({super.key, required this.username});
  final String username;
  @override
  State<HeadHomePage> createState() => _HeadHomePageState();
}

class _HeadHomePageState extends State<HeadHomePage> {
  late CartProvider _cartProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Discover products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CartScreen(username: widget.username)));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors
                            .red, // Background color of the notification badge
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 10,
                      ),
                      child: Text(
                        '${cartProvider.cartProducts.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 19,
        ),
        const Icon(
          Icons.search_outlined,
          size: 31,
          color: Colors.white,
        ),
      ],
    );
  }
}
