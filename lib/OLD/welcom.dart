import 'package:flutter/material.dart';
import 'package:ford_mobil/LoginPage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/img1.jpg"),
                ),
              ),
              child: Container(
                child: LoginPage(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
