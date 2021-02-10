import 'package:flutter/material.dart';

class ContactTitre extends StatelessWidget {
  final String text;
  ContactTitre({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 20),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.grey)),
    );
  }
}
