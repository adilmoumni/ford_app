import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ford_mobil/model/Vehicle.dart';

class VehicleService {
  static String url = "http://10.100.20.191/appford/modele.php";

  static Future brows({String query = "", String idModel = ""}) async {
    try {
      final response = await http.get(url);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var myJson = json.decode(response.body);

        List collection = json.decode(response.body);

        var _vehicle = collection.map((_) => Vehicle.fromJson(_));

        if (query != "" || query.isNotEmpty) {
          return _vehicle
              .where((x) => x.nom.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
        if (idModel != "" || idModel.isNotEmpty) {
          // print(idModel + "  idmodel");
          return _vehicle.where((x) => x.idModele == idModel).toList();
        }

        return _vehicle.toList();
      }
    } catch (e) {}
  }
}
