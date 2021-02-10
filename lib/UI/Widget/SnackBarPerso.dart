import 'package:flutter/material.dart';

class SnackBarError extends StatelessWidget {
  final String message;
  final double duration;
  BuildContext contextSnack;

  SnackBarError({this.message, this.duration, this.contextSnack});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.red[600], width: 1),
      ),
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      // padding: EdgeInsets.all(20),
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              'Merci de sélectionner  un Model',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'X',
        onPressed: () {
          Scaffold.of(context).removeCurrentSnackBar();
        },
      ),
    );
  }
}
