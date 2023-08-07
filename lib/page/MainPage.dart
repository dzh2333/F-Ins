import 'package:flutter/material.dart';
import 'package:ftins/page/AddPage.dart';
import 'package:ftins/page/HomePage.dart';
import 'package:ftins/page/MyselfPage.dart';
import 'package:ftins/page/SearchPage.dart';
import 'package:ftins/page/VideoPage.dart';

class MainPage extends StatefulWidget{

  const MainPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  
  var allPages=[HomePage(),SearchPage(),AddPage(),VideoPage(), MyselfPage()];
  var currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages[currentIndex],
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
            //backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
            //backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "",
            //backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: "",
            //backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],

        onTap: (index){
          if(index == 2){
            Navigator.pushNamed(context, "createNewProduct");
          }else{
            setState(() {
              currentIndex=index;
            });
          }
        },
      ),
    );
  }
}