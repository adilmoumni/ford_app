import 'package:flutter/material.dart';
import 'package:ford_mobil/Drawer/page10.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class Page9 extends KFDrawerContent {
  Page9({
    Key key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Page9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBarFord(onPressed: widget.onMenuPressed),
                  Container(
                    height: 90,
                    color: Colors.grey[200].withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 18, left: 30),
                          child: Text(
                            'FORD Occasion',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 7,
                          ),
                          child: Container(
                            color: Colors.indigo[900],
                            height: 2.500,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'FORD Occasion...',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FORD Occasion ',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Vous recherchez un véhicule d’occasion? Vous souhaitez faire la reprise de votre ancienne voiture contre un véhicule Ford neuf? Alors vous avez mille raisons d’accorder votre confiance à Ford Certifiés d’Occasion.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          Text(
                            'Offre Reprise ',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Vous avez actuellement un véhicule que vous voulez faire reprendre ?\n\nVotre véhicule a de la valeur pour vous comme pour nous.\n\nConfiez-le nous quelques instants pour une expertise et nous vous proposerons la meilleure offre commerciale de reprise..",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          Center(
                              child: FlatButton(
                            child: Text('Remplire le Formultaire'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: Page10(),
                                  inheritTheme: true,
                                  ctx: context,
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 700),
                                ),
                              );
                            },
                            color: Colors.blue[600],
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
