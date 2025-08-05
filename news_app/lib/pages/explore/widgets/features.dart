import 'package:news_app/core/constants/apikey.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/core/networking/endpoints.dart';
import 'dart:developer';

import 'package:news_app/pages/explore/widgets/models.dart';

class Features {
  static Future<Models?> getTopHeadlines() async {
    try {
      final response = await DioHelper.getrequest(
        endpoints: EndPoints.topHeadlines,
        data: {"country": "us", "apiKey": Apikey.newsApiKey, "language": "en"},
      );

      if (response.statusCode == 200) {
        Models model = Models.fromJson(response.data);
        log(model.totalResults.toString());
        return model;
      }
    } catch (e) {
      log('Error fetching headlines: $e');
    }
    return null;
  }
}
