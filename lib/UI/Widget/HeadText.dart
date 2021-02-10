import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  final String text;
  HeadText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }
}
