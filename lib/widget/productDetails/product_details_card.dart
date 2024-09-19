import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

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
          const Text(
            'Porcelain Lamp',
            style: TextStyle(
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
              const Text(
                '4.8',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.comment, color: Colors.white70, size: 18),
              const SizedBox(width: 4),
              const Text(
                '9 reviews',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const Text(
            'This stylish porcelain lamp will give you a soft warm light which can make your interior look exclusive and cozy.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 1,
            color: Color(0xff7B8085),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Column(
                children: [
                  Text(
                    '\$100.30',
                    style: TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    '\$99.99',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
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
