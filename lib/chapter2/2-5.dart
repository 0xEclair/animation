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
      duration: Duration(seconds: 2),
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Container(
            height: Tween(begin: 100.0, end: 300.0)
                .chain(CurveTween(curve: Curves.bounceInOut))
                .evaluate(_controller),
            width: 300,
            color: Colors.blueAccent,
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          "Hi",
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
