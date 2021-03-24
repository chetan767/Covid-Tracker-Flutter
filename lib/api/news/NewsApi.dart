import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tracker/models/NewsResponse.dart';

var date = DateTime.now();
String apiKey = '0828df72398744e5a1fe8f75838a4c76';

class NewsApi {
  Future<NewsResponse> getNews(String url) async {
    NewsResponse result;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonRes = response.body;
        result = NewsResponse.fromJson(json.decode(jsonRes));
      }
    } catch (e) {
      return null;
    }
    return result;
  }
}
