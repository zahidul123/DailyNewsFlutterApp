import 'package:daily_news/ModelClasses/TopArticles.dart';
import 'package:dio/dio.dart';
abstract class Articles_Data_Repository{
  Future getArticleDataRepository();
}

class Articles_Data_RepositoryImpl extends Articles_Data_Repository{
  @override
  Future getArticleDataRepository() async{
    Response response=await Dio().get("https://newsapi.org/v2/top-headlines?country=us&apiKey=cdd0aad70f3f4d76911b5ed160420820");
    if(response.statusCode==200){
      TopArticles topArticles=TopArticles.fromJson(response.data);
      return topArticles;
    }
  }

}