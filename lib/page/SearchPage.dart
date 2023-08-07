import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ftins/bean/HomeBean.dart';
import 'package:ftins/widget/SearchItemWidget.dart';
import 'package:ftins/widget/SearchItemLeftWidget.dart';
import 'package:ftins/widget/SearchBarWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});


  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {

  List<HomeBean> items = [
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();


  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
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
        body:  LiquidPullToRefresh(
            key: _refreshIndicatorKey,	// key if you want to add
            onRefresh: _handleRefresh,	// refresh callback
            showChildOpacityTransition: false,
            child:ListView.builder(
                itemCount: items.length + 1,
                itemBuilder: (BuildContext context, int index){
                  return getListView(index);
                })
        )
    );
  }

  Widget getListView(int index){
    if(index == 0){
      return SearchBarWidget();
    }
    if(index%2 == 1){
      return SearchItemWidget();
    }
    return SearchItemLeftWidget();
  }
}
