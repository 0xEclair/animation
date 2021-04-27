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
            print(e);
            return false;
          },
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 200,
            controller: _controller,
            itemBuilder: (_,index){
              return Container(
                color: Colors.blue[index%9 * 100],
                height: 50,
              );
            },
          ),
        ),
      ),
    );
  }
}
