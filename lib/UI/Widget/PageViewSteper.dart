import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:ford_mobil/UI/Widget/ContactTitre.dart';
import 'package:ford_mobil/model/CarModel.dart';
import 'package:ford_mobil/model/TypeDeMatriculatoin.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PageViewSteper extends KFDrawerContent {
  final Function onPressed;

  PageViewSteper({this.onPressed});

  @override
  _State createState() => _State();
}

class _State extends State<PageViewSteper> {
  // ignore: unused_field
  SwiperControl _swiperControl;
  SwiperController _swiperController = SwiperController();
  PageController _pageController;
  String matriculationVal1 = "";
  String matriculationVal2 = "";
  String matriculationVal3 = "";
  String title;
  int indexSwiper;

  //page3
  //return Id of Model selected
  int idModel = -1;
  void modelChangedChild(int value) {
    setState(() {
      idModel = value;
    });
  }

  //Page1
  //Return val1 val2 Type matriculation Numero de série
  int val1 = -1;
  int val2 = -1;
  int numSerie = -1;
  String type = "";
  void val1Changed(int value) {
    setState(() {
      val1 = value;
    });
  }

  void val2Changed(int value) {
    setState(() {
      val2 = value;
    });
  }

  void typeChanged(String value) {
    setState(() {
      type = value;
    });
  }

  void numSerieChanged(int value) {
    setState(() {
      numSerie = value;
    });
  }

  //Page2 Information
  //Return Nom Prenom Email Téléphone
  String nom = '';
  String prenom = '';
  String email = '';
  String telephone = '';
  void nomChanged(String value) {
    setState(() {
      nom = value;
    });
  }

  void prenomChanged(String value) {
    setState(() {
      prenom = value;
    });
  }

  void emailChanged(String value) {
    setState(() {
      email = value;
    });
  }

  void telephoneChanged(String value) {
    setState(() {
      telephone = value;
    });
  }

  //page 4 Type d'intervention
  // return id of value selected
  int idIntervnetion = -1;
  void interventionChanged(int value) {
    setState(() {
      idIntervnetion = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _swiperController.index = 0;
    _swiperController.move(0);
    _pageController = PageController(
      initialPage: 0,
      // keepPage: true,
      // viewportFraction: 1,
    );
    // _swiperControl = SwiperControl();
    indexSwiper = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> image = [
      Page3(
        modelChanged: modelChangedChild,
      ), //Choisire le model
      Page1(
        numSerieChanged: numSerieChanged,
        typeChanged: typeChanged,
        val1Changed: val1Changed,
        val2Changed: val2Changed,
      ), // Immatriculation
      Page2(
        emailChanged: emailChanged,
        nomChanged: nomChanged,
        prenomChanged: prenomChanged,
        telephoneChanged: telephoneChanged,
      ), // Information complaimentaire
      Page4(), // Choisissez Le Type D'intervention
      Page5(), //CHOISISSEZ LE TYPE D'INTERVENTION
      Page6(), //CHOISISSEZ VOTRE DATE RDV
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      backgroundColor: Colors.white,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.keyboard_arrow_left_sharp),
            onPressed: () async {
              if (_swiperController.index != 0) {
                _swiperController.previous();
                setState(() {
                  _swiperController.index--;
                });
                // setState(() {
                //   var count = _swiperController.index;
                //   // indexSwiper = indexSwiper - 1;
                //   indexSwiper = count - 1;
                //   print(indexSwiper.toString() + '-' + count.toString());
                // });
              }
              print(_swiperController.index.toString());
            },
          ),
          SizedBox(
            width: 10,
            height: 150,
          ),
          FloatingActionButton(
            child: Icon(Icons.keyboard_arrow_right_sharp),
            onPressed: () {
              if (_swiperController.index == 0) {
                if (idModel != -1) {
                  Scaffold.of(context).hideCurrentSnackBar();

                  _swiperController.next();
                  setState(() {
                    _swiperController.index++;
                  });
                } else {
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: Colors.red[600], width: 1)),
                    margin: EdgeInsets.all(10),
                    behavior: SnackBarBehavior.floating,
                    // padding: EdgeInsets.all(20),
                    backgroundColor: Colors.red,
                    content: Row(
                      children: [
                        Icon(
                          Icons.error_outline_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Merci de sélectionner  un Model ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    action: SnackBarAction(
                      textColor: Colors.white,
                      label: 'X',
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                      },
                    ),
                  ));
                }
              } else if (_swiperController.index == 1) {
                print(_swiperController.index.toString());
                var lent = numSerie.toString().length;
                if (type == '' || type == null) {
                  type = 'E';
                }
                if (val1 == -1 || val2 == -1 || lent < 17) {
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.red[600], width: 1)),
                      margin: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      // padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red,
                      content: Row(
                        children: [
                          Icon(
                            Icons.error_outline_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Merci de Remplire les informations $indexSwiper',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      action: SnackBarAction(
                        textColor: Colors.white,
                        label: 'X',
                        onPressed: () {
                          Scaffold.of(context).removeCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                } else {
                  _swiperController.next();
                  setState(() {
                    _swiperController.index++;
                  });
                }
              } else if (_swiperController.index == 2) {
                if (nom == '' ||
                    prenom == '' ||
                    email == '' ||
                    telephone == '') {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.red[600], width: 1)),
                      margin: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      // padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red,
                      content: Row(
                        children: [
                          Icon(
                            Icons.error_outline_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Merci de Remplire les informations $indexSwiper',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      action: SnackBarAction(
                        textColor: Colors.white,
                        label: 'X',
                        onPressed: () {
                          Scaffold.of(context).removeCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                } else {
                  Scaffold.of(context).removeCurrentSnackBar();
                  _swiperController.next();
                  setState(() {
                    _swiperController.index++;
                  });
                }
              } else if (_swiperController.index == 3) {
                if (idIntervnetion == -1) {
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: Colors.red[600], width: 1)),
                    margin: EdgeInsets.all(10),
                    behavior: SnackBarBehavior.floating,
                    // padding: EdgeInsets.all(20),
                    backgroundColor: Colors.red,
                    content: Row(
                      children: [
                        Icon(
                          Icons.error_outline_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "Merci de sélectionner l'intervention $indexSwiper",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    action: SnackBarAction(
                      textColor: Colors.white,
                      label: 'X',
                      onPressed: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                      },
                    ),
                  ));
                } else {
                  _swiperController.next();
                  setState(() {
                    _swiperController.index++;
                  });
                }
              } else if (_swiperController.index == 4) {
                _swiperController.next();
                setState(() {
                  _swiperController.index++;
                });
              } else {
                // setState(() {
                //   // indexSwiper = indexSwiper + 1;
                //   indexSwiper = _swiperController.index;
                // });
                // _swiperController.move(indexSwiper - 1);
              }
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    //Style 1
                    // Colors.blueAccent[200],
                    // Colors.blue[900],

                    //Style 2
                    // Colors.blue[200],
                    // Colors.blueGrey[900],

                    // Style 3
                    Colors.white,
                    Colors.blueGrey[200],
                    // Colors.blueGrey[400],
                    // Colors.blueGrey[600],
                    Colors.blueGrey[900],
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  AppBarFord(
                    onPressed: widget.onPressed,
                    // visible: true,
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
                            'SAV FORD',
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
                            'Ford Entretien ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    // borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 400,
                      child: Swiper(
                        duration: 1000,
                        pagination: SwiperPagination(
                          margin: const EdgeInsets.only(top: 200),
                        ),
                        // control: SwiperControl(),
                        controller: _swiperController,
                        // Conditional statement for enable and disable scrollview.
                        // physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: image.length,
                        viewportFraction: 0.9999999,
                        scale: 0,
                        loop: false,
                        // index: indexSwiper,
                        itemBuilder: (BuildContext context, int index) {
                          return new Container(
                            child: image[index],
                          );
                        },
                      ),
                    ),
                  ),
                  // SmoothPageIndicator(
                  //   controller: PageController(initialPage: 5,),
                  //   count: 6,
                  //   effect: WormEffect(),
                  // ),
                  // Text('$indexSwiper / 6',
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// page 3 pour selecter votre Modèle
class Page3 extends StatefulWidget {
  final modelChanged;

  Page3({Key key, this.modelChanged}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

// page 3 pour selecter votre Modèle
class _Page3State extends State<Page3> {
  List<CarModel> _categoryTitle = CarModel.getListCarModel();
  List<DropdownMenuItem<CarModel>> _dropdownMenuItem;
  CarModel _selectedCarModel;
  int selected = -1;

  //Initialiser les Variables crées
  @override
  void initState() {
    _dropdownMenuItem = buildDropDownMenuItems(_categoryTitle);
    _selectedCarModel = _dropdownMenuItem[0].value;
    super.initState();
  }

  //Methode pour faire Builder le DropDownMenuItem
  List<DropdownMenuItem<CarModel>> buildDropDownMenuItems(
      List typeMatriculation) {
    List<DropdownMenuItem<CarModel>> items = List();
    for (CarModel type in typeMatriculation) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Row(
            children: [
              SizedBox(
                height: 30,
                child: type.urlModel == '' || type.urlModel == null
                    ? null
                    : Image.network(type.urlModel),
              ),
              Text(type.name),
            ],
          ),
        ),
      );
    }
    return items;
  }

  //Function poru faire le L'EVENEMENT OnChang
  onChangDropDownItem(CarModel carMode) {
    setState(() {
      _selectedCarModel = carMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(0),
        // blur: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ContactTitre(text: 'QUEL EST VOTRE MODÈLE ?'),
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
                      scale: 0.4,
                      loop: true,
                      // index: indexSwiper,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selected == index) {
                                selected = -1;
                                widget.modelChanged(-1);
                              } else {
                                selected = index;
                                widget.modelChanged(index);
                              }
                              print(index);
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // color: (index == selected)
                                  //     ? Colors.grey
                                  //     : Colors.grey[200],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  final val1Changed;
  final val2Changed;
  final typeChanged;
  final numSerieChanged;

  Page1(
      {Key key,
      this.val1Changed,
      this.val2Changed,
      this.typeChanged,
      this.numSerieChanged})
      : super(key: key);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //Create Variable pour faire Avoir les données
  List<TypeDeMatriculation> _categoryTitle = TypeDeMatriculation.getCompanies();
  List<DropdownMenuItem<TypeDeMatriculation>> _dropdownMenuItem;
  TypeDeMatriculation _selectedTypeDeMatriculation;

  //Initialiser les Variables crées
  @override
  void initState() {
    _dropdownMenuItem = buildDropDownMenuItems(_categoryTitle);
    _selectedTypeDeMatriculation = _dropdownMenuItem[0].value;
    super.initState();
  }

  //Methode pour faire Builder le DropDownMenuItem
  List<DropdownMenuItem<TypeDeMatriculation>> buildDropDownMenuItems(
      List typeMatriculation) {
    List<DropdownMenuItem<TypeDeMatriculation>> items = List();
    for (TypeDeMatriculation type in typeMatriculation) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Text(
            type.name,
          ),
        ),
      );
    }
    return items;
  }

  //Function poru faire le L'EVENEMENT OnChang
  onChangDropDownItem(TypeDeMatriculation typeDeMatriculation) {
    setState(() {
      _selectedTypeDeMatriculation = typeDeMatriculation;
      widget.typeChanged(typeDeMatriculation.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(3),
        // margin: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactTitre(text: 'VOTRE IMMATRICULATION'),
                //Input Immatriculation
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(3),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      // Image.network(
                      //     "https://stock.wikimini.org/w/images/9/9b/Drapeau-Maroc.png"),
                      // Image.asset('assets/image/maroc.jpg'),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            color: Colors.transparent,
                            width: 85,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    widget.val1Changed(-1);
                                  } else {
                                    widget.val1Changed(int.parse(value));
                                  }
                                });
                              },
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              decoration: new InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue[900], width: 1.0),
                                ),
                                // hintText: 'Mobile Number',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 0, left: 0),
                            child: VerticalDivider(
                              width: 40,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton(
                              value: _selectedTypeDeMatriculation,
                              items: _dropdownMenuItem,
                              onChanged: onChangDropDownItem),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: VerticalDivider(
                              width: 40,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 30,
                            color: Colors.transparent,
                            width: 50,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    widget.val2Changed(-1);
                                  } else {
                                    widget.val2Changed(int.parse(value));
                                  }
                                  // widget.val2Changed(int.parse(value));
                                });
                              },
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              scrollPadding: EdgeInsets.all(0),
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue[900], width: 1.0),
                                ),
                                // hintText: 'Mobile Number',
                              ),
                            ),
                            // TextField(
                            //   keyboardType: TextInputType.number,
                            //   maxLength: 2,
                            //   decoration: InputDecoration(
                            //     counterText: "",
                            //   ),
                            // ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                //Input Numéro de Série
                Container(
                  margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                  // padding: EdgeInsets.all(3),
                  child: TextField(
                    // validator: (value) {
                    //   if (value.length < 17)
                    //     return '17 caractères';
                    //   else {
                    //     return null;
                    //   }
                    // },

                    onChanged: (value) {
                      setState(() {
                        widget.numSerieChanged(int.parse(value));
                      });
                    },
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    maxLength: 17,
                    scrollPadding: EdgeInsets.all(0),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Numéro de série ?',
                      // counterText: "",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[900], width: 1.0),
                      ),
                      helperText:
                          'Vérifier votre carte grise (Non obligatoire)',
                      // hintText: 'Mobile Number',
                    ),
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

class Page2 extends StatefulWidget {
  final nomChanged;
  final prenomChanged;
  final emailChanged;
  final telephoneChanged;

  Page2({
    Key key,
    this.emailChanged,
    this.nomChanged,
    this.prenomChanged,
    this.telephoneChanged,
  }) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactTitre(text: 'VOS INFORMATIONS'),
                DropdownButton(
                  items: null,
                  onChanged: null,
                ),

                //text field NOm
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.nomChanged(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Votre Nom ? ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //text field prenom
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        widget.prenomChanged(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Votre Prenom ? ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //text field email
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        widget.emailChanged(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Votre Email ? ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        widget.telephoneChanged(value);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Votre TéléPhone ? ',
                      border: OutlineInputBorder(),
                    ),
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

class Page4 extends StatefulWidget {
  final interventionChanged;

  Page4({this.interventionChanged});

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      ContactTitre(text: "CHOISISSEZ LE TYPE D'INTERVENTION"),
                ),
                DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("-- Faite votre choix --"),
                        value: -1,
                      ),
                      DropdownMenuItem(
                        child: Text("Travaux Rapides"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Coarrosserie"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Mécanique"),
                        value: 3,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        widget.interventionChanged(_value);
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ContactTitre(text: 'SUCCURSALE'),
                ),
                Text('Ville'),
                DropdownButton(
                  onChanged: (value) {},
                  value: -1,
                  items: [
                    DropdownMenuItem(
                      child: Text("-- Faite votre choix --"),
                      value: -1,
                    ),
                    DropdownMenuItem(
                      child: Text("CasaBlanca"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Rabat"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Salé"),
                      value: 3,
                    ),
                  ],
                ),
                Text('Succursales'),
                IgnorePointer(
                  ignoring: true,
                  child: DropdownButton(
                    onChanged: (value) {},
                    value: 1,
                    items: [
                      DropdownMenuItem(
                        child: Text("CasaBlanca"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Rabat"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Salé"),
                        value: 3,
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

class Page6 extends StatefulWidget {
  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ContactTitre(text: "CHOISISSEZ VOTRE DATE RDV"),
                ),
                FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2022),
                    ).then((value) => null);
                  },
                  child: Text(
                    "Date",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: -1,
                      child: Text('-- Faite votre choix --'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('8:00'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('9:00'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('10:0'),
                    ),
                    DropdownMenuItem(
                      value: 5,
                      child: Text('11:00'),
                    ),
                    DropdownMenuItem(
                      value: 6,
                      child: Text('12:00'),
                    ),
                    DropdownMenuItem(
                      value: 7,
                      child: Text('13:00'),
                    ),
                    DropdownMenuItem(
                      value: 8,
                      child: Text('14:00'),
                    ),
                    DropdownMenuItem(
                      value: 9,
                      child: Text('15:00'),
                    ),
                  ],
                  value: -1,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
