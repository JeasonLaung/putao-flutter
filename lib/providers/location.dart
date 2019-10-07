import 'package:amap_base/amap_base.dart';
import 'package:flutter/material.dart';

import '../model/search_address_model.dart';

// import '../api/user.dart';

class LocationProvider extends ChangeNotifier {
  Location nowLocation;
  PoiItem start;
  PoiItem finish;

  final _amapLocation = AMapLocation();

  final _getUserLocationOptions = LocationClientOptions(
    isOnceLocation: true,
    locatingWithReGeocode: true,
  );
  

  // 获取当前位置
  void getUserLocation({BuildContext context}) async{
    if (await Permissions().requestPermission()) {
      _amapLocation
      .getLocation(_getUserLocationOptions)
      .then((_) {
        this.nowLocation = _;
      });
    } else {
      if (context != null) {
        Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('权限不足')));
      }
    }
  }

  // 设置跨页计划去向
  void setPathLocation (BuildContext context, PoiItem item, {bool isStart = true}) {
    if (isStart) {
      this.start = item;
    } else {
      this.finish = item;
    }
  }

}