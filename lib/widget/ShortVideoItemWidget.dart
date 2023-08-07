import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortVideoItemWidget extends StatefulWidget{

  @override
  State createState() {
    return _ShortVideoItemWidgetState();
  }
}

class _ShortVideoItemWidgetState extends State<ShortVideoItemWidget>{

  bool isPlay = false;
  bool isOver = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller =  VideoPlayerController.network('https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
        ..initialize().then((_){
          _controller.play();
          setState(() {
            _controller.pause();
          });
        })
        ..addListener(videoListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(videoListener);
    super.dispose();
  }

  void videoListener(){
    var curPlayPosition = _controller.value.position;
    var totalPlayTime = _controller.value.duration;
    if (curPlayPosition == totalPlayTime && curPlayPosition.toString() != "0:00:00.000000"){
      isOver = true;
      isPlay = false;
      _controller.initialize()
        ..then((_) {
          setState(() {

          });
        });

      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 24 -56,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      height: 2,
                      width: 1,
                      child: VideoPlayer(_controller)
                  )
              ),
            )
          ],
        )
      ],
    );
  }

  //播放界面
  Widget buildControllerWidget(){
    if(isPlay){
      return Container(
        child: GestureDetector(
          onTap: (){
            _controller.pause();
            isPlay = false;
            setState(() {
            });
          },
        ),
      );
    }
    return  Positioned.fill(child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Container(
          child: GestureDetector(
            onTap: (){
              if(isOver){
                isOver = false;
                _controller.play();
                isPlay = true;
                setState(() {
                });
              } else {
                _controller.play();
                isPlay = true;
                setState(() {
                });
              }
            },
            child: Icon(Icons.play_circle_fill, size: 44,),
          ),
        )),
    );
  }
}


