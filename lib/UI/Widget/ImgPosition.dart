import 'package:flutter/material.dart';
import 'package:ford_mobil/Animation/FadeAnimatoin.dart';

class ImgPosition extends StatelessWidget {
  final double positionTop;
  final double valueFadeAnimation;

  ImgPosition({this.positionTop, this.valueFadeAnimation = 1});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: positionTop,
      left: 0,
      child: FadeAnimation(
        valueFadeAnimation,
        Container(
          width: width,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/one.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
