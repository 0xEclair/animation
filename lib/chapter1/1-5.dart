import 'package:flutter/material.dart';

Center get demo => (){
  return Center(
      child: Container(
        height: 120,
        width: 300,
        color: Colors.blueAccent,
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          tween: Tween(begin: 7.0,end: 8.0),
          builder: (context,value,child){
            final whole = value ~/ 1;
            final decimal = value - whole;
            return Stack(
              children: <Widget>[
                Positioned(
                    top: -100 * decimal,
                    child: Opacity(
                        opacity: 1-decimal,
                        child: Text("${whole+0}")
                    )
                ),
                Positioned(
                    top: 100 - 100 * decimal,
                    child: Opacity(
                        opacity: decimal,
                        child: Text("${whole+1}")
                    )
                ),
              ],
            );
          },
        ),
      )
  );
}();