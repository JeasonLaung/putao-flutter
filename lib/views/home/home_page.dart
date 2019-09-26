import 'package:flutter/material.dart';

import './my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            child: Row(
              children: <Widget>[
                Builder(
                  builder: (BuildContext context) => IconButton(
                    icon: Icon(Icons.person,size: 30.0,),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Builder(
                  builder: (BuildContext context) => IconButton(
                    icon: Icon(Icons.view_headline,size: 30.0,),
                    onPressed: () {
                      // Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// class NavigatorIconComponent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }