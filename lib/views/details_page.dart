import 'package:flutter/material.dart';
import 'package:store_app/widget/productDetails/product_details_card.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/434055414_964541538594777_3039437514723769392_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=VI6FDdrj4GkQ7kNvgFP4gJc&_nc_ht=scontent.fcai19-12.fna&_nc_gid=ABvzC2aasCrkEICYb0JG93j&oh=00_AYCwW3owu5e5zgT7OY39OijFp9tDpOXGfmKMHz3ZRkEZAw&oe=66EF9C66',
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
                      isFavorite ? Icons.favorite : Icons.favorite,
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
                right: 56,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff1a2531),
                    border: const Border(),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
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
              const Positioned(
                top: 560,
                left: 0,
                right: 0,
                child: DetailsCard(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
