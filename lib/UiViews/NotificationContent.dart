import 'package:daily_news/BlocStated/Article_Bloc.dart';
import 'package:daily_news/BlocStated/Article_Bloc_Event.dart';
import 'package:daily_news/BlocStated/Article_Bloc_State.dart';
import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:daily_news/utils/StaticData.dart';
import 'package:daily_news/widgets/MiniNewsCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationContent extends StatefulWidget {
  final Function clear;
  NotificationContent({this.clear});

  @override
  State<StatefulWidget> createState() {
    return LoadAllNotifications(clear: clear);
  }


}
class LoadAllNotifications extends State<NotificationContent>{
  Function clear;
  LoadAllNotifications({ this.clear});

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
    return Column(
      children: [
        SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today"),
              GestureDetector(
                onTap: this.clear,
                child: Text(
                  "Clear",
                  style: TextStyle(
                    color: Color.fromRGBO(251, 89, 84, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Earlier"),
            ],
          ),
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
        /*ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return MiniNewsCardF(news: StaticData.news[index + 2]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10.0,
            );
          },
        ),*/
      ],
    );
  }


  Widget LoadingProgressbar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget buildListview(List<Articles> booklist) {
    return  ListView.separated(
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
    );
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