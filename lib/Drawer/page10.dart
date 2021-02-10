import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:ford_mobil/UI/Widget/TextFormFieldContact.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class Page10 extends KFDrawerContent {
  Page10({
    Key key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Page10> {
  int groupe = 1;
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.send),
        label: Text('Envoyer'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AppBarFord(
                  arrowBack: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                          'FORD Occasion : Formulaire',
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Info client ',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TxetFormFieldContact(
                        text: 'Nom & prénom',
                      ),
                      TxetFormFieldContact(
                        text: 'Ville',
                      ),
                      TxetFormFieldContact(
                        text: 'Téléphone',
                      ),
                      TxetFormFieldContact(
                        text: 'Emain',
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Info Véhicule',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue[200],
                            border: Border.all(color: Colors.white)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: 0, items: null, onChanged: (value) {}),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
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
                      itemCount: 10,
                      viewportFraction: 0.5,
                      scale: 0.5,

                      loop: true,
                      // index: indexSwiper,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selected == index) {
                                selected = -1;
                              } else {
                                selected = index;
                              }
                              print(index);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/image/mustang.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                // top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                bottom: 4.0,
                                child: Center(
                                  child: Text(
                                    'Mustang',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                // left: 4.0,
                                right: 0.0,
                                // bottom: 0.0,
                                child: selected == index
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.blue[700],
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      TxetFormFieldContact(
                        text: 'Immatriculation',
                      ),
                      TxetFormFieldContact(
                        text: 'Date MEC',
                      ),
                      TxetFormFieldContact(
                        text: 'Vesion',
                      ),
                      TxetFormFieldContact(
                        text: 'Carburant',
                      ),
                      TxetFormFieldContact(
                        text: 'Kms',
                      ),
                      Text('Premiere Main'),
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
                                  'OUI',
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
                                  'NON',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TxetFormFieldContact(
                        text: 'Couleur',
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
