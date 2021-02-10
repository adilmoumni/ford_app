import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/CategoryTitle.dart';
import 'package:ford_mobil/UI/Widget/ItemList.dart';
import 'package:ford_mobil/services/VehicleService.dart';
import 'package:ford_mobil/services/modal.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future<List<CategoryTitle>> future;
  List<CategoryTitle> messages;
  String query = '';
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    // future = CategoryTitle.getList();
    messages = await future;
  }

  Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: VehicleService.brows(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (context, i) {
                    print(snapshot.data.length);

                    if (i == 0) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  query = val;
                                });
                              },
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Rechercher...',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                CategoryTitle(
                                  title: "Tous",
                                  active: true,
                                ),
                                CategoryTitle(title: "SUV & Crossover"),
                                CategoryTitle(title: "Hybride et électrique"),
                                CategoryTitle(
                                    title: "Familiales et Ludospaces"),
                                CategoryTitle(title: "Performance"),
                                CategoryTitle(title: "Véhicules Utilitaires"),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return ItemList(
                      assets: snapshot.data[i - 1].photo,
                      model: snapshot.data[i - 1].nom,
                      prix: '40 000€',
                      widthMoto: 270,
                      right: 110,
                      idModel: snapshot.data[i - 1].idModele,
                    );
                  }),
            );
          } else if (snapshot.hasError) {
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Center(child: CircularProgressIndicator())),
            );
          } else {
            return Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Icon(Icons.error_outline),
              ),
            ));
          }
        },
      ),
    );
  }
}
