import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';


import '../views/choose/address.dart';
import '../views/setting/index.dart';
import '../views/permission/index.dart';
import '../views/place/index.dart';
import '../views/index.dart';

// 负责放置处理内容

var indexRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  } 
);

var settingRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  } 
);

var placeRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PlacePage();
  } 
);
// 权限说明页
var permissionRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PermissionPage();
  } 
);
// 权限说明页
var searchAddressRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SearchAddressPage();
  } 
);