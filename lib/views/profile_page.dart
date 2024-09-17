import 'package:flutter/material.dart';
import 'package:store_app/views/fav_page.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

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
      appBar: AppBar(),
    );
  }
}
