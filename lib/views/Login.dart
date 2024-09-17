import 'package:flutter/material.dart';
import 'package:store_app/model/usermodel.dart';
import 'package:store_app/services/userservice.dart';
import 'package:store_app/views/home_page.dart';
import 'package:store_app/widget/Textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscuretext = true;
  bool remeberme = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Future login() async {
    String Email = emailcontroller.text;
    String pass = passwordcontroller.text;
    Usermodel? user = await Userservice.checkemailandpass(Email, pass);
    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Succussful")));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid email or pass")));
      emailcontroller.clear();
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
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(children: [
            const Spacer(
              flex: 2,
            ),
            Textfield(
              onEdit: login,
              controller: emailcontroller,
              title: "Email",
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
                          //size: 24,
                        )
                      : const Icon(
                          Icons.visibility,
                          //size: 24,
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Row(
                children: [
                  const Text(
                    "Don't have an account yet?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: login,
            //   child: Text("Login"),
            // ),
          ]),
        ));
  }
}
