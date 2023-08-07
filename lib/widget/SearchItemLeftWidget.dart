import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SearchItemLeftWidget extends StatefulWidget{

  @override
  State createState() {
    return _SearchItemLeftWidget();
  }
}

class _SearchItemLeftWidget extends State<SearchItemLeftWidget>{

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
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    height: 2,
                    width: 1,
                    child: VideoPlayer(_controller)
                )
            )),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.asset("assets/images/multiple-page2.png",fit: BoxFit.fill),
                Image.asset("assets/images/multiple-page2.png",fit: BoxFit.fill),
              ],
            )),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.asset("assets/images/multiple-page2.png",fit: BoxFit.fill),
                Image.asset("assets/images/multiple-page2.png",fit: BoxFit.fill),
              ],
            ))
      ],
    );
  }

}


