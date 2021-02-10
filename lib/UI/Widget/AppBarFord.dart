import 'package:flutter/material.dart';

class AppBarFord extends StatelessWidget {
  final Function onPressed;
  final String textBar;
  final bool visible;
  final bool arrowBack;
  AppBarFord(
      {this.onPressed,
      this.textBar = "Ford ",
      this.visible = false,
      this.arrowBack = false});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                arrowBack == false ? Icons.notes_outlined : Icons.arrow_back,
                color: arrowBack == false ? Colors.black : Colors.blue[900],
              ),
              onPressed: onPressed,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              textBar,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'FordFont',
                  fontSize: 50),
            ),
          ),
        ),
        SizedBox(width: 15),
        Visibility(
          child: Icon(Icons.more_vert_outlined),
          visible: visible,
        ),
      ],
    );
  }
}
