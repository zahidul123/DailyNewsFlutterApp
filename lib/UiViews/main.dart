import 'package:daily_news/BlocData/ArticleDataRepository.dart';
import 'package:daily_news/BlocStated/Article_Bloc.dart';
import 'package:daily_news/utils/Constains.dart';
import 'package:daily_news/widgets/MiniNewsCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Notifications.dart';
import 'PageSwitch.dart';
import 'SingleNewsPage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ArticleBloc>(create: (_)=>ArticleBloc(articles_data_repository: Articles_Data_RepositoryImpl()),),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(25, 25, 26, 1),
        scaffoldBackgroundColor: Color.fromRGBO(25, 25, 26, 1),
        iconTheme: new IconThemeData(
            color: Colors.white,
            opacity: 1.0,
            size: 50.0
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.ptSerifTextTheme(),
      ),
      initialRoute: "/",
      onGenerateRoute: _onGenerateRoute,
    );
  }
}


Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PageSwitch();
      });
    case "/notifications":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Notifications();
      });
    case "/search-results":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Notifications();
      });
    case "/single-news":
      return MaterialPageRoute(builder: (BuildContext context) {
        return PageSwitch();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return PageSwitch();
      });
  }
}


