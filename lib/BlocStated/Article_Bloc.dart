import 'package:bloc/bloc.dart';
import 'package:daily_news/BlocData/ArticleDataRepository.dart';
import 'package:daily_news/BlocStated/Article_Bloc_Event.dart';
import 'package:daily_news/BlocStated/Article_Bloc_State.dart';
import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:flutter/cupertino.dart';

class ArticleBloc extends Bloc<ArticleBlocEvent,ArticleBlocState>{
  Articles_Data_Repository articles_data_repository;
  ArticleBloc({@required this.articles_data_repository}) : super(null);
  ArticleBlocState get initialstate=>ArticleBlocInitialState();

  @override
  Stream<ArticleBlocState> mapEventToState(ArticleBlocEvent event) async*{
    if(event is FetchArticleDataEvent){
      yield ArticleBlocLoadingState();
      try{
        TopArticles topArticles=await articles_data_repository.getArticleDataRepository();
        print(topArticles);
        List<Articles> articlList;
        if(topArticles!=null){
          articlList=topArticles.articles;
        }
        yield ArticleBlocDataStoreState(response:articlList);
      }catch(e){
        yield ArticleBlocErrorState(errormessage:e.toString());
    print("the error is bloc c "+e.toString());
  }
  }
  }
  
}