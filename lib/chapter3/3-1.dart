import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> with SingleTickerProviderStateMixin {
  double _height = 300.0;

  @override
  void initState() {
    Ticker ticker = Ticker((_) => setState(() {
          _height--;
          if (_height <= 0) {
            _height = 300;
          }
        }))
      ..start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: 300,
      color: Colors.blue,
    );
  }
}
