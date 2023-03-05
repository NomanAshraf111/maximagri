import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  //const AppBarWidget({Key? key}) : super(key: key);
  
  String title;
  
  AppBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(

      title: Text(title),
    );
  }
}
