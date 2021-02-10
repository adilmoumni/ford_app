import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

// ignore: must_be_immutable
class Page8 extends KFDrawerContent {
  Page8({
    Key key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Page8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            'FORD TAJDID',
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
                            'Roulez, renouvelez....',
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
                            'FORD TAJDID ',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              "Une première et exclusivement proposé par la marque FORD au Maroc ; Ford Tajdid est un produit ingénieux qui vous permet de rouler dans une voiture neuve, tous les deux, trois ou quatre ans, sans soucis et pour un budget adapté à vos capacités.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Avec de faibles niveaux d’apports, et des mensualités qui intègrent l’entretien de votre véhicule, vous pouvez rouler en toute tranquillité.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          Text(
                            'Comment cela fonctionne ?',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text.rich(
                              TextSpan(
                                text: 'Au début du contrat : ',
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold), // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "Une formule souple et compétitive avec un financement sur-mesure, des remboursements modulables allant jusqu’à 72 mois, et des niveaux d’apport adaptés au budget du client.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text.rich(
                              TextSpan(
                                text: 'Pendant la durée du contrat : ',
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold), // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "Vous payez vos mensualités qui incluent l’entretien total de votre véhicule.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Text.rich(
                              TextSpan(
                                text: 'A la fin du contrat : ',
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold), // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Trois choix s’offrent à vous.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "    	⦁ Acquérir une nouvelle voiture",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            "    	⦁	Restituez votre voiture.",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            "    	⦁	Gardez votre voiture en payant la valeur résiduelle restante",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Simulation de financement :',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              "Nos conseiller crédit, disponibles dans le réseau des succursales FORD, se feront plaisir de vous proposer le financement adéquat, selon vos besoins et capacités d’endettement.",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // Container(
                          //   height: 300,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       fit: BoxFit.scaleDown,
                          //       image:
                          //           AssetImage("assets/image/ford tajdid.jpg"),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20),
                            child: PinchZoomImage(
                              image: Image.asset(
                                "assets/image/ford tajdid.jpg",
                              ),
                              hideStatusBarWhileZooming: true,
                              onZoomStart: () {
                                print('Zoom started');
                              },
                              onZoomEnd: () {
                                print('Zoom finished');
                              },
                            ),
                          ),
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
