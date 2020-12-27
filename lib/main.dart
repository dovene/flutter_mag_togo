import 'package:flutter/material.dart';
import 'music.dart';
import 'news/news.dart';
import 'stories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.flash_on),
                  text: 'Actualités',
                ),
                Tab(
                  icon: Icon(Icons.sync),
                  text: 'Musique',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'Histoires',
                ),
              ],
            ),
            title: Text('Mag Togo'),
          ),
          body: TabBarView(
            children: [
              NewsScreen(),
              Music(),
              Stories(),
            ],
          ),
        ),
      ),
    );
  }
}
