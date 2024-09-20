import 'package:flutter/material.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/views/profile_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';




class FavPage extends StatefulWidget {
  const FavPage({super.key});


  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int _selectedIndex = 1;
  bool isFavorite = false;


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
      appBar: AppBar(
        backgroundColor: const Color(0xff1a2531),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_left, size: 35, color: Colors.white),
        ),
        title: Text(
          'Favourites',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),


    );
  }
}
