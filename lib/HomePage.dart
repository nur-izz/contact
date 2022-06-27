import 'package:flutter/material.dart';
import 'ViewPage.dart';

class HomePage extends StatefulWidget{
  @override
  myHomePage createState() => myHomePage();
}

class myHomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ViewPage(),
    );
  }
}