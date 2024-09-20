import 'package:flutter/material.dart';
import 'package:store_app/database/store_database.dart';
import 'package:store_app/model/usermodel.dart';
import 'package:store_app/services/userservice.dart';
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Succussful")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return CustomButtomNavBar(username: username,);
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or pass")));
      usernamecontroller.clear();
      passwordcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1a2531),
        appBar: AppBar(
          backgroundColor: Color(0xFF1a2531),
          title: const Text(
            "Login page",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Center(
          child: Column(children: [
            const Spacer(
              flex: 3,
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
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: Color(0xFF2f3d4e).withOpacity(.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: login,
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Row(
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
        ));
  }
}
