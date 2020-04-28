import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/cupertino.dart';

import 'Api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.wanandroid.com/';
  }
}

/// App相关 API
class PgyerApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.queryParameters['_api_key'] = '00f25cece8e201753872c268b5832df9';
    options.queryParameters['appKey'] = '0f7026d9c95933c7d0553628605b6ea4';
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }

  @override
  onResponse(Response response) {
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      throw NotSuccessException.fromRespData(respData);
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => code == 0;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
