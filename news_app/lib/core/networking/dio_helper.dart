import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/networking/endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          receiveDataWhenStatusError: true,
        ),
      );
    }
    dio!.interceptors.add(PrettyDioLogger());
  }

  static Future getrequest({
    required String endpoints,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.get(endpoints, queryParameters: data);
      return response;
    } catch (e) {
      log(Future.error(e).toString());
    }
  }
}
