import 'dart:math';
import 'package:flutter/material.dart';
class MyTeddy extends StatelessWidget {
  final int teddySpriteCount;
  final String teddyDirection;
  MyTeddy({Key? key,required this.teddyDirection,required this.teddySpriteCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(teddyDirection == 'left'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset("lib/new_images/teddy" + teddySpriteCount.toString() + ".png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset("lib/new_images/teddy" + teddySpriteCount.toString() + ".png"),
        ),
      );
    }
  }
}
