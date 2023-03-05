import 'dart:math';

import 'package:flutter/material.dart';

class BlueSnail extends StatelessWidget {
  final int snailSpriteCount;
  final String snailDirection;
  const BlueSnail({Key? key,required this.snailDirection,required this.snailSpriteCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(snailDirection == 'left'){
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('lib/new_images/snale' + snailSpriteCount.toString() + '.png'),
      );
    }else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('lib/new_images/snale' + snailSpriteCount.toString() + '.png'),
        ),
      );
    }
  }
}
