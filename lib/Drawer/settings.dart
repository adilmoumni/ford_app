import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ford_mobil/model/marker.dart';
import 'package:ford_mobil/services/modal.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable

class Settings extends KFDrawerContent {
  Settings({
    Key key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(33.589886, -7.603869);

  final List<Marker> _allMarkers = [];

  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Future<List> getData() async {
    final res = await http.get("http://localhost/api/fordapi/getData.php");

    return json.decode(res.body);
  }

//  List listMarker =  Markers.browser();

  Future<List<Markers>> future;
  List<Markers> markers;

  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Markers.browser();
    markers = await future;
  }

  // void getlocation() async{
  // }
  Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Ford ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue[900], fontFamily: 'FordFont', fontSize: 40),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: widget.onMenuPressed,
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 6.00,
              ),
              mapType: _currentMapType,
              markers:
                  // Set.from(
                  //   [
                  //     for (var i = 0; i < markers.length; i++)
                  //       {
                  //         Marker(
                  //           onTap: () => modal.bootomInfoPoinVetn(context, 1,
                  //               city: markers[i].ville,
                  //               fax: markers[i].fax,
                  //               adrres: markers[i].address,
                  //               phoneNumber: markers[i].phoneNumber,
                  //               mail: markers[i].mail),
                  //           markerId: MarkerId(markers[i].id),
                  //           position: LatLng(33, 33),
                  //           infoWindow: InfoWindow(title: "Casa Blanca"),
                  //           icon: BitmapDescriptor.defaultMarkerWithHue(
                  //             BitmapDescriptor.hueRed,
                  //           ),
                  //         ),
                  //       },
                  //   ],
                  // ),

                  {
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(context, 1,
                      city: 'CasaBlanca',
                      fax: '+212 522 22 22 22',
                      adrres: 'casa rue .. ',
                      phoneNumber: '+212 622 22 22 22',
                      mail: 'Scama@gmail.com'),
                  markerId: MarkerId('marker1'),
                  position: LatLng(33.589886, -7.603869),
                  infoWindow: InfoWindow(title: "Casa Blanca"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'Dakhla',
                    fax: '+212 522 22 22 22',
                    adrres: 'Dakhla rue .. ',
                    mail: 'Dakhla@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker2'),
                  position: LatLng(23.70705, -15.926507),
                  infoWindow: InfoWindow(title: "Dakhla"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRose),
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'Agadir',
                    fax: '+212 522 22 22 22',
                    adrres: 'Agadir rue .. ',
                    mail: 'Agadir@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker3'),
                  position: LatLng(30.38856850831315, -9.5127763347587),
                  infoWindow: InfoWindow(title: "Agadir"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'AZROU',
                    fax: '+212 522 22 22 22',
                    adrres: 'AZROU rue .. ',
                    mail: 'AZROU@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker4'),
                  position: LatLng(29.764849697173688, -9.387610917971028),
                  infoWindow: InfoWindow(title: "AZROU"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'TAROUDANT',
                    fax: '+212 522 22 22 22',
                    adrres: 'TAROUDANT rue .. ',
                    mail: 'TAROUDANT@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker5'),
                  position: LatLng(30.500653525081077, -8.874427469695288),
                  infoWindow: InfoWindow(title: "TAROUDANT"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'CHICHAOUA',
                    fax: '+212 522 22 22 22',
                    adrres: 'CHICHAOUA rue .. ',
                    mail: 'CHICHAOUA@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker6'),
                  position: LatLng(31.54783333335908, -8.764740100002106),
                  infoWindow: InfoWindow(title: "CHICHAOUA"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'MARRAKECH',
                    fax: '+212 522 22 22 22',
                    adrres: 'MARRAKECH rue .. ',
                    mail: 'MARRAKECH@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker7'),
                  position: LatLng(31.730907633569124, -7.981671199822117),
                  infoWindow: InfoWindow(title: "MARRAKECH II"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'MARRAKECH',
                    fax: '+212 522 22 22 22',
                    adrres: 'MARRAKECH rue .. ',
                    mail: 'MARRAKECH@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker8'),
                  position: LatLng(31.63447521193728, -8.014113029167465),
                  infoWindow: InfoWindow(title: "MARRAKECH I"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'ATTAOUIA',
                    fax: '+212 522 22 22 22',
                    adrres: 'ATTAOUIA rue .. ',
                    mail: 'ATTAOUIA@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker9'),
                  position: LatLng(31.842382595637623, -7.3399271521265055),
                  infoWindow: InfoWindow(title: "ATTAOUIA"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'CHEMMAIA',
                    fax: '+212 522 22 22 22',
                    adrres: 'CHEMMAIA rue .. ',
                    mail: 'CHEMMAIA@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker10'),
                  position: LatLng(32.07654836850034, -8.60995498281008),
                  infoWindow: InfoWindow(title: "CHEMMAIA"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'SAFI',
                    fax: '+212 522 22 22 22',
                    adrres: 'SAFI rue .. ',
                    mail: 'SAFI@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker11'),
                  position: LatLng(32.301592644633104, -9.221351681826043),
                  infoWindow: InfoWindow(title: "SAFI"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'BÉNI MELLAL',
                    fax: '+212 522 22 22 22',
                    adrres: 'BÉNI MELLAL rue .. ',
                    mail: 'BÉNIMELLAL@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker12'),
                  position: LatLng(32.35796847317359, -6.333784948430245),
                  infoWindow: InfoWindow(title: "BÉNI MELLAL"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
                Marker(
                  onTap: () => modal.bootomInfoPoinVetn(
                    context,
                    1,
                    city: 'ERRACHIDIA',
                    fax: '+212 522 22 22 22',
                    adrres: 'ERRACHIDIA rue .. ',
                    mail: 'ERRACHIDIA@gmail.com',
                    phoneNumber: '+212 522 55 44 44',
                  ),
                  markerId: MarkerId('marker13'),
                  position: LatLng(30.38856850831315, -9.5127763347587),
                  infoWindow: InfoWindow(title: "ERRACHIDIA"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
                  flat: true,
                ),
              },
              onCameraMove: _onCameraMove,
            ),
            Align(),
          ],
        ),
      ),
    );
  }

// Marker marker3 = Marker(
//   markerId: MarkerId('marker3'),
//   position: LatLng(30.38856850831315, -9.5127763347587),
//   infoWindow: InfoWindow(title: "Agadir"),
//   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//   flat: true,
// );
}
