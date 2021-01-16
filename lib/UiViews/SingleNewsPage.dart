import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:daily_news/utils/Constains.dart';
import 'package:daily_news/widgets/SingleNewsHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SingleNewsPage extends StatelessWidget {
  Articles news;
  SingleNewsPage(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Container(
        height: 00.0,
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 1),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a comment...",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(186, 186, 186, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 65.0,
                height: 65.0,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Transform.rotate(
                  angle: -0.8,
                  child: Icon(
                    FlutterIcons.send_mdi,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleNewsHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(news.title!=null?news.title:
                        "Jacob Blake: Trump visits Kenosha to back police...",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        news.content!=null?news.content:
                        "US President Donald Trump has visited Kenosha, Wisconsin, to back law enforcement after the police shooting of a black man sparked civil strife.",
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 210.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: news.urlToImage!=null?NetworkImage(this.news.urlToImage)
                              :AssetImage(
                              "assets/images/trump.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(news.author!=null?news.author:
                        "Mr zahidul Isalm",
                        style: TextStyle(
                          color: Color.fromRGBO(148, 148, 156, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(news.publishedAt!=null?"Published "+news.publishedAt.substring(0,10):
                        "Published Aug. 28, 2020",
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      Text(news.publishedAt!=null?"Updated "+news.publishedAt.substring(11,16):
                        "Updated Aug. 29, 2020, 10:48 am ET",
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(news.description!=null?news.description:
                        """
The president visited areas damaged in the protests, including a burnt-out furniture store and camera shop destroyed in the upheaval.

"These are not acts of peaceful protest, but really domestic terror," he later told local business leaders at a round table meeting in a high school gym.

Mr Trump defended the actions of US police and accused the media of focusing only on "bad" incidents involving officers.

"You have people that choke," he said. "They are under tremendous pressure. And they may be there for 15 years and have a spotless record and all of a sudden they're faced with a decision. They have a quarter of a second to make a decision. And if they make a wrong decision, one way or the other, they're either dead or they're in big trouble.
                        """,
                        style: TextStyle(
                          height: 1.7,
                          color: Color.fromRGBO(139, 144, 165, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
