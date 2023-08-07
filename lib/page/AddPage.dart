import 'package:flutter/material.dart';


class AddPage extends StatefulWidget {
  const AddPage({super.key});


  @override
  State<AddPage> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.backpack)),
        backgroundColor: Colors.white,
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 10),
            child: new GestureDetector(
              onTap: (){},
              child: Text("继续", style: TextStyle(color: Colors.blue, fontSize: 22)),
            ),
          )
        ],
        title : Text("新帖子", style: TextStyle(color: Colors.black),)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      )
    );
  }
}
