

import 'package:flutter/services.dart';

class NativeDataHelper{

    static const platform = const MethodChannel('fins');

    static Future<List<String>> getVideoData() async{
      List<String> mediaList = [];
      try{
        mediaList = await platform.invokeMethod("getVideoData");
      }catch (e){
      }
      return mediaList;
    }

}