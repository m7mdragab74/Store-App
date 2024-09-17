import 'package:flutter/material.dart';
import 'package:store_app/views/details_page.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailsPage(),
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
                      'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/434055414_964541538594777_3039437514723769392_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=VI6FDdrj4GkQ7kNvgFP4gJc&_nc_ht=scontent.fcai19-12.fna&_nc_gid=ABvzC2aasCrkEICYb0JG93j&oh=00_AYCwW3owu5e5zgT7OY39OijFp9tDpOXGfmKMHz3ZRkEZAw&oe=66EF9C66',
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
            const Text(
              'lamb',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              '\$1500',
              style: TextStyle(
                color: Color(0xffEBC7A7),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Category',
              style: TextStyle(color: Color(0xff7B8085)),
            )
          ],
        ),
      ),
    );
  }
}
