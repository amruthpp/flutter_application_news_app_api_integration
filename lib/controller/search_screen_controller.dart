import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/model/news_res_model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {


    NewsResmodel? newsResmodel;
    List<Article> newsArticles = [];
  bool isLoading = false;

  Future<void> onSearch(String keyWord) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/everything?q=keyword&apiKey=0bd9cc1f74eb4aa68c48fc83e3d56cc0");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        newsResmodel = newsResmodelFromJson(res.body);
        if(newsResmodel != null) {
          newsArticles = newsResmodel!.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }


   


 


} 