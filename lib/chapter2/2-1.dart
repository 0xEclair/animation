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
      duration: Duration(seconds: 3),
      vsync: this,
      lowerBound: 3.0,
      upperBound: 5.0
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotationTransition(
          turns: _controller,
          child: Icon(Icons.refresh,size: 100,),
        ),
        FloatingActionButton(
          onPressed: (){
            _controller.reset();
            _controller.forward();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}