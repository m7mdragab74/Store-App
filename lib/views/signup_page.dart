import 'package:flutter/material.dart';
import 'package:store_app/widget/signIn&signUp/Textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool obscuretext = true;
  bool obscurepass = true;
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confrimpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1a2531),
        appBar: AppBar(
          backgroundColor: Color(0xFF1a2531),
          title: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Column(
          children: [
            Textfield(title: "firstname", obscureText: false),
            Textfield(title: "Lastname", obscureText: false),
            Textfield(title: "Email", obscureText: false),
            Textfield(
                controller: passcontroller,
                title: "passoword",
                obscureText: obscurepass,
                obscuringchar: "*",
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurepass = !obscurepass;
                      });
                    },
                    icon: obscurepass
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ))),
            Textfield(
              controller: confrimpasscontroller,
              validator: (value) {
                if (value == passcontroller.text) {
                  return "passowrds match";
                } else {
                  return "passowrds don't match";
                }
              },
              title: " confirm passoword",
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
            Textfield(title: "Email", obscureText: false),
          ],
        ));
  }
}
