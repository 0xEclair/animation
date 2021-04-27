import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async  {
        //return Future.delayed(Duration(seconds: 2));
        await Future.delayed(Duration(seconds: 5));
      },
      color: Colors.white,
      backgroundColor: Colors.black,
      child: CupertinoScrollbar(
        controller: _controller,
        child: NotificationListener(
          onNotification: (ScrollNotification e){
            return false;
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 30,
            controller: _controller,
            itemBuilder: (_,index){
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                secondaryBackground: Container(
                  color: Colors.black,
                ),
                onDismissed: (d){
                  print(d);
                },
                child: Container(
                  color: Colors.blue[index%9 * 100],
                  height: 50,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
