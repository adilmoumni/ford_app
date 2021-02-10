import 'package:flutter/material.dart';

class Login1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage("assets/image/logo2.png"),
            )),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Account login',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Phone / Email / Account',
              labelText: 'account number',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 30,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Please enter your account password',
              labelText: 'password',
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 30,
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'log in',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.redAccent,
            onPressed: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Center(child: Text('Login |')),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Container(
          margin: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Text('Quick Login'),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
