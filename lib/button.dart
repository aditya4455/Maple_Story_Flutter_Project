import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final function;
  const MyButton({Key? key,required this.function,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: function,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: EdgeInsets.all(13),
            color: Colors.grey[700],
            child: Center(
              child: Text(text, style: TextStyle(color: Colors.white),),
            ),
          ),
        )
      ),
    );
  }
}
