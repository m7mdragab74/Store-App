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
      backgroundColor: const Color(0xff1a2531),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mail, size: 20, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications,
                        size: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const Text(
                    'Nagham',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Nagham@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                color: const Color(0xff2f3d4e),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 100,
                  width: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCardItem(Icons.shop, 'My Orders'),
                      Container(
                        height: 80,
                        child: const VerticalDivider(color: Colors.white),
                      ),
                      _buildCardItem(Icons.filter_1_outlined, 'Promo Code'),
                      Container(
                        height: 80,
                        child: const VerticalDivider(color: Colors.white),
                      ),
                      _buildCardItem(Icons.person_rounded, 'Following'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 30),
                  const Text(
                    'General Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                color: const Color(0xff2f3d4e),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 300,
                  width: 390,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSettingCard(Icons.account_circle, 'My Account'),
                      _buildSettingCard(
                          Icons.payment_outlined, 'Payment Method'),
                      _buildSettingCard(
                          Icons.location_on_outlined, 'My Address'),
                      _buildSettingCard(Icons.notifications, 'Notification'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 30),
                  const Text(
                    'Other',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Card(
                color: const Color(0xff2f3d4e),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 300,
                  width: 390,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildOtherCard(
                          Icons.flag_rounded, 'Contact perferences'),
                      _buildOtherCard(
                          Icons.content_paste, 'Terms and Conditions'),
                      _buildOtherCard(Icons.error_outline, 'Log out'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
    );
  }

  Column _buildCardItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 25, color: Colors.white),
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.yellow),
        ),
      ],
    );
  }

  Widget _buildSettingCard(IconData icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(icon, size: 25, color: Colors.white),
            ),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.yellow),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_right,
              size: 25, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildOtherCard(IconData icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(icon, size: 25, color: Colors.white),
            ),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.yellow),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_right,
              size: 25, color: Colors.white),
        ),
      ],
    );
  }
}
