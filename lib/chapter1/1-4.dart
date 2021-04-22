import 'package:flutter/material.dart';

TweenAnimationBuilder get demo => (){
  return TweenAnimationBuilder(
    duration: Duration(seconds: 1),
    // between 0-1
    tween: Tween(begin: Offset(-10.0,0),end: Offset(10.0,0)),
    builder: (context,value,child){
      return Container(
        height: 300,
        width: 300,
        color: Colors.blueAccent,
        child: Center(
            child: Transform.translate(
                offset: value,
                child: Text("hello,flutter.")
            )
        ),
      );
    },
  );
}();