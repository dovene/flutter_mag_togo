import '../model/news_model.dart';
class NewsResponse{
  final String statut;
  final List<NewsModel> info;
  NewsResponse({this.statut, this.info});
}