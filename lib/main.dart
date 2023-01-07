import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/CRUD.dart';
// import 'dart:html';


void main(){
  runApp( MyApp()) ;
}



class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: Crud(),
    );
  }
}