
import 'package:daily_news/utils/Constains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function changeIndex;
  final int currentIndex;
  BottomBar({this.changeIndex, this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: this.currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color.fromRGBO(202, 205, 219, 1),
      ),
      selectedIconTheme: IconThemeData(
        color: Constants.primaryColor,
      ),
      onTap: (index) {
        changeIndex(index);
      },
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
           Icons.api_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.account_box_rounded,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.ad_units_rounded,
          ),
        ),
      ],
    );
  }
}