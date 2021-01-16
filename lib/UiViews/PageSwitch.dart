import 'package:daily_news/widgets/AllAppbar.dart';
import 'package:daily_news/widgets/BottomBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CategorySelection.dart';
import 'Home.dart';

class PageSwitch extends StatefulWidget {
  @override
  _PageSwitchState createState() => _PageSwitchState();
}

class _PageSwitchState extends State<PageSwitch> {
  int currentIndex = 0;

  void changeCurrentIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        changeIndex: changeCurrentIndex,
        currentIndex: currentIndex,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            NuAppbar(),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: [
                  Home(),
                  CategorySelection(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ][currentIndex],
              ),
            )
          ],
        ),
      ),
    );
  }
}