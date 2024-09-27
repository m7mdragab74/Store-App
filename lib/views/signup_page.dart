import 'package:flutter/material.dart';
import 'package:store_app/services/userservice.dart';
import 'package:store_app/views/Login_Page.dart';
import 'package:store_app/widget/signIn&signUp/Textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool obscurepass = true;
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      final user = {
        "address": {
          "geolocation": {"lat": "-37.3159", "long": "81.1496"},
          "city": "kilcoole",
          "street": "new road",
          "number": 7682,
          "zipcode": "12926-3874"
        },
        "id": 1,
        "email": emailcontroller,
        "username": usernamecontroller,
        "password": passwordcontroller,
        "name": {
          "firstname": firstnamecontroller,
          "lastname": lastnamecontroller
        },
        "phone": "1-570-236-7033",
        "__v": 0
      };
      try {
        await Userservice.Signup(user);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successful sign up!")));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to Signup!")));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    signup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1a2531),
        ),
        backgroundColor: Color(0xFF1a2531),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(color: Colors.grey, fontSize: 35),
              ),
              const SizedBox(
                height: 40,
              ),
              Textfield(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a firstname';
                  }
                  return null;
                },
                title: "firstname",
                obscureText: false,
                controller: firstnamecontroller,
              ),
              Textfield(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a lastname';
                  }
                  return null;
                },
                title: "Lastname",
                obscureText: false,
                controller: lastnamecontroller,
              ),
              Textfield(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a email';
                  }
                  return null;
                },
                title: "Email",
                obscureText: false,
                controller: emailcontroller,
              ),
              Textfield(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                title: "username",
                obscureText: false,
                controller: usernamecontroller,
              ),
              Textfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: passwordcontroller,
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
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                color: Color(0xFF2f3d4e).withOpacity(.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: signup,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
