import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class Page7 extends KFDrawerContent {
  Page7({
    Key key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Page7> {
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
                            'FORD SALAF',
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
                            'Ford Salaf, un an de succès',
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
                              'FORD SALAF ',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "FORD SALAF vous propose une panoplie de service et solutions de financements, selon le profil de chaque client Il s’agit de produits de financements attractifs, avantageux et exclusifs à FORD SALAF",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                            Text(
                              'Crédit Gratuit 0%.',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "Une formule souple et compétitive avec un financement sur-mesure, des remboursements modulables allant jusqu’à 72 mois, et des niveaux d’apport adaptés au budget du client.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/clé ford.jfif"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Ford Salaf AUTO.',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "En souscrivant à l’offre Ford Salaf Auto, le client est propriétaire de son véhicule dès le premier jour. À la fin de son contrat, il peut à tout moment lever le barrement de la carte grise.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                          ]),
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
