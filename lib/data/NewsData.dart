import 'package:flutter/foundation.dart';
import 'package:tracker/api/news/NewsApi.dart';
import 'package:tracker/models/NewsResponse.dart';

var prevMonth = DateTime(date.year, date.month - 1, date.day).toString();

String url1 =
    'https://newsapi.org/v2/everything?q=coronavirus&from=$prevMonth&sortBy=publishedAt&apiKey=0828df72398744e5a1fe8f75838a4c76';

String url2 =
    'https://newsapi.org/v2/everything?q=covid-19&from=$prevMonth&sortBy=publishedAt&apiKey=0828df72398744e5a1fe8f75838a4c76';

class NewsData extends ChangeNotifier {
  NewsResponse newsResponse;
  List<Articles> _articles;

  Future<List<Articles>> getNews() async {
    List<Articles> _articles1;
    List<Articles> _articles2;
    newsResponse = await NewsApi().getNews(url1);
    _articles1 = newsResponse.articles;
    newsResponse = await NewsApi().getNews(url2);
    _articles2 = newsResponse.articles;
    _articles1.addAll(_articles2);
    _articles = _articles1.toSet().toList();
    return _articles;
  }
}
