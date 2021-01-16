import 'package:daily_news/BlocStated/Article_Bloc.dart';
import 'package:daily_news/BlocStated/Article_Bloc_Event.dart';
import 'package:daily_news/BlocStated/Article_Bloc_State.dart';
import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:daily_news/widgets/MiniNewsCard.dart';
import 'package:daily_news/widgets/SingleNewsCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreen();
  }
}

class HomeScreen extends State<Home>{
  List<Articles>artivcles;
  ArticleBloc articleBloc;
  @override
  void initState() {
    artivcles=List<Articles>();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(FetchArticleDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              child:BlocBuilder<ArticleBloc,ArticleBlocState>(
                builder: (context,state){
                  if(state is ArticleBlocInitialState){
                    return LoadingProgressbar();
                  }
                  else if(state is ArticleBlocLoadingState){
                    return LoadingProgressbar();
                  }
                  else if(state is ArticleBlocDataStoreState){
                    List<Articles> booklist=List<Articles>();
                    booklist=state.response;
                    if(booklist.length>0){
                      artivcles.addAll(booklist);
                    }
                    return buildListview(booklist);
                  }
                  else{
                    ArticleBlocErrorState art=ArticleBlocErrorState();

                    return builderrorDialog(art.errormessage);
                  }
                },
              )),

          ],
        ),
      ),
    );
  }

  Widget LoadingProgressbar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildListview(List<Articles> booklist) {
    return Column(children: [
      SingleNewsCard(artivcles[0]),
      ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: artivcles.length,
        itemBuilder: (BuildContext context, int index) {
          return MiniNewsCard(news: artivcles[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10.0,
          );
        },
      )
    ],);

  }

  Widget builderrorDialog(String errormessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          errormessage==null?"No data found":errormessage,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    articleBloc.close();
    super.dispose();
  }
}