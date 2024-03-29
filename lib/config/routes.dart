import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import '../config/route_handlers.dart';

class Routes {
  // 设置路由
  static String index = '/';
  static String setting = '/setting';
  static String place = '/place';
  static String permission = '/permission';
  static String searchAddress = '/searchAddress';


  // 配置渲染页面
  static void config(Router router) {
    // 找不到回调
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        // return IndexPage();
      }
    );

    // 配置渲染路由
    router.define(index, handler: indexRouter);
    router.define(setting, handler: settingRouter);
    router.define(place, handler: placeRouter);
    router.define(permission, handler: permissionRouter);
    router.define(searchAddress, handler: searchAddressRouter);
  }
}