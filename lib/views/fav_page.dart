import 'package:flutter/material.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key, required this.username});
  final String username;
  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2531),
      appBar: AppBar(),
    );
  }
}
