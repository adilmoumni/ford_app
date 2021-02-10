import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Screen.dart';

// ignore: must_be_immutable
class Salamon extends KFDrawerContent {
  @override
  _SalamonState createState() => _SalamonState();
}

class _SalamonState extends State<Salamon> {
  var _selectedTab = _SelectedTab.home;
  int _selectedIndex = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Screen(),
        Center(
          child: Text('Index $_selectedIndex'),
        ),
        Center(
          child: Text('Index $_selectedIndex'),
        ),
        Center(
          child: Text('Index $_selectedIndex'),
        ),
        Center(
          child: Text('Index $_selectedIndex'),
        ),
      ].elementAt(_selectedIndex),
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.bubble_chart_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.blue),
          ),
        ),
      ),
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: widget.onMenuPressed,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: widget.onMenuPressed,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Ford ",
          style: TextStyle(
              color: Colors.blue[900], fontFamily: 'FordFont', fontSize: 40),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Plus
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text("Plus"),
            selectedColor: Colors.yellow,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, likes, search, plus, profile }
