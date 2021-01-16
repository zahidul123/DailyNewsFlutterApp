import 'package:daily_news/ModelClasses/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';

class StaticData {
  static List<Category> categories = [
    Category(
      id: 1,
      title: "Most Popular",
      icon: Icon(
        FlutterIcons.trending_up_fea,
        color: Colors.black,
      ),
    ),
    Category(
      id: 2,
      title: "World",
      icon: Icon(
        FlutterIcons.globe_ent,
        color: Colors.black,
      ),
    ),
    Category(
      id: 3,
      title: "Science",
      icon: Icon(
        FlutterIcons.react_faw5d,
        color: Colors.black,
      ),
    ),
    Category(
      id: 4,
      title: "Politics",
      icon: SvgPicture.asset("assets/svg/politics.svg"),
    ),
    Category(
      id: 5,
      title: "Business",
      icon: Icon(FlutterIcons.handshake_o_faw,
        color: Colors.black,),

    ),
    Category(
      id: 6,
      title: "Sports",
      icon: Icon(FlutterIcons.soccer_ball_o_faw,
        color: Colors.black,),
    ),
    Category(
      id: 7,
      title: "Arts",
      icon: SvgPicture.asset("assets/svg/arts.svg"),
    ),
    Category(
      id: 8,
      title: "Health",
      icon: Icon(FlutterIcons.stethoscope_faw5s,
        color: Colors.black,),
    ),
    Category(
      id: 9,
      title: "Food",
      icon: SvgPicture.asset("assets/svg/food.svg"),
    ),
    Category(
      id: 10,
      title: "Technology",
      icon: SvgPicture.asset("assets/svg/technology.svg"),
    ),
  ];

}