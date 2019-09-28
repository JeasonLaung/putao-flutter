import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../providers/counter.dart';
import './my_drawer.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive =>true;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    super.build(context);
    
    return Scaffold(
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Builder(
                  builder: (BuildContext context) => IconButton(
                    icon: Icon(Icons.person,size: 30.0,),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more),
                  onPressed: () => Provide.value<Counter>(context).increment(),
                ),
                // Builder(
                //   builder: (BuildContext context) => IconButton(
                //     icon: Icon(Icons.view_headline,size: 30.0,),
                //     onPressed: () {
                //       // Scaffold.of(context).openDrawer();
                //       return Provide.value<Counter>(context).increment();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          Provide<Counter>(
            builder: (context, child, counter) => Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(1920.0),
            child: Stack(
              children: <Widget>[
              ],
            ),
          )
        ],
      ),
    );
  }
}
