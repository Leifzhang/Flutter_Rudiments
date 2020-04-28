import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/vm/TestViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextViewModel>.value(
        // ignore: non_constant_identifier_names
        value: new TextViewModel(1),
        child: Consumer<TextViewModel>(
            builder: (context, model, widget) {
              return BodyWidget();
            },
            child: BodyWidget()));
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "${Provider.of<TextViewModel>(context, listen: false).count}"), //1
    );
  }
}
