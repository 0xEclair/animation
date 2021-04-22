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
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool b = false;

  @override
  Widget build(BuildContext context) {
//    Animation animation1 = Tween(begin: 0.0, end: 1.0)
//        .chain(CurveTween(curve: Interval(0.0, 0.2)))
//        .animate(_controller);
//
//    Animation animation3 = Tween(begin: 1.0, end: 0.0)
//        .chain(CurveTween(curve: Interval(0.4, 0.95)))
//        .animate(_controller);
//
//    stops: _controller.value <= 0.2?
//    [animation1.value,animation1.value+0.1]:
//    [animation3.value,animation3.value+0.1],

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FadeTransition(
          opacity: b == true ?
                    Tween(begin: 0.3,end: 1.0).chain(CurveTween(curve: Curves.slowMiddle)).animate(_controller):
                    Tween(begin: 1.0, end: 1.0).animate(_controller),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (contxt,child){
              return Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                  gradient: RadialGradient(
                      colors: [
                        Colors.blueAccent[400],
                        Colors.blueAccent[100],
                      ],
                      stops: b == true?
                              [1.0,1.0]:
                              [_controller.value,_controller.value + 0.1]
                  ),
                ),
              );
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () async {
            _controller.duration = Duration(seconds: 4);
            _controller.forward();
            await Future.delayed(Duration(seconds: 4));

            _controller.duration = Duration(milliseconds: 1750);
            setState(() {
              b= true;
              _controller.repeat(reverse: true);
            });
            await Future.delayed(Duration(seconds: 7));
            setState(() {
              b=false;
              _controller.stop();
            });
            _controller.duration = Duration(seconds: 8);
            _controller.reverse();
          },
        )
      ],
    );
  }
}
