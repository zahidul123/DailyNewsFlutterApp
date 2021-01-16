import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class ArticleBlocState extends Equatable{
}

class ArticleBlocInitialState extends ArticleBlocState{
  @override
  List<Object> get props => [];
}
class ArticleBlocLoadingState extends ArticleBlocState{
  @override
  List<Object> get props => [];
}
class ArticleBlocDataStoreState extends ArticleBlocState{
  List<Articles> response;
  ArticleBlocDataStoreState({@required this.response});

  @override
  // TODO: implement props
  List<Object> get props => [response];
}
class ArticleBlocErrorState extends ArticleBlocState{
  String errormessage;
  ArticleBlocErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];
}