import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';


import '../views/setting/index.dart';
import '../views/index.dart';

// 负责放置处理内容

var IndexRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  } 
);

var SettingRouter = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingPage();
  } 
);