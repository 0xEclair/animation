import 'package:flutter/material.dart';

Center get demo => () {
  return Center(
    child: AnimatedContainer(
      duration: Duration(milliseconds: 1500),
      height: 300,
      width: 300,
      child: Center(
        child: Text("helo",style: TextStyle(fontSize: 30)),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.red,Colors.white],
              stops: [0.2,0.2]
          ),
          // shadow spreads the value of spreadRadius.
          boxShadow: [BoxShadow(spreadRadius: 15, blurRadius: 30)],
          borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}();