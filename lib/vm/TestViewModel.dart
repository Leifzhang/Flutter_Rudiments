import 'package:flutter/material.dart';

class TextViewModel extends ChangeNotifier {
  int _count;

  TextViewModel(this._count) {
    Future.delayed(Duration(seconds: 5), () {
      add();
    });
  }

  void add() {
    _count++;
    notifyListeners(); //2
  }

  get count => _count; //3
}
