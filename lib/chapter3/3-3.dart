import 'dart:math';

import 'package:flutter/material.dart';

class PainterDemo extends CustomPainter {
  final List<SnowFlake> _snow_flakes;

  PainterDemo(this._snow_flakes);

  // size -> canvas size
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final Paint paint = Paint()..color=Colors.white;
    canvas.drawCircle(Offset(size.width/2,size.height/2),60,paint);
    canvas.drawOval(Rect.fromCenter(center: size.center(Offset(0,180)),width: 200,height: 250),paint);
    _snow_flakes.forEach((snow_flake){
      canvas.drawCircle(Offset(snow_flake._x,snow_flake._y),snow_flake._radius,paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class demo extends StatefulWidget {
  final _state = _demoState();

  @override
  _demoState createState() => _state;

  void forward() {
    _state.forward();
  }
}

class _demoState extends State<demo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<SnowFlake> _snow_flakes = List.generate(100, (index) => SnowFlake());

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();
    super.initState();
  }

  void forward () {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue,Colors.lightBlue,Colors.white],
                // 0.0 - 0.2 -> blue
                // 0.2 - 0.7 -> blue and lightBlue
                // 0.7 - 0.8 -> lightBlue and white
                // 0.8 - 1.0 -> white
                stops: [0.2,0.7,0.8]
            )
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_,__){
            _snow_flakes.forEach((SnowFlake snow_flake){
              snow_flake._fall();
            });
            return CustomPaint(
              painter: PainterDemo(_snow_flakes),
            );
          },
        )
    );
  }
}

class SnowFlake {
  double _x = Random().nextDouble() * 400;
  double _y = Random().nextDouble() * 600;
  double _radius =  Random().nextDouble() * 2 + 2;
  double _velocity = Random().nextDouble() * 4 + 2;

  void _fall() {
    _y += _velocity;
    if ( _y > 800) {
      _y = 0;
      _x = Random().nextDouble() * 400;
      _radius =  Random().nextDouble() * 2 + 2;
      _velocity = Random().nextDouble() * 4 + 2;
    }
  }
//  double get x => _x;
//  double get y => _y;
//  double get radius => _radius;
}
