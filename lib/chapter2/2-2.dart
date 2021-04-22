
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
        lowerBound: 0.0,
        upperBound: 1.0
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
    final fade = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        fade?FadeTransition(
          opacity: _controller,
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
          ),
        ):
        ScaleTransition(
          scale: _controller,
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
          ),
        ),
        FloatingActionButton(
          onPressed: (){
            _controller.repeat(reverse: true);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
      ],
    );
  }
}