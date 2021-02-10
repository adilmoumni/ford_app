import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:ford_mobil/UI/Widget/ContactTitre.dart';
import 'package:ford_mobil/UI/Widget/TextFormFieldContact.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class SavSteppers extends KFDrawerContent {
  SavSteppers({
    Key key,
  });

  @override
  _SavSteppersState createState() => _SavSteppersState();
}

class _SavSteppersState extends State<SavSteppers> {
  int groupe = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.send),
          label: Text('Envoyer'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarFord(
                onPressed: widget.onMenuPressed,
              ),
              Container(
                height: 90,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 30),
                      child: Text(
                        'Réclamation - Suggestion',
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
                        'Ford Réclamation et Suggestion ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactTitre(text: 'Titre :'),
                    SingleChildScrollView(
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
                            child: Text(
                              'mademoiselle',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TxetFormFieldContact(text: 'Nom'),
                    TxetFormFieldContact(text: 'Prénom'),
                    TxetFormFieldContact(text: 'Téléphone'),
                    TxetFormFieldContact(text: 'Email'),
                    ContactTitre(text: 'Nature de la demande: '),
                    SingleChildScrollView(
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
                              "Demande d'information",
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
                              'Réclamation',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TxetFormFieldContact(text: 'Commentaires'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
