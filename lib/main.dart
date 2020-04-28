import 'package:flutter/material.dart';
import 'package:flutterapp/vm/TestViewModel.dart';
import 'package:flutterapp/widget/HomepageWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            FlatButton(child: Text("下一页")),
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
