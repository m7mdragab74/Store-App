import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store_app/views/fav_page.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/views/profile_page.dart';

class CustomButtomNavBar extends StatefulWidget {
  const CustomButtomNavBar({super.key, required this.username});
  final String username;

  @override
  State<CustomButtomNavBar> createState() => _CustomButtomNavBarState();
}

class _CustomButtomNavBarState extends State<CustomButtomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(
        username: widget.username,
      ),
      FavPage(
        username: widget.username,
      ),
      ProfilePage(
        username: widget.username,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1D20), // Dark color for background
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.grey.withOpacity(.1)),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: GNav(
                gap: 8, // Space between icon and text
                activeColor: const Color(0xFFDFB88F), // Active icon and text color (light tan)
                color: const Color(0xFF9E9E9E), // Inactive icon color (light grey)
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                duration: const Duration(milliseconds: 500),
                tabBackgroundColor: Colors.transparent, // No background color for active tab
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
