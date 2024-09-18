import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  final List<CartItem> items = [
    CartItem('Linen Lampshade', 'White', 70,
        'https://media.almostmakesperfect.com/wp-content/uploads/2023/08/16124325/benson-chair-xl.jpeg'),
    CartItem('Round couch', 'Gray', 58,
        'https://media.almostmakesperfect.com/wp-content/uploads/2023/08/16124325/benson-chair-xl.jpeg'),
    CartItem('Geometric Table', 'Warm Oak', 153,
        'https://media.almostmakesperfect.com/wp-content/uploads/2023/08/16124325/benson-chair-xl.jpeg'),
  ];

  double getSubtotal() {
    return items.fold(0, (sum, item) => sum + item.price);
  }

  double getDeliveryFee() {
    return 10.0;
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = getSubtotal();
    double deliveryFee = getDeliveryFee();
    double total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: Color(0xff1a2531),
      appBar: AppBar(backgroundColor: Color(0xff1a2531),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.navigate_before,size: 40, color: Colors.white,)),
        title: Text('My Cart', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz,size: 40, color: Colors.white))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Items: ${items.length}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return CartCard(item: items[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Color(0xff1a2531),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('\$${subtotal.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('\$${deliveryFee.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow.shade200)),
                      Text('\$${total.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow.shade200)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Checkout for $total',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xffea4e25),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  final CartItem item;

  CartCard({required this.item});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1a2531),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    widget.item.imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.name,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      Text(widget.item.color,
                          style: TextStyle(color: Colors.grey[500])),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Color(0xff2f3d4e),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: IconButton(
                              onPressed: _incrementCounter,
                              icon: Icon(Icons.add,
                                  size: 18, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '$counter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          SizedBox(width: 6),
                          Container(
                            width: 35,
                            height: 37,
                            decoration: BoxDecoration(
                              color: Color(0xff2f3d4e),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: IconButton(
                              onPressed: _decrementCounter,
                              icon: Icon(Icons.remove,
                                  size: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text('\$${widget.item.price}',
                    style:
                    TextStyle(fontSize: 18, color: Colors.yellow.shade200)),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
                icon: Icon(Icons.close, color: Colors.white), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final String color;
  final double price;
  final String imageUrl;

  CartItem(this.name, this.color, this.price, this.imageUrl);
}
