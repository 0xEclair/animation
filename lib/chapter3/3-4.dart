import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {

  String _current_animation = "day_idle";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(_current_animation == "day_idle"){
            _current_animation = "switch_night";
          }
          else if(_current_animation == "night_idle"){
            _current_animation = "switch_day";
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        color: _current_animation == "day_idle"?
                  Colors.white:
                  Colors.black,
        child: FlareActor(
//      "assets/flare/Success Check.flr",
//      animation: "Untitled",
          "assets/flare/switch_daytime.flr",
          animation: _current_animation,
          callback: (String animation_name){
            setState(() {
              if(_current_animation == "switch_day"){
                _current_animation = "day_idle";
              }
              else if(_current_animation == "switch_night"){
                _current_animation = "night_idle";
              }
            });
          },
        ),
      ),
    );
  }
}
