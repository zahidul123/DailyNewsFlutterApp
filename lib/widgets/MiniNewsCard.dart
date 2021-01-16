import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:daily_news/UiViews/SingleNewsPage.dart';
import 'package:daily_news/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiniNewsCard extends StatelessWidget {
  final Articles news;
  MiniNewsCard({this.news});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.nextScreen(context, SingleNewsPage(news));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(139, 144, 165, 1),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Expanded(
          child: Row(
            children: [
              Container(
                height: 125.0,
                width: 125.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 1),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(this.news.urlToImage)
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      this.news.title!=null?this.news.title:"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      this.news.content!=null?this.news.content:"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromRGBO(139, 144, 165, 1),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Row(children: [
                      Text(
                        this.news.publishedAt!=null?this.news.publishedAt.substring(11,16):"",
                        style: TextStyle(color: Color.fromRGBO(148, 148, 156, 1)),
                      ),
                      SizedBox(width: 5.0,),
                      Flexible(child: Text("Daily news",style: TextStyle(color: Color.fromRGBO(148, 148, 156, 1)),))
                    ],)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}