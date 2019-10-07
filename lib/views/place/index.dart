import 'dart:async';

import 'package:amap_base/amap_base.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// import '../../widgets/button.widget.dart';
// import '../../utils/misc.dart';
// import '../../utils/view.dart';
import '../../config/application.dart';
// import '../../widgets/button.widget.dart';
// import '../../widgets/dimens.dart';
import 'package:flutter/material.dart';


class PlacePageFormModel {
  String start;
  String finish;
  String finishAddress;
  String startAddress;
  String duration;
  List<double> polylines;
  int startTime;
  int finishTime;

  PlacePageFormModel(
      {this.start,
      this.finish,
      this.finishAddress,
      this.startAddress,
      this.duration,
      this.polylines,
      this.startTime,
      this.finishTime});

  PlacePageFormModel.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    finish = json['finish'];
    finishAddress = json['finish_address'];
    startAddress = json['start_address'];
    duration = json['duration'];
    polylines = json['polylines'].cast<double>();
    startTime = json['start_time'];
    finishTime = json['finish_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['finish'] = this.finish;
    data['finish_address'] = this.finishAddress;
    data['start_address'] = this.startAddress;
    data['duration'] = this.duration;
    data['polylines'] = this.polylines;
    data['start_time'] = this.startTime;
    data['finish_time'] = this.finishTime;
    return data;
  }
}

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  AMapController _controller;
  bool _showBack = false;
  
  Map form = {
    'start': null
  };
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1) ,() {
      this.setState((){
        _showBack = true;
      });
    });
    return Container(
      child: Stack(
        children: <Widget>[
          AMapView(
            onAMapViewCreated: (controller) {
              setState(() => _controller = controller);
            },
            amapOptions: AMapOptions(),
          ),

          Positioned(
            top: Application.statusHeight + 10.0,
            left: 5.0,
            child: _showBack ? PlacePageBackButton() : Container(),
          ),
          Positioned(
            bottom: ScreenUtil().setWidth(70),
            left: ScreenUtil().setWidth(60),
            right: ScreenUtil().setWidth(150),
            child: PlacePageOrderPath(),
          ),
        ],
      )
    );
  }

  
  // 实时道路情况
  Color _getTmcColor(String tmc) {
    switch (tmc) {
      case '未知':
        return Colors.cyan;
      case '畅通':
        return Colors.green;
      case '缓行':
        return Colors.yellow;
      case '拥堵':
        return Colors.red;
      default:
        return Colors.cyan;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 返回按钮
class PlacePageBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child:  Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x55000000),
              blurRadius: 5.0,
            )
          ]
        ),
        child: Icon(Icons.arrow_back),
      )
    );
  }
}

// 下单路径
class PlacePageOrderPath extends StatelessWidget {

  Widget _createPath (BuildContext context, bool start) {
    // return InkWell(
    //   height: ScreenUtil().setHeight(175),
    //   padding: EdgeInsets.only(
    //     left: ScreenUtil().setWidth(30),
    //     right: ScreenUtil().setWidth(30)
    //   ),
      // onTap: (){
      //   print(132)
      // },
      // child: Builder(
        // builder: (context) {
          // 我是开始行程
          if (start) {
            return 
              GestureDetector(
                onTap: () {
                  Application.router.navigateTo(context, '/searchAddress');
                },
                child: Container(
                height: ScreenUtil().setHeight(175),
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  right: ScreenUtil().setWidth(30)
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on,color: Colors.purple,),
                    Text('')
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.black12
                    )
                  ),
                ),
              )
            
            );
          } else {
            return Container(
              height: ScreenUtil().setHeight(175),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.green,)
                ],
              ),
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(30)
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.black12
                  )
                ),
              ),
            );
          }
        // }
      // ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (res) {
        print(res);
      },
      child:
      Container(
        height: ScreenUtil().setHeight(350),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Column(
          children: <Widget>[
            _createPath(context, true),
            // _createPath(context, false)

          ],
        ),
      )
    );
  }
}



// 下单路径车辆
