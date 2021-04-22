import 'package:flutter/material.dart';

Center get demo => (){
  return Center(
    child: AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 300,
      width: 300,
      color: Colors.orange,
      child: AnimatedSwitcher(
          duration: Duration(seconds: 2),
          transitionBuilder: (child,animation){
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          //child: Center(child: CircularProgressIndicator()),
          child: Text("zxc",key: UniqueKey() ,style: TextStyle(fontSize: 40))
      ),
    ),
  );
}();