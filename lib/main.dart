import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ford_mobil/Drawer/SavSteppers.dart';
import 'package:ford_mobil/Drawer/class_builder.dart';
import 'package:ford_mobil/Drawer/page7.dart';
import 'package:ford_mobil/Drawer/page8.dart';
import 'package:ford_mobil/Drawer/page9.dart';

import 'package:ford_mobil/Drawer/settings.dart';
import 'package:ford_mobil/Drawer/stats.dart';
import 'package:ford_mobil/HomePage.dart';
import 'package:ford_mobil/LoginPage.dart';
import 'package:ford_mobil/UI/Screen/DetailPage.dart';
import 'package:ford_mobil/UI/Screen/ReclamationSuggestion.dart';
import 'package:ford_mobil/UI/Screen/ReservezUnEssaiState.dart';
import 'package:ford_mobil/UI/Screen/home.dart';

import 'package:kf_drawer/kf_drawer.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      // home: DetailPapge(),
    );
  }
}

//Loading Page
class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
          // MainWidget
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/image/logo2.png"),
            height: 70,
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            height: 30,
            child: SpinKitChasingDots(
              color: Colors.blue[800],
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

//Next Page
class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text:
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Réservez un essai',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(
            Icons.account_box,
            color: Colors.white,
          ),
          page: ReservezUnEssai(),
        ),
        KFDrawerItem.initWithPage(
          text:
              Text('SAV', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.notifications_active, color: Colors.white),
          page: ReclamationSuggestion(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Ford Assistance',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.trending_up, color: Colors.white),
          page: Stats(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Réclamation',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.av_timer, color: Colors.white),
          page: SavSteppers(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Map',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
        //il faut ajouter des constructeur
        KFDrawerItem.initWithPage(
          text: Text(
            'Ford Salaf',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Page7(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Ford Tajdid',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Page8(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Ford Occasion',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Page9(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Login Page',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.red),
          page: LoginPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: KFDrawer(
        animationDuration: Duration(milliseconds: 60),
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // image: DecorationImage(
                    //     image: AssetImage('images/image.jpg'),
                    //     fit: BoxFit.cover
                    // )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ford ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FordFont',
                          fontSize: 40),
                    ),
                    new SizedBox(height: 2),
                    // new Texrt('Actress',
                    //     style: new TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            '© ' + DateTime.now().year.toString() + " FORD",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // colors: [Color.fromRGBO(31, 58, 47, 1.0), Color.fromRGBO(31, 58, 47, 1.0)],
            colors: [
              Colors.blue[800],
              Colors.blue[700],
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
