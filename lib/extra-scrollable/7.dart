import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  @override
  _ListWheelScrollViewDemoState createState() =>
      _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  static String _showString = "ListWheelScrollViewDemo";

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: ListWheelScrollView(
        children: List.generate(
            _showString.length,
            (index) => RotatedBox(
              quarterTurns: 1,
              child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(_showString[index],style: TextStyle(fontSize: 72),),
                  ),
            )),
        itemExtent: 72,
        //offAxisFraction: 0.0,
        //diameterRatio: 1.0,
        magnification: 1.0,
        useMagnifier: true,
        physics: FixedExtentScrollPhysics(),
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      children: <Widget>[
        Container(color: Colors.blue,),
        Container(color: Colors.orange,)
      ],
      scrollDirection: Axis.vertical,
      onPageChanged: (index) => print("$index"),
    );
  }
}

class ReorderableListViewDemo extends StatefulWidget {
  @override
  _ReorderableListViewDemoState createState() => _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: List.generate(10,(index) => Text("index is $index",key: UniqueKey(),)),
      onReorder: (int oldIndex, int newIndex) => print("moved from $oldIndex to $newIndex"),
      header: Text("ReorderableListViewDemo",style: TextStyle(fontSize: 25),),
    );
  }
}

class SingleChildScrollViewDemo extends StatefulWidget {
  @override
  _SingleChildScrollViewDemoState createState() => _SingleChildScrollViewDemoState();
}

class _SingleChildScrollViewDemoState extends State<SingleChildScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FlutterLogo(size: 100,),
          FlutterLogo(size: 200,),
          FlutterLogo(size: 300,),
          FlutterLogo(size: 400,),
        ],
      ),
    );
  }
}
