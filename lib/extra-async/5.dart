import 'dart:async';

import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final StreamController _controller = StreamController();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyPad(_controller);
  }
}

class KeyPad extends StatelessWidget {
  final StreamController _controller;

  KeyPad(this._controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: StreamBuilder(
            stream: _controller.stream,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Text("You entered ${snapshot.data}",style: TextStyle(fontSize: 25),);
              }
              return Text("waiting your input",style: TextStyle(fontSize: 25),);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return FlatButton(
                onPressed: () {
                  _controller.add(index);
                },
                shape: RoundedRectangleBorder(),
                color: Colors.primaries[index][200],
                child: Text("$index", style: TextStyle(fontSize: 24),),
              );
            }),
            childAspectRatio: 2 / 1,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10),
            physics: NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }
}
