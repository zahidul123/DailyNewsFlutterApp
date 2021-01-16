import 'package:daily_news/UiViews/Notifications.dart';
import 'package:daily_news/utils/Constains.dart';
import 'package:daily_news/utils/Helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NuAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(25, 25, 26, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.white24,
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text("All News",
                  style: GoogleFonts.ptSans(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Helper.nextScreen(context, Notifications());
            },
            child: Icon(
              Icons.notifications,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
