import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maple_story/snail.dart';
import 'package:maple_story/teddy.dart';

import 'boy.dart';
import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //BLUE SNAIL
  int snailSpriteCount = 1;
  double snailPosX = 0.5;
  String snailDirection = 'left';

  //TEDDY BEAR
  int teddySpriteCount = 1;
  double teddyPosX = 0;
  String teddyDirection = 'right';

  //BOY CHARACTER
  int boySpriteCount = 2;
  double boyPosX = -0.5;
  double boyPosY = 1;
  String boyDirection = 'right';
  int attackBoySpriteCount = 0;

  //Loading Screen
  var loadingScreenColor = Colors.pink[300];
  var loadingScreenTextColor = Colors.black;
  int loadingTime = 3;

  void playNow(){
    startGameTimer();
    moveSnail();
    moveTeddy();
  }

  void startGameTimer(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTime--;
      });
      if(loadingTime == 0){
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingTime = 3;
          loadingScreenTextColor = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }

  void attack(){
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        attackBoySpriteCount++;
      });
      if(attackBoySpriteCount == 5){
        if(boyDirection == 'right' && boyPosX + 0.2 > snailPosX){
          print('hit');
        }else{
          print('missed');
        }
        attackBoySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  void moveTeddy(){
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        teddySpriteCount++;
        if(teddySpriteCount == 21) {
          teddySpriteCount = 1;
        }
        if((teddyPosX - boyPosX).abs() > 0.2){
          if(boyDirection == 'right'){
            teddyPosX = boyPosX - 0.2;
          } else if(boyDirection == 'left'){
            teddyPosX = boyPosX + 0.2;
          }
        }
        if(teddyPosX - boyPosX > 0){
          teddyDirection = 'left';
        } else {
          teddyDirection = 'right';
        }
      });
    });
  }


  void moveSnail(){
    Timer.periodic(Duration(milliseconds: 150), (timer){
      setState(() {
        snailSpriteCount++;
        if(snailDirection == 'left'){
          snailPosX -= 0.01;
        }else{
          snailPosX += 0.01;
        }
        if(snailPosX < 0.3){
          snailDirection = 'right';
        }else if(snailPosX > 0.6){
          snailDirection = 'left';
        }
        if(snailSpriteCount == 5){
          snailSpriteCount = 1;
        }
      });
    });
  }

  void moveLeft(){
    setState(() {
      boyPosX -= 0.03;
      boySpriteCount++;
      boyDirection = 'left';
    });
  }

  void moveRight(){
    setState(() {
      boyPosX += 0.03;
      boySpriteCount++;
      boyDirection = 'right';
    });
  }

  void jump(){
    double time = 0;
    double height = 0;
    double initialHeight = boyPosY;
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;

      setState(() {
        if(initialHeight - height > 1){

          boyPosY = 1;
          timer.cancel();
          boySpriteCount = 1;
        }else{
          boyPosY = initialHeight - height;
          boySpriteCount = 2;
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue[300],
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment(snailPosX, 1),
                    child: BlueSnail(
                      snailDirection: snailDirection,
                      snailSpriteCount: snailSpriteCount,
                    ),
                  ),
                  Container(
                    alignment: Alignment(teddyPosX, 1),
                    child: MyTeddy(
                      teddyDirection: teddyDirection,
                      teddySpriteCount: teddySpriteCount,
                    ),
                  ),
                  Container(
                    alignment: Alignment(boyPosX, 1),
                    child: MyBoy(
                      boySpriteCount: boySpriteCount % 2 + 1,
                      boyDirection: boyDirection,
                    ),
                  ),
                  Container(
                    color: loadingScreenColor,
                    child: Center(
                      child: Text(loadingTime.toString(),
                        style: TextStyle(
                          color: loadingScreenTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('M A P L E S T O R Y',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyButton(
                        text: 'PLAY',
                        function: (){
                          playNow();
                        },
                      ),
                      MyButton(
                        text: 'ATTACK',
                        function: attack,
                      ),
                      MyButton(
                        text: '←',
                        function: (){
                          moveLeft();
                        },
                      ),
                      MyButton(
                        text: '↑',
                        function: (){
                          jump();
                        },
                      ),
                      MyButton(
                        text: '→',
                        function: (){
                          moveRight();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

