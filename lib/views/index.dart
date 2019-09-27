
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/config/application.dart';
import 'package:weui/weui.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
 final list = [
    {
      'title': '车辆选择',
      'icon': 'assets/images/index-icon/icon_nav_form.png',
      'children': [
        {
          'title': '设置页',
          'url': '/setting'
        },
      ]
    }
  ];
    // 标题padding
  final double titlePadding = 36.0;
  // 列表左右padding
  final double listPadding = 18.0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    final theme = WeUi.getTheme(context);
    final List<WeCollapseItem> children = [];

    list.forEach((item) {
      children.add(
        WeCollapseItem(
          title: Text(item['title'], style: TextStyle(
            fontSize: 16.0
          )),
          child: Column(
            children: renderSubItem(item['children'])
          )
        )
      );
    });

    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: ListView(
        children: <Widget> [
          Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.all(36.0),
              child: Column(
                children: [
                  Container(
                    child: Text('使用Flutter WeUi制作的租车', style: TextStyle(
                      fontSize: 25.0
                    ))
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('下方为各个模块的示例', style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff888888)
                    ))
                  )
                ]
              )
              ),
          ],),
          Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10.0),
            child: WeCollapse(
              card: true,
              accordion: true,
              // buildTitle: buildTitle,
              // buildContent: buildContent,
              children: children
            )
          )
        ]
      ),
    );
  }


  List<Widget> renderSubItem(subList) {
    final List<Widget> widgetList = [];

    // 循环数组
    subList.forEach((dynamic item) {
      final List<Widget> content = [
        Container(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(item['title'], style: TextStyle(
                  fontSize: 16.0
                ))
              ),
              Container(
                child: Image.asset('assets/images/right-icon.png', height: 16.0)
              )
            ]
          )
        )
      ];

      // 第一个不添加边框
      if (subList.indexOf(item) > 0) {
        content.insert(0, Divider(height: 1, color: Color(0xffd8d8d8)));
      }

      widgetList.add(
        InkWell(
          onTap: () {
            if (item['url'] == null) {
              WeToast.info(context)('正在努力开发中...', duration: 1500);
              return;
            }
            // Navigator.of(context).pushNamed(item['url']);
            Application.router.navigateTo(context, '/setting', transition: TransitionType.inFromBottom);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: listPadding,
              right: listPadding
            ),
            child: Column(
              children: content
            )
          )
        )
      );
    });

    return widgetList;
  }
}