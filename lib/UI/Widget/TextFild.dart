import 'package:flutter/material.dart';

class TextFild extends StatelessWidget {
  final String txt;
  final bool obscurText;
  TextFild({this.txt, this.obscurText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: TextField(

        obscureText: obscurText,
        style: TextStyle(fontSize: 16, color: Colors.white),
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(color: Colors.grey.shade700),
          filled: true,
          fillColor: Color(0xFF161D27).withOpacity(0.9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue[800]),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue[800]),
          ),
        ),
      ),
    );
  }
}
