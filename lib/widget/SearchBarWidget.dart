import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget{

  @override
  State createState() {
    return _SearchBarWidget();
  }
}

class _SearchBarWidget extends State<SearchBarWidget> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child:  Container(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text("搜索")
                      ],
                    ),
                  )),
              Expanded(
                child: Row(
                ),
                flex: 1,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.add_link_outlined)
                    ],
                  ))
            ],
          ),
        )
    );
  }
}