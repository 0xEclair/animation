import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(2, (index) {
        final String path = "assets/avatar/${index}_a.jpg";
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen(path);
            }));
          },
          child: Hero(
            tag: path,
            child: Image.asset(path),
          ),
        );
      }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String path;

  const DetailScreen(this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: path,
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(path,fit: BoxFit.fill,),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, right: 10, bottom: 10),
                  child: Text(
                    "Lorem ipsum dolor sit amet.",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
