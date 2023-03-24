import 'package:flutter/material.dart';
import 'package:projectofnewsleader/api_servicedart.dart';
import 'package:projectofnewsleader/article_model_source.dart';
import 'package:projectofnewsleader/news1.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Newslead()),

  );
}

class Newslead extends StatefulWidget {
  const Newslead({Key? key}) : super(key: key);

  @override
  State<Newslead> createState() => _NewsleadState();
}

class _NewsleadState extends State<Newslead> {
  List txts=["Delhi-Bound IndiGo flight from Kochi diverted to Bhopal due to medical emergency",
  "Kannur panchayat member threatens MGNREGS workers to partake in CPM rally",
  "Minister Bindu lauds Bhavana’s comeback; calls her determination exemplary",
  "Tournaments can give Indian football the sheen",
  "'RRR' bags 4 big honours at Hollywood Critics Association Awards"];
  List images=['images/indigo.jpg','images/cpmflag.jpg','images/BHAVANA.png','images/toornament.jpg','images/rrr.jpeg'];
  Apiservice objectofdata=Apiservice();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333334),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.brown,
        title: Text("NEWS READER APP",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: "BebasNeue",

        ),),
      ),
      body: FutureBuilder<List<Article>>(
          future: objectofdata.getArticle(),
          builder: (BuildContext context,AsyncSnapshot<List<Article>>snapshot ){
            if(snapshot.hasData){
              return
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context,index){
                      var articles1=snapshot.data![index];
                      return
                        InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Newslead2(article:articles1)));
                        },
                          child: Container(
                          child:  Column(
                            children: [
                              snapshot.data![index].toString()!=null?
                              Image.network(snapshot.data![index].urlToImage.toString(),fit: BoxFit.cover,):


                              Text(snapshot.data![index].title.toString(),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                                color: Colors.white,
                              ),),

                            ],
                          ),

                      ),
                        );

                    }
                );


            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        ),
      );





  }
}
