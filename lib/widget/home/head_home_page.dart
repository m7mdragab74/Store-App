import 'package:flutter/material.dart';

class HeadHomePage extends StatelessWidget {
  const HeadHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Discover products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        SizedBox(
          width: 76,
        ),
        Icon(
          Icons.shopping_basket_outlined,
          size: 31,
          color: Colors.white,
        ),
        SizedBox(
          width: 19,
        ),
        Icon(
          Icons.search_outlined,
          size: 31,
          color: Colors.white,
        ),
      ],
    );
  }
}
