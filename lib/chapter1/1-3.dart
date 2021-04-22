import 'package:flutter/material.dart';

Widget get demo => (){
  return AnimatedPadding(
    duration: Duration(seconds: 1),
    padding: const EdgeInsets.only(top:20),
    curve: Curves.bounceInOut,
    child: Container(
      height: 300,
      width: 300,
      color: Colors.blue,
    ),
  );
}();