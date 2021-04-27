import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  //final StreamController _controller = StreamController();
  final StreamController _controller = StreamController.broadcast();

  @override
  void initState() {
    _controller.stream.listen((e) => print(e), onError: (err) => print(err));
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Stream<DateTime> _time() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use StreamBuilder instead of _stream.listen(callback)
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _controller.sink.add(10);
          },
        ),
        StreamBuilder(
          stream: _time()
              .where((data) => data is DateTime)
              .map((data) => data)
              .distinct(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            String message;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                message = "NONE: no stream.data here";
                break;
              case ConnectionState.waiting:
                message = "WAITING: waiting for stream.data";
                break;
              case ConnectionState.active:
                message = "ACTIVE: ok: ${snapshot.data}";
                break;
              case ConnectionState.done:
                message = "DONE: stream is closed";
                break;
            }
            return Text(
              message,
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ],
    );
  }
}
