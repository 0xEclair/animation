import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final List<GitEvent> _events = [];

  @override
  void initState() {
    super.initState();

    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _refresh();
        },
        child: Scrollbar(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: _events.map<Widget>((GitEvent ge){
                  return Dismissible(
                    key: ValueKey(ge.id),
                    onDismissed: (direction){
                      setState(() {
                        _events.removeWhere((GitEvent e) => e.id == ge.id);
                      });
                    },
                    confirmDismiss: (_) async {
                      return showDialog(
                        context: context,
                        builder: (_){
                          return AlertDialog(
                            title: Text("1"),
                            content: Text("2"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("cancel"),
                                onPressed: () => Navigator.of(context).pop(false),
                              ),
                              FlatButton(
                                child: Text("confirm"),
                                onPressed: () => Navigator.of(context).pop(true),
                              )
                            ],
                          );
                        }
                      );
                    },
                    child: ListTile(
                      leading: Image.network(ge.avatarUrl),
                      title: Text(ge.userName),
                      subtitle: Text(ge.repoName),
                    ),
                  );
                }
            ).toList(),
          ),
        ),
      ),
    );
  }

  _refresh () async {
    final res = await http.get("https://api.github.com/events");
    if(res.statusCode == 200) {
      final List json = jsonDecode(res.body);
      setState(() {
        _events.clear();
        _events.addAll(json.map((ge) => GitEvent(ge)));
      });
    }
  }
}

class GitEvent {
  String id;
  String userName;
  String avatarUrl;
  String repoName;

  GitEvent(json){
    id = json["id"];
    userName = json["actor"]["login"];
    avatarUrl = json["actor"]["avatar_url"];
    repoName = json["repo"]["name"];
  }

  @override
  String toString() {
    return 'GitEvent{id: $id, userName: $userName, avatarUrl: $avatarUrl, repoName: $repoName}';
  }


}