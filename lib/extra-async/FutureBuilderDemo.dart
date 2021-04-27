import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  Future<List<dynamic>> getData() async {
    final res = await http.get("https://api.github.com/events");
    if(res.statusCode == 200) {
      final List json = jsonDecode(res.body);
      return json;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
        if(snapshot.hasData){
          return Text("${snapshot.data[0]["id"]}",style: TextStyle(fontSize: 50),);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
