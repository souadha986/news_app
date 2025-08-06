import 'package:news_app/core/constants/apikey.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/core/networking/endpoints.dart';
import 'dart:developer';

import 'package:news_app/core/networking/models.dart';

class SearchFeatures {
  static Future<Models?> getTopsearchresults(String query) async {
    try {
      final response = await DioHelper.getrequest(
        endpoints: EndPoints.everything,
        data: {"q": query, "apiKey": Apikey.newsApiKey, "language": "en"},
      );

      if (response.statusCode == 200) {
        Models model = Models.fromJson(response.data);
        log(model.totalResults.toString());
        return model;
      }
    } catch (e) {
      log('Error fetching articles: $e');
    }
    return null;
  }
}
