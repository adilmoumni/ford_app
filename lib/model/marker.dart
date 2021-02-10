import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Markers {
  final String id;
  final String ville;
  final String address;
  final String phoneNumber;
  final String fax;
  final String mail;
  final String positionLat;
  final String positionLng;

  Markers(this.id, this.ville, this.address, this.phoneNumber, this.fax,
      this.mail, this.positionLat, this.positionLng);

  Markers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ville = json['ville'],
        address = json['address'],
        phoneNumber = json['phoneNumber'],
        fax = json['fax'],
        mail = json['mail'],
        positionLat = json['positionLat'],
        positionLng = json['positionLng'];

  static Future<List<Markers>> browser() async {
    String url = "http://10.100.18.157/api/fordapi/getData.php";
    http.Response response = await http.get(url);
    String content = response.body;
    // String content = await rootBundle.loadString('data/Markerss.json');
    List collection = json.decode(content);
    List<Markers> _markers =
        collection.map((json) => new Markers.fromJson(json)).toList();

    return _markers;
  }
}
