import 'package:flutter/material.dart';
import 'package:ford_mobil/Drawer/detailpage.dart';

import 'package:ford_mobil/Screen.dart';
import 'package:ford_mobil/UI/Widget/AppBarFord.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {
  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          AppBarFord(onPressed: widget.onMenuPressed),
          Screen(),
        ],
      ),
    );
  }

  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imgPath: imgpath,
            ),
          ),
        );
      },
      child: Container(
        width: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value) {
    return Container(
      width: 110,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color:
              value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(
              image: AssetImage(imgpath),
              width: 45,
              height: 45,
              color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 15),
          Text(name,
              style: TextStyle(
                  fontSize: 13,
                  color: value == true ? Colors.black : Colors.white)),
          SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal) {
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
