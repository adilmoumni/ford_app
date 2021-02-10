import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:ford_mobil/UI/Widget/ContactTitre.dart';
import 'package:ford_mobil/UI/Widget/TextFormFieldContact.dart';
import 'package:ford_mobil/services/VehicleService.dart';
import 'package:ford_mobil/services/modal.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class ReservezUnEssai extends KFDrawerContent {
  @override
  _ReservezUnEssaiState createState() => _ReservezUnEssaiState();
}

class _ReservezUnEssaiState extends State<ReservezUnEssai> {
  int groupe = 1;
  int selected = -1;
  final _formKey = GlobalKey<FormState>();
  String titre, nom, prenom, telephone, email, adresse, ville, codePostale;

  // SolidController _controller = SolidController();
  Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (selected == -1) {
            Scaffold.of(context).showSnackBar(SnackBar(
              action: SnackBarAction(label: 'Close', onPressed: () {}),
              content: Text('Merci de sélectionnez votre modèle'),
            ));
          }

          if (_formKey.currentState.validate() && selected != -1) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.

            if (groupe == 1)
              titre = 'Madame';
            else if (groupe == 2)
              titre = 'Monsieur';
            else
              titre = 'Mademoisell';

            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(titre + ' -- ' + ville)));
          }
        },
        icon: Icon(Icons.send),
        label: Text('Envoyer'),
      ),
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
                            'Test Drive ',
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
                            'Réservez un essai',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: VehicleService.brows(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        } else {
                          return ClipRRect(
                            child: Container(
                              height: 130,
                              child: Swiper(
                                pagination: new SwiperPagination(
                                  builder: SwiperPagination.rect,
                                ),
                                // control: SwiperControl(),
                                // controller: _swiperController,
                                // Conditional statement for enable and disable scrollview.
                                // physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.length,
                                viewportFraction: 0.5,
                                scale: 0.5,

                                loop: true,
                                // index: indexSwiper,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selected ==
                                            int.parse(snapshot
                                                .data[index].idModele)) {
                                          selected = -1;
                                        } else {
                                          selected = int.parse(
                                              snapshot.data[index].idModele);
                                        }
                                        print(snapshot.data[index].idModele +
                                            'fdj');
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Image.network(
                                              snapshot.data[index].photo),
                                        ),
                                        Positioned(
                                          // top: 0.0,
                                          left: 0.0,
                                          right: 0.0,
                                          bottom: 4.0,
                                          child: Center(
                                            child: Text(
                                              snapshot.data[index].nom,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5.0,
                                          // left: 4.0,
                                          right: 5.0,
                                          // bottom: 0.0,
                                          child: selected ==
                                                  int.parse(snapshot
                                                      .data[index].idModele)
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: Colors.indigo[900],
                                                )
                                              : Icon(
                                                  Icons
                                                      .check_box_outline_blank_rounded,
                                                  color: Colors.indigo[900],
                                                ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      }),
                  ContactTitre(text: 'Titre :'),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Radio button
                        children: [
                          Radio(
                            value: 1,
                            groupValue: groupe,
                            onChanged: ((T) {
                              setState(() {
                                groupe = T;
                              });
                            }),
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                groupe = 1;
                              });
                            }),
                            child: Text(
                              'Madame',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Radio(
                            value: 2,
                            groupValue: groupe,
                            onChanged: ((T) {
                              setState(() {
                                groupe = T;
                              });
                            }),
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                groupe = 2;
                              });
                            }),
                            child: Text(
                              'Monsieur',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Radio(
                            value: 3,
                            groupValue: groupe,
                            onChanged: ((T) {
                              setState(() {
                                groupe = T;
                              });
                            }),
                          ),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                groupe = 3;
                              });
                            }),
                            child: Text('mademoiselle',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Merci de remplire le champs';
                              }
                              setState(() {
                                nom = val;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                              focusColor: Colors.indigo[900],
                              prefixIcon: Icon(Icons.person),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              labelText: "Nom Et Prénom",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            children: [
                              // Image.network(
                              //   "https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Morocco.svg",
                              //   height: 20,
                              // )

                              Expanded(
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Merci de remplire le champs';
                                    }
                                    setState(() {
                                      telephone = val;
                                    });
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      width: 70,
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                                "assets/image/morocojpeg.jpeg",
                                                fit: BoxFit.cover,
                                                height: 18),
                                          ),
                                          Text(
                                            " +212",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10.0),
                                    labelText: "Téléphone",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: TextFormField(
                            validator: (value) {
                              print(value + '  this is email');
                              if (EmailValidator.validate(value)) {
                                print('this is email enter');
                                setState(() {
                                  email = value;
                                });
                                return null;
                              }
                              return "Veuillez saisir un e-mail valide";
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Merci de remplire le champs';
                              }
                              setState(() {
                                ville = val;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_city_rounded),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              labelText: "Ville",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Merci de remplire le champs';
                              }
                              setState(() {
                                adresse = val;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on_outlined),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              labelText: "Adresse",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Merci de remplire le champs';
                              }
                              setState(() {
                                codePostale = val;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.qr_code_rounded),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              labelText: "Code Postale",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
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
