import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _demoState();
}

class _demoState extends State<demo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SlideTransition(
            position: Tween(begin: Offset(-0.2,0),end: Offset(0.2,0))
                .chain(CurveTween(curve: Interval(0.8,1.0)))
                //.chain(CurveTween(curve: Curves.elasticOut))
                .animate(_controller),
          //position: _controller.drive(Tween(begin: Offset(-0.1,0),end: Offset(0.1,0))),
          //scale: _controller.drive(Tween(begin: 1.0,end: 1.5)),
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blueAccent,
          ),
        ),
        FloatingActionButton(
          onPressed: (){
            _controller.reset();
            _controller.forward();
          },
          child: Icon(Icons.add),
        )
      ],
    );
  }
}