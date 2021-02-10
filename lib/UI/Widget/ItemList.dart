import 'package:flutter/material.dart';
import 'package:ford_mobil/Drawer/detailpage.dart';
import 'package:ford_mobil/UI/Screen/DetailPage.dart';
import 'package:ford_mobil/main.dart';
import 'package:page_transition/page_transition.dart';

class ItemList extends StatelessWidget {
  final String assets;
  final String model;
  final String prix;
  final double widthMoto;
  final double right;
  final String idModel;

  ItemList(
      {this.assets,
      this.model,
      this.prix,
      this.widthMoto,
      this.right,
      this.idModel = ""});
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10.0),
      child: Container(
        width: wid,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 20),
          child: Container(
            height: 170,
            width: wid,
            color: Colors.grey[100],
            child: Stack(
              overflow: Overflow.visible,
              textDirection: TextDirection.rtl,
              children: [
                Positioned(
                  width: 200,
                  height: 170,
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          color: Colors.black,
                          shape: RoundedRectangleBorder(),
                          child: Text(
                            "En savoir plus",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  height: 100,
                  width: 200,
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            model,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          prix,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -50,
                  // width: widthMoto,
                  height: 170,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      assets,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FlatButton(
                    highlightColor: Colors.blue[200].withOpacity(0.2),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPapge(this.idModel),
                        ),
                      );
                    },
                    child: Text(''),
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

class ItemList2 extends StatelessWidget {
  const ItemList2({Key key, this.photo, this.nom}) : super(key: key);
  final String photo;
  final String nom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15.0),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
            spreadRadius: 0.5,
          )
        ], color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: Stack(overflow: Overflow.visible, children: [
          Positioned(
            left: 25,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  nom,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'The pleasure of being yourself',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: -20,
              right: 10,
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.blue[300]))),
          Positioned(
            bottom: -30,
            height: 130,
            child: Image.network(photo),
          ),
        ]),
      ),
    );
  }
}
