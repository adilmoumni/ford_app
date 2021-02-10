import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ford_mobil/UI/Widget/TextFild.dart';
import 'package:ford_mobil/main.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends KFDrawerContent {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/img2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Container(
                  height: 50,
                  child: Image(
                    image: AssetImage("assets/image/logo2.png"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xFF161D27).withOpacity(0.7),
                  Color(0xFF161D27),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "BIENVENUE!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Se connecter",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFild(txt: "Email"),
                      SizedBox(height: 12),
                      TextFild(
                        txt: "PasseWord",
                        obscurText: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Mot de passe oublier?",
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 40, right: 40),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: MainWidget(),
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(seconds: 2)));
                            // PageTransition(
                            //   type: PageTransitionType.fade,
                            //   child: Salamon(),
                            // ),
                            // );
                          },
                          color: Colors.blue[900].withOpacity(0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Se Connecter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "c'est vortre première fois ici?",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInButton(
                            Buttons.Facebook,
                            mini: true,
                            shape: CircleBorder(),
                            onPressed: () {},
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.blue[800].withOpacity(0.7),
                            textColor: Colors.white,
                            child: Icon(
                              Icons.fingerprint,
                              size: 24,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                          SignInButton(
                            Buttons.Email,
                            mini: true,
                            shape: CircleBorder(),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
