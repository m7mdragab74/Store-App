import 'package:flutter/material.dart';
import 'package:store_app/views/fav_page.dart';
import 'package:store_app/views/profile_page.dart';
import 'package:store_app/widget/home/head_home_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';
import 'package:store_app/widget/home/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const primaryColor = Colors.blue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          pages: const [
            HomePage(),
            FavPage(),
            ProfilePage(),
          ],
          color: HomePage.primaryColor,
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        backgroundColor: const Color(0xff1a2531),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 17, left: 17, bottom: 17, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeadHomePage(),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.70,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return ProductCard();
                    }),
              ),
            ],
          ),
        ));
  }
}
