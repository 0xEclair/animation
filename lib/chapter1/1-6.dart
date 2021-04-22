import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final double end;

  AnimatedCounter({this.end});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 250),
      tween: Tween(end: end),
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
    );
  }
}