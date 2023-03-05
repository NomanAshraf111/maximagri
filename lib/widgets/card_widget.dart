

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.color, required this.title, required this.onTap});
  // Function? onTap;
  Function onTap;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      //onTap: onTap!,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: color),
        child: Center(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 22),)),
      ),
    );
  }
}
