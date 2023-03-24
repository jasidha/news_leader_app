import 'dart:ui';

import 'package:projectofnewsleader/sourcemodel_dart.dart';


class Article{
  Source ?source;
  String?title;
  String?discribtion;
  String?urlToImage;
  Article({this.source,this.title,this.discribtion,this.urlToImage});
factory Article.fromJson(Map<String,dynamic>json){
  return Article(
    source:Source.fromJson(json['source']),
    urlToImage: json['urlToImage'],
    title: json['title'],
    discribtion: json['description'],


  );
}

}