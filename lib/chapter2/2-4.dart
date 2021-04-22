import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SlideTransition(
          position: Tween(begin: Offset.zero, end: Offset(0.1, 0))
              .chain(CurveTween(curve: Interval(0.0, 0.2)))
              .animate(_controller),
          child: Container(height: 75, width: 300, color: Colors.blue[100]),
        ),
        SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.1, 0))
                .chain(CurveTween(curve: Interval(0.2, 0.4)))
                .animate(_controller),
            child: Container(height: 75, width: 300, color: Colors.blue[300])),
        SlideTransition(
            position: Tween(begin: Offset.zero, end: Offset(0.1, 0))
                .chain(CurveTween(curve: Curves.bounceInOut))
                .chain(CurveTween(curve: Interval(0.4, 0.6)))
                .animate(_controller),
            child: Container(height: 75, width: 300, color: Colors.blue[900])),
        FadeTransition(
            opacity: Tween(begin: 0.5, end: 1.0)
                .chain(CurveTween(curve: Interval(0.6, 0.8)))
                .animate(_controller),
            child: Container(height: 75, width: 300, color: Colors.blue[500])),
        Container(height: 75, width: 300, color: Colors.blue[700]),
      ],
    );
  }
}
