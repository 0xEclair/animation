import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        constraints: BoxConstraints(
//          //minHeight: 60,maxHeight: 600,
//          minWidth: 30,maxWidth: 300
//        ),
        color: Colors.blue[200],

        child: Stack(
          // If the tag was clipBehavior, transformed widget will not be clipped.
          //overflow: Overflow.clip,
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              top: -100,
              left: 0,
              child: FlutterLogo(size: 50,),
            ),

            Container(width: 10,height: 40,color: Colors.yellow,),
            Text("0",style: TextStyle(fontSize: 80),),
            Text("Text",style: TextStyle(fontSize: 180),),
            Positioned(
              right: 0,

              top: 0,
              child: LayoutBuilder(
                builder: (context,constraints){
                  print(constraints);
                  return Container(
                    width: 24,
                    height: 24,
                    color: Colors.red,
                  );
                }
              ),
            ),
            Positioned(
              top: 0,
              height: 50,
              left: 0,
              width: 320,
              child: Transform.translate(
                offset: Offset(-50,9),
                child: FlatButton(
                  color: Colors.orangeAccent,
                  onPressed: (){},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
