import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weui/weui.dart';

import './config/routes.dart';
import './config/application.dart';
import './views/index.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 配置路由
    final Router router = Router();
    Routes.config(router);
    Application.router = router;


    // 设置主题
    return WeUi(
      theme: WeTheme(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        home: IndexPage()
      )
    );
  }
}