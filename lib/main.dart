import 'package:flutter/material.dart';
import 'package:ftins/page/AddPage.dart';
import 'package:ftins/page/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F-Ins',
      routes: {
        "createNewProduct" : (context) {
          return AddPage();
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),

    );
  }
}
