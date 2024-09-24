import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/statemanagement/user_provider.dart';
import 'package:store_app/views/Login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              const Row(
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
                  Text(
                    Provider.of<UserProvider>(context).userdata!.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    Provider.of<UserProvider>(context).userdata!.email,
                    style: const TextStyle(
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
                      const SizedBox(
                        height: 80,
                        child: VerticalDivider(color: Colors.white),
                      ),
                      _buildCardItem(Icons.filter_1_outlined, 'Promo Code'),
                      const SizedBox(
                        height: 80,
                        child: VerticalDivider(color: Colors.white),
                      ),
                      _buildCardItem(Icons.person_rounded, 'Following'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(width: 30),
                  Text(
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
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(width: 30),
                  Text(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.error_outline,
                                    size: 25, color: Colors.white),
                              ),
                              const Text(
                                'Log out',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.yellow),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('isLoggedIn');

                              // Navigate back to the LoginPage
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                  (route) => false);
                            },
                            icon: const Icon(Icons.keyboard_arrow_right,
                                size: 25, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
