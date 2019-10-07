
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class Application {
  static Router router;

  // 状态栏高度
  static double statusHeight;
  // 屏幕总宽度
  static double screenWidth;
  // 屏幕总高度
  static double screenHeight;
  // appbar高度
  static double appBarHeight = 56.0;

  static const String host = 'http://v2test.mputao.com';

  
  static void init(BuildContext context) {
    if (statusHeight != null) {
      return ;
    }
    statusHeight = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}