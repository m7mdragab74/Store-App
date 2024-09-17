import 'package:flutter/material.dart';
import 'package:store_app/widget/home/head_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1a2531),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 17, left: 17, bottom: 17, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadHomePage(),
              SizedBox(
                height: 30,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19,
                  mainAxisSpacing: 17,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 29,
                    width: 29,
                    color: Colors.white,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
