import 'package:flutter/material.dart';
import 'package:mag_togo/news/news_detail.dart';
import '../model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../styles.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  final List<NewsModel> items = [];
  void getNews() async{
    final http.Response response = await http.get("http://dovene.coolpage.biz/selectAllNews.php");
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['info'].forEach((newsDetail) {
      final NewsModel news = NewsModel(
          content: newsDetail['content'],
          title: newsDetail['title'],
          sourceUrl: newsDetail['sourceUrl'],
          source: newsDetail['source'],
          image: newsDetail['image']
      );
      setState(() {
        items.add(news);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: ListView.builder(
            itemCount: this.items.length,
            itemBuilder: _listViewItemBuilder
        )
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    var newsDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(newsDetail),
        title: _itemTitle(newsDetail),
        onTap: (){
          _navigationToNewsDetail(context, newsDetail);
        });
  }


  Widget _itemThumbnail(NewsModel newsDetail){
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.image == null ? null : Image.network(newsDetail.image, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(NewsModel newsDetail){
    return Text(newsDetail.title, style: Styles.textDefault);
  }

  void _navigationToNewsDetail(BuildContext context, NewsModel newsDetail){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context){return NewsDetail(newsDetail);}
        ));
  }

}