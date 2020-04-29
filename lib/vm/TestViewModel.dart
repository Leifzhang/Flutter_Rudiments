import 'package:flutter/material.dart';
import 'package:flutterapp/api/WanAndroidRepository.dart';
import 'package:flutterapp/entity/banner.dart';

class TextViewModel extends ChangeNotifier {
  int _count;

  List<BannerEntity> _banners;

  List<BannerEntity> get banners => _banners;

  TextViewModel(this._count) {}

  void loadData() async {
    Future banner = WanAndroidRepository.fetchBanners();
    var data = await banner;
    if (_banners == null) {
      _banners = new List();
    }
    _banners.addAll(data);
    add();
    notifyListeners();
  }

  int getCount() {
    if (_banners == null) {
      return 0;
    } else {
      return _banners.length;
    }
  }

  void add() {
    _count++;
  }

  get count => _count; //3
}
