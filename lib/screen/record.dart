import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:animations/animations.dart';
import 'dart:convert';

class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  static final String key =
      "AIzaSyDwePwfJY8uHsLK6gXEJWeAxSG-IB9APVs"; // ** ENTER YOUTUBE API KEY HERE **
  static final String type = "video";

  YoutubeAPI ytApi = new YoutubeAPI(key, maxResults: 100, type: type);

  List<YT_API> ytResult = [];

  ScrollController gridController = new ScrollController();


  callAPI() async {
    print('UI callled');
    String query = "kpop mv";
    ytResult = await ytApi.searchSort(query, 'viewCount');
    ytResult = ytResult + (await ytApi.nextPage());
    setState(() {
      print('UI Updated');
      print(ytResult[99].title.toString() +  'vs ' + ytResult[98].title.toString() + 'vs ' + ytResult[97].title.toString() +
          ', ' +
          ytResult[98].kind +
          ', ' +
          ytResult[98].id +
          ', ' +
          ytResult[98].thumbnail['default']['url'] +
          ', ' +
          ytResult[99].publishedAt + ' vs '
      +  ytResult[98].publishedAt+ ' vs '
          + ytResult[97].publishedAt
      );
    });
    _setList();
  }

  List<Widget> _setList() {
    return List.generate(ytResult.length, (int index) {
      return AnimationConfiguration.staggeredGrid(
          columnCount: 2,
          position: index,
          duration: const Duration(milliseconds: 375),
          child: FlipAnimation(
            child: FadeInAnimation(
              child: _setCard(index),
            ),
          ));
    });
  }

  Widget _setCard(int index) {
    return Container(
        child: Card(
            margin: EdgeInsets.all(7),
            semanticContainer: true,
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 18 / 11,
                    child: Image.network(
                      ytResult[index].thumbnail['high']['url'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child:
                          Text(
                            ytResult[index].title.replaceAll('&#39;' , "'").replaceAll('&quot;', "'").replaceAll('&amp;', '&'),
                            softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ),
                )
              ],
            )));
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimationLimiter(
            child: GridView.count(
              controller: gridController,
                childAspectRatio: 1.0,
                crossAxisCount: 2,
                children: _setList())));
  }
}
