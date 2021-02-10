import 'package:flutter/material.dart';
import 'package:ford_mobil/services/VehicleService.dart';

class DetailPapge extends StatefulWidget {
  final String idModel;
  DetailPapge(this.idModel, {Key key}) : super(key: key);

  @override
  _DetailPapgeState createState() => _DetailPapgeState();
}

class _DetailPapgeState extends State<DetailPapge> {
  // List<String> listOfUrl = [
  //   "assets/image/detail1.png",
  //   "assets/image/detail1.png",
  //   "assets/image/detail1.png",
  //   "assets/image/detail1.png",
  //   "assets/image/detail1.png",
  //   "assets/image/detail1.png",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        actions: [],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: FlatButton(
          child: Text('Commander'),
          onPressed: () {},
        ),
      ),

      body: FutureBuilder(
        future: VehicleService.brows(idModel: widget.idModel),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      color: Colors.white,
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height / 3,
                      child: Image.network(
                        snapshot.data[0].photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ford ' + snapshot.data[0].nom,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            'À partir de ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                                fontSize: 13),
                          ),
                          Text(
                            '69 500 €',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Divider(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sélectionner votre couleur',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 13)),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    width: 25,
                                    child: CircleAvatar()),
                                Container(
                                    width: 25,
                                    height: 20,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.black)),
                                Container(
                                    width: 25,
                                    height: 20,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.red)),
                              ],
                            )
                          ]),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: TextTile(text: 'Specification')),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          SpecificationCar(
                              icon: Icons.av_timer_sharp, text: '2.999 cc'),
                          SpecificationCar(
                              icon: Icons.account_tree_rounded,
                              text: 'Automatic'),
                          SpecificationCar(
                            icon: Icons.airline_seat_legroom_normal,
                            text: '      2      ',
                          ),
                          SpecificationCar(
                              icon: Icons.car_repair, text: 'Diesel'),
                          SpecificationCar(),
                          SpecificationCar(),
                        ]),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 10),
                        child: TextTile(text: 'Galery')),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GaleryCar(urlImage: "assets/image/detail1.png"),
                            GaleryCar(urlImage: "assets/image/detail2.png"),
                            GaleryCar(urlImage: "assets/image/detail3.png"),
                            GaleryCar(urlImage: "assets/image/detail4.png"),
                            GaleryCar(urlImage: "assets/image/detail5.png"),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 10),
                        child: TextTile(text: 'Description')),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 20, bottom: 10),
                      child: Text(
                        "La transmission intégrale à double moteur électrique élève le niveau de performance. Un moteur électrique à l'avant et à l'arrière améliore les performances et vous aide à faire face aux conditions d'",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Align(
                alignment: Alignment.centerLeft,
                child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

class SpecificationCar extends StatelessWidget {
  const SpecificationCar({Key key, this.icon, this.text = ''})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        // width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white38,
          boxShadow: [
            BoxShadow(color: Colors.grey[100], spreadRadius: 1),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

class GaleryCar extends StatelessWidget {
  const GaleryCar({Key key, this.urlImage = ''}) : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
          height: 150,
          width: 100,
        ),
      ),
    );
  }
}

class TextTile extends StatelessWidget {
  const TextTile({Key key, this.text = ''}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 15),
    );
  }
}
