
import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:daily_news/UiViews/SingleNewsPage.dart';
import 'package:daily_news/utils/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleNewsCard extends StatelessWidget {
  Articles articles;
  SingleNewsCard( this.articles);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.nextScreen(context, SingleNewsPage(articles));
      },
      child: Column(
        children: [
          Container(
            height: 210.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: articles.urlToImage!=null? NetworkImage(articles.urlToImage):
                AssetImage("assets/images/trump.png",),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            this.articles.title!=null?this.articles.title:
            "Jacob Blake: Trump visits Kenosha to back police...",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                this.articles.publishedAt!=null?this.articles.publishedAt.substring(11,16):
                "20 min ago",
                style: TextStyle(
                  color: Color.fromRGBO(148, 148, 156, 1),
                  fontSize: 14.0,
                ),
              ),
              SizedBox(width: 10.0,),
              Text(
                " | ",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                "Politics",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(251, 89, 84, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}