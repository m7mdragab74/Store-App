import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/model/usermodel.dart';
import 'package:store_app/statemanagement/user_provider.dart';
import 'package:store_app/views/Login.dart';
import 'package:store_app/widget/home/nav_botton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  // Combined function to handle splash delay and login check
  Future<void> _startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await _checkUserLogin(); // After delay, check user login status
  }

  Future<void> _checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn =
        prefs.getBool('isLoggedIn') ?? false; // Check login status

    Usermodel? userModel; // Declare userModel outside the if statement

    if (isLoggedIn) {
      // Retrieve user data from SharedPreferences (assuming you saved it)
      final userJson = prefs.getString('userData');
      if (userJson != null) {
        userModel =
            Usermodel.fromjson(jsonDecode(userJson)); // Assign userModel
        Provider.of<UserProvider>(context, listen: false)
            .setUserData(userModel);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CustomButtomNavBar(
              username: userModel?.username ?? ''), // Use null-aware operator
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2531),
      body: Center(
        child: Image.asset(
          'assets/splash screen.JPG',
        ),
      ),
    );
  }
}
