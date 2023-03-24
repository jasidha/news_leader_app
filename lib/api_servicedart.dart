import 'dart:convert';
import 'package:http/http.dart'as http;


import 'package:projectofnewsleader/article_model_source.dart';

class Apiservice{
  Future<List<Article>>getArticle()async{
    final url='https://newsapi.org/v2/everything?q=tesla&from=2023-01-27&sortBy=publishedAt&apiKey=f8c92b35265e42559daaa80d2ec576e9';
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var body=json.decode(response.body);
      List<Article>data=List<Article>.from(
        body['articles'].map((e)=>Article.fromJson(e)).toList());
      return data;
    }
    else{
     List<Article>data=[];
     return data;
    }
  }
}