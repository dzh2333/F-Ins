import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ListViewItemWidget extends StatefulWidget{

  @override
  State createState() {
    return _ListViewItemWidgetState();
  }
}

class _ListViewItemWidgetState extends State<ListViewItemWidget>{

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
        //未关注的才会显示为你推荐
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("为你推荐"),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: InkWell(
                child: Icon(Icons.close),
                onTap: (){
                  /**
                   * 关闭
                   */
                },
              ),
            )
          ],
        ),

        Stack(
          children: [
            Container(
              height: 220,
              color: Colors.blueGrey,
              margin: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Positioned.fill(child: GestureDetector(
                      child: AspectRatio(
                        child: VideoPlayer(_controller),
                        aspectRatio: _controller.value.aspectRatio,
                      )),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /**
                         * 网络图片
                         */
                        // Image(image: Image.network(""))
                        Expanded(
                            flex: 1,
                            child:Icon(Icons.verified_user, color: Colors.white)
                        ),
                        Expanded(
                          flex: 6,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("userName", style: TextStyle(fontSize: 18, color: Colors.white),),
                              Text("userName", style: TextStyle(fontSize: 12, color: Colors.white),)
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text("关注",  style: TextStyle(fontSize: 12, color: Colors.white))
                        ),
                        Expanded(
                            flex: 1,
                            child:   Icon(Icons.menu, color: Colors.white)
                        )
                      ],
                    ),
                  ),
                  buildControllerWidget()
                ],
              ),

            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * 网络图片
               */
              // Image(image: Image.network(""))

              Expanded(
                  flex: 1,
                  child:Icon(Icons.favorite_border)
              ),
              Expanded(
                  flex: 1,
                  child:Icon(Icons.messenger_outline)
              ),
              Expanded(
                  flex: 1,
                  child:Icon(Icons.share_outlined)
              ),
              Expanded(
                flex: 4,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child:   Icon(Icons.collections_outlined)
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 18,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1732赞"),
              Text("hahhahah"),
              Text("总共23条评论"),
              Text("6天前")
            ],
          ),
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


