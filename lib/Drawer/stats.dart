import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Stats extends KFDrawerContent {
  Stats({
    Key key,
  });

  @override
  _StatsState createState() => _StatsState();
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print(' Nous ne pouvons pas lancer cette commande $command');
  }
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarFord(onPressed: widget.onMenuPressed),
            Stack(
              overflow: Overflow.visible,
              children: [
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
                          'SERVICE CLIENT',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
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
                          'Votre service de conseil',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FORD ASSISTANCE A VOS COTES A TOUT INSTANT',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "En achetant un véhicule Ford, vous disposez désormais d'un service d'assistance 100 % en cas de panne ou d'accident, durant la période de garantie constructeur de 2 ans.Choisir le réseau Ford pour l'entretien et la réparation de votre Ford c'est prolonger sa fiabilité et le plaisir que vous avez à la conduire au quotidien.",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                              ),
                            ],
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          height: 40,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Information',
                                style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200].withOpacity(0.5),
                              spreadRadius: 1),
                        ], color: Colors.white),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(),
                            Text(
                              'Numéro',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '05 29 07 51 65',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    customLaunch('tel:05 29 075 165');
                                  },
                                  
                                  icon: Icon(Icons.call_outlined),
                                  color: Colors.red,
                                  padding: EdgeInsets.all(4),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200].withOpacity(0.5),
                                spreadRadius: 1),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(),
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Client@autohall.com',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900),
                                ),
                                IconButton(
                                  onPressed: () {
                                    customLaunch('mailto:Client@autohall.com');
                                  },
                                  icon: Icon(Icons.mail_outlined),
                                  color: Colors.red,
                                  padding: EdgeInsets.all(4),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
