import 'package:flutter/material.dart';

class FractionallySizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.5,
      child: LayoutBuilder(builder: (context, constraints) {
        print(constraints);
        return Container(
          color: Colors.blue,
          child: FlutterLogo(size: 200),
        );
      }),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,width: 400,
      color: Colors.red,
      //alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 60, maxHeight: 120, minWidth: 60, maxWidth: 120),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
            return Container(
              color: Colors.blue,
              child: FlutterLogo(size: 4000),
            );
          },
        ),
      ),
    );
  }
}
