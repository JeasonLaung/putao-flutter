import 'package:flutter/material.dart';
import 'package:template/config/application.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: Application.screenHeight,
          )
        ],
      ),
    );
  }
}