
import 'package:flutter/material.dart';

class SuiTag extends StatelessWidget {

  final String title;
  final String type;
  SuiTag({this.title, this.type});
  @override
  Widget build(BuildContext context) {
    var bgColor;
    var textColor = Colors.white;
    switch(type) {
      case 'default':
        bgColor = Colors.black12;
        break;
      default:
        bgColor = Colors.green;
        break;
    }
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Text(title, style: TextStyle(fontSize: 9.0,color: textColor),),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2.0)
      ),
    );
  }
}