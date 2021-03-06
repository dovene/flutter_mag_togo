import 'package:flutter/material.dart';
import '../model/news_model.dart';
import '../styles.dart';
class NewsDetail extends StatelessWidget{
  final NewsModel newsDetail;

  NewsDetail(this.newsDetail);

  @override

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text(newsDetail.title, style: Styles.navBarTitle,)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, newsDetail),
        )
    );
  }

  List<Widget> _renderBody(BuildContext context, NewsModel newsDetail){
    List<Widget> result = [];
    result.add(_bannerImage(newsDetail.image, 170.0));
    result.addAll(_renderInfo(context, newsDetail));
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, NewsModel newsDetail){
    List<Widget> result = [];
    result.add(_sectionTitle(newsDetail.title));
    result.add(_sectionText(newsDetail.content));
    return result;
  }

  Widget _sectionTitle(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
        child: Text(text,
            textAlign: TextAlign.left,
            style: Styles.headerLarge));
  }
  Widget _sectionText(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
        child:Text(text, style: Styles.textDefault,)
    );
  }

  Widget _bannerImage(String url, double height){
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(url, fit: BoxFit.fitWidth)
    );
  }
}
