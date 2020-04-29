import 'package:flutterapp/entity/banner.dart';

import 'Wan_Android_Api.dart';

class WanAndroidRepository {
  static Future<List<BannerEntity>> fetchBanners() async {
    var response = await http.get('banner/json');
    return response.data
        .map<BannerEntity>((item) => BannerEntity.fromJsonMap(item))
        .toList();
  }
}
