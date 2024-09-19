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
      backgroundColor: Color(0xff1a2531),
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
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            HeadHomePage(),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.70),
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
