import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ftins/bean/HomeBean.dart';
import 'package:ftins/widget/ListViewItemWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  List<HomeBean> items = [HomeBean("msgId",
      "title", "author",
      "uthorIconUrl", "authorId",
      "location", "videoUrl",
      "date", "desription",
      "likeCount"),
    HomeBean("msgId",
        "title", "author",
        "uthorIconUrl", "authorId",
        "location", "videoUrl",
        "date", "desription",
        "likeCount"),
    HomeBean("msgId",
        "title", "author",
        "uthorIconUrl", "authorId",
        "location", "videoUrl",
        "date", "desription",
        "likeCount"),
    HomeBean("msgId",
        "title", "author",
        "uthorIconUrl", "authorId",
        "location", "videoUrl",
        "date", "desription",
        "likeCount")];

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
  }

  static int refreshNum = 10; // number that changes when refreshed
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    items.add(HomeBean("msgId",
        "title", "author",
        "uthorIconUrl", "authorId",
        "location", "videoUrl",
        "date", "desription",
        "likeCount"));
    setState(() {

    });
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });

    items.add(HomeBean("msgId",
        "title", "author",
        "uthorIconUrl", "authorId",
        "location", "videoUrl",
        "date", "desription",
        "likeCount"));
    setState(() {

    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("F-Ins"),
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: (){},
              icon: Icon(Icons.favorite_border, color: Colors.black,)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.messenger, color: Colors.black,))
        ],
      ),
      body:  LiquidPullToRefresh(
        key: _refreshIndicatorKey,	// key if you want to add
        onRefresh: _handleRefresh,	// refresh callback
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
          builder: (context, snapshot){
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index){
              final String item = items[index].author;
              return ListViewItemWidget();
            });
          },
        )
      )
    );
  }
}
