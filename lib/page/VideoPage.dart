import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ftins/bean/HomeBean.dart';
import 'package:ftins/bean/VideoBean.dart';
import 'package:ftins/widget/ListViewItemWidget.dart';
import 'package:ftins/widget/ShortVideoItemWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});


  @override
  State<VideoPage> createState() => _VideoPage();
}

class _VideoPage extends State<VideoPage> {

  List<VideoBean> items = [VideoBean("authorName", "authorId", "desctiption", "iconUrl", "followStatus", "messageId", "videoUrl", "likeCount", "msgCount", "shareCount", "musicName", "musicAuthor")];

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
  }

  static int refreshNum = 10; // number that changes when refreshed
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
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

    items.add(VideoBean("authorName", "authorId", "desctiption", "iconUrl", "followStatus", "messageId", "videoUrl", "likeCount", "msgCount", "shareCount", "musicName", "musicAuthor"));
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
            child: StreamBuilder<int>(
              builder: (context, snapshot){
                /**
                 * 这边需要一个竖向的ViewPage来进行代替
                 */
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index){
                      return ShortVideoItemWidget();
                    });
              },
            )
        )
    );
  }
}
