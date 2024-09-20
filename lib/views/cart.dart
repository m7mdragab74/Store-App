import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/statemanagement/cart_provider.dart';

class CartScreen extends StatefulWidget {
  final String username;

  const CartScreen({super.key, required this.username});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<CartProvider>(context, listen: false)
        .loadCartProducts(widget.username));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2531),
      appBar: AppBar(
        backgroundColor: const Color(0xff1a2531),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
              size: 40,
              color: Colors.white,
            )),
        title: const Text('My Cart',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, size: 40, color: Colors.white))
        ],
      ),
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        if (cartProvider.cartProducts.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text(
                'No Products found in Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Items: ${cartProvider.cartProducts.length}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: cartProvider.cartProducts.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = cartProvider.cartProducts[index];
                    return CartCard(
                      productModel: product,
                      username: widget.username,
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color(0xff1a2531),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade200)),
                        Text(
                            '\$${cartProvider.calculateTotalPrice().toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade200)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffea4e25),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                      'Checkout for ${cartProvider.calculateTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard(
      {super.key, required this.productModel, required this.username});
  final productModel;
  final String username;
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) => Card(
        color: const Color(0xff1a2531),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      widget.productModel['image'],
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.productModel['title'],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 37,
                              decoration: BoxDecoration(
                                color: const Color(0xff2f3d4e),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (widget.productModel['quantity'] > 1) {
                                    cartProvider.updateCartProductQuantity(
                                      widget.username,
                                      widget.productModel['title'],
                                      -1,
                                    );
                                  }
                                },
                                icon: const Icon(Icons.remove,
                                    size: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${widget.productModel['quantity']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: 35,
                              height: 37,
                              decoration: BoxDecoration(
                                color: const Color(0xff2f3d4e),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  cartProvider.updateCartProductQuantity(
                                    widget.username,
                                    widget.productModel['title'],
                                    1,
                                  );
                                },
                                icon: const Icon(Icons.add,
                                    size: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('\$${widget.productModel['price']}',
                      style: TextStyle(
                          fontSize: 18, color: Colors.yellow.shade200)),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
