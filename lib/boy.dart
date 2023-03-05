import 'dart:math';

import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final int boySpriteCount;
  final String boyDirection;

  const MyBoy({Key? key,required this.boySpriteCount,required this.boyDirection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(boyDirection == 'left' ){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        width: 100,
        child: Image.asset('lib/new_images/walkboy' + boySpriteCount.toString() + '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 100,
          child: Image.asset('lib/new_images/walkboy' + boySpriteCount.toString() + '.png'),
        ),
      );
    }
  }
}
