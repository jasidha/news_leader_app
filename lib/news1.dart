import 'package:flutter/material.dart';
import 'package:projectofnewsleader/article_model_source.dart';
class Newslead2 extends StatelessWidget {

  @override
  final Article?article;
  Newslead2({this.article});
  Widget build(BuildContext context) {
    return Scaffold(

          backgroundColor: Color(0xff333334),
          body: SingleChildScrollView(
            child: Column(children: [

              Image.network(article!.urlToImage.toString(),fit: BoxFit.cover,
              ),

              Text(article!.discribtion.toString(),
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),

            ],),
          ),


        );
    }
}




