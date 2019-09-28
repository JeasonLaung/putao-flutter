

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:weui/weui.dart';
// import 'package:weui/weui.dart';

import './config/routes.dart';
import './config/application.dart';
import './providers/counter.dart';
import './providers/user.dart';
// import './views/index.dart';
import './views/home/home_page.dart';

void main(){
  var providers = Providers();
  var counter = Counter();
  var userProvider = UserProvider();
  
  // 启动时获取用户信息
  userProvider.getInfo();
  // 定时刷新
  // Timer.periodic(
  //   const Duration(seconds: 5),
  //   (timer) => counter.increment(),
  // );

  // providers.provide(Provider<Counter>.value(counter));
  providers.provideAll({
    Counter: Provider<Counter>.value(counter),
    UserProvider: Provider<UserProvider>.value(userProvider)
  });
  runApp(
    ProviderNode(
      providers: providers,
      child: App()
    )
  );
}


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 配置路由
    final Router router = Router();
    Routes.config(router);
    Application.router = router;


    // 设置主题
    return WeUi(
      theme: WeTheme(
        primaryColor: Color(0xff6F71F7),
        primaryColorDisabled: Color(0xff5cadff),
        warnColor: Color(0xfffb4343),
        warnColorDisabled: Color(0xfffaa7a3)
      ),
      config: WeConfig(
        toastSuccessDuration: 5000
      ),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        // home: IndexPage()
        home: HomePage(),
      ),
    );
  }
}

