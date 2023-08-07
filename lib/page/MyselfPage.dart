import 'package:flutter/material.dart';


class MyselfPage extends StatefulWidget {
  const MyselfPage({super.key});

  @override
  State<MyselfPage> createState() => _MyselfPage();
}

class _MyselfPage extends State<MyselfPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("userName", style: TextStyle(color:  Colors.black , fontSize: 24),),
                  Expanded(
                      flex: 1,
                      child:  GestureDetector(
                        onTap: (){},
                        child: Icon(Icons.exit_to_app),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child:  SizedBox(
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child:  GestureDetector(
                        onTap: (){},
                        child: Icon(Icons.add),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child:  GestureDetector(
                        onTap: (){},
                        child: Icon(Icons.menu),
                      )
                  )
                ],
              ),
            ),
            showUserInfo(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [   Text("NickName")],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  MaterialButton(onPressed: (){

                  },
                  child: Text(""),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showUserInfo(){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 5,
                child:  Icon(Icons.supervised_user_circle)),
            Expanded(
                flex: 3,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                    Text("帖子"),
                  ],
                )),
            Expanded(
                flex: 3,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                    Text("粉丝"),
                  ],
                )),
            Expanded(
                flex: 3,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                    Text("关注"),
                  ],
                ))
          ],
        ),
      );
  }
}
