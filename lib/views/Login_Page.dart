import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/database/store_database.dart';
import 'package:store_app/model/usermodel.dart';
import 'package:store_app/services/userservice.dart';
import 'package:store_app/statemanagement/user_provider.dart';
import 'package:store_app/views/signup_page.dart';
import 'package:store_app/widget/home/nav_botton.dart';
import 'package:store_app/widget/signIn&signUp/Textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscuretext = true;
  bool remeberme = false;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future login() async {
    String username = usernamecontroller.text;
    String pass = passwordcontroller.text;
    Usermodel? user = await Userservice.checkemailandpass(username, pass);
    if (user != null) {
      // Save login information
      final dbHelper = DatabaseHelper();
      await dbHelper.insertUser(
        usernamecontroller.text,
        passwordcontroller.text,
      );
      Provider.of<UserProvider>(context, listen: false).username = username;
      Provider.of<UserProvider>(context, listen: false).userdata = user;
      final userModel = Usermodel(
        id: user.id,
        email: user.email,
        password: passwordcontroller.text,
        firstname: user.firstname,
        lastname: user.lastname,
        username: usernamecontroller.text,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userData', jsonEncode(userModel.toJson()));
      await prefs.setBool('isLoggedIn', true); // Save login status

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successful")));

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return CustomButtomNavBar(
          username: username,
        );
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password")));
      usernamecontroller.clear();
      passwordcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a2531),
      body: Expanded(
        child: ListView(children: [
          const SizedBox(
            height: 180,
          ),
          const Text(
            textAlign: TextAlign.center,
            "Login",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Textfield(
            onEdit: login,
            controller: usernamecontroller,
            title: "username",
            obscureText: false,
          ),
          Textfield(
            onEdit: login,
            controller: passwordcontroller,
            title: "passowrd",
            obscureText: obscuretext,
            obscuringchar: "*",
            suffix: IconButton(
                onPressed: () {
                  setState(() {
                    obscuretext = !obscuretext;
                  });
                },
                icon: obscuretext
                    ? const Icon(
                        Icons.visibility_off,
                      )
                    : const Icon(
                        Icons.visibility,
                      )),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.grey,
                  value: remeberme,
                  onChanged: (value) {
                    setState(() {
                      remeberme = value!;
                    });
                  }),
              const Text(
                "Remeber me",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: const Color(0xFF2f3d4e).withOpacity(.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: login,
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(80),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupPage();
                      }));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
