import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  String title;
  bool obscureText;
  String? obscuringchar;
  Widget? suffix;
  TextEditingController? controller;
  void Function()? onEdit;
  String? Function(String?)? validator;

  Textfield(
      {required this.title,
      required this.obscureText,
      this.obscuringchar,
      this.suffix,
      this.controller,
      this.onEdit,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: validator,
          onEditingComplete: onEdit,
          controller: controller,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.grey,
          obscureText: obscureText,
          obscuringCharacter: obscuringchar ?? "*",
          decoration: InputDecoration(
            suffix: suffix,
            label: Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFF2f3d4e).withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
