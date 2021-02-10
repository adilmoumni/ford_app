import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ford_mobil/Drawer/stats.dart';

class Modal {
  bootomInfoPoinVetn(
    BuildContext context,
    int id, {
    String city = '',
    String adrres = '',
    String phoneNumber = '',
    String fax = '',
    String mail = '',
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Center(child: Text(adrres)),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(phoneNumber),
                      IconButton(
                        icon: Icon(Icons.call_outlined),
                        onPressed: () {
                          customLaunch('tel:' + phoneNumber);
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(fax),
                      IconButton(
                        icon: Icon(Icons.contact_phone_outlined),
                        onPressed: () {
                          customLaunch('tel:' + fax);
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(mail),
                      IconButton(
                        icon: Icon(Icons.mail_rounded),
                        onPressed: () {
                          customLaunch('mailto:' + mail);
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Center(
                  child: Text(
                    "Sélectionnez votre véhicule",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Divider(thickness: 1),
              _createTile(context,
                  title: 'Ford Mustang', assetsImg: "assets/image/mustang.png"),
              _createTile(context,
                  title: 'Ford Mustang', assetsImg: "assets/image/mustang.png"),
              _createTile(context,
                  title: 'Ford Fiesta', assetsImg: "assets/image/fiesta.png"),
            ],
          ),
        );
      },
    );
  }
}

ListTile _createTile(
  BuildContext context, {
  String title,
  String assetsImg,
}) {
  return ListTile(
    leading: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 64,
        maxHeight: 64,
      ),
      child: Image.asset(assetsImg, fit: BoxFit.cover),
    ),
    title: Text(title),
    onTap: () {
      Navigator.pop(context);
    },
  );
}

// Container(
//           child: SingleChildScrollView(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('item :$index'),
//                 );
//               },
//             ),
//           ),
//         );
