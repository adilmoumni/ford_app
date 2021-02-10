import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // int _selectedIndex = 0;
  var image = [
    "https://pictures.dealer.com/t/taylortaylorfordfd/1253/dac789b37e2279fff5e7940cdf5f2caex.jpg",
    "https://s1.cdn.autoevolution.com/images/models/FORD_F-150-2020_main.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ6PVm3W0VN9eGFouKMwMadwTPwNhq4QTh93w&usqp=CAU",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        backgroundColor: Colors.grey[300],
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
            color: Colors.blue[300],
          ),
          Icon(
            CupertinoIcons.car_detailed,
            size: 25,
            color: Colors.blue[300],
          ),
          Icon(
            CupertinoIcons.circle_filled,
            size: 25,
            color: Colors.blue[300],
          ),
          Icon(
            CupertinoIcons.location_solid,
            color: Colors.blue[300],
          ),
          Icon(
            CupertinoIcons.time_solid,
            size: 25,
            color: Colors.blue[300],
          ),
        ],
        onTap: (index) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          height: 300,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new Image.network(
                  image[index],
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                clipBehavior: Clip.antiAlias,
              );
            },
            itemCount: image.length,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Ford'),
        backgroundColor: Colors.black,
      ),

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Colors.grey[350],
      //       title: Image.network(
      //         "https://i.dlpng.com/static/png/6793587_preview.png",
      //         alignment: Alignment.centerRight,
      //         height: 80,
      //       ),
      //       actions: [
      //         Icon(Icons.menu_book_outlined),
      //         Text('Y'),
      //         Text('X'),
      //       ],
      //     ),

      //   ],
      // ),
      backgroundColor: Color(0xF2E6F1),
      drawer: Drawer(),
    );
  }
}
