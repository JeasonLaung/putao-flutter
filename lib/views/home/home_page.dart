import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';



import '../../config/application.dart';

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
    // 设置响应式布局
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    // 初始化应用数据
    Application.init(context);
    super.build(context);
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/building.jpg',
            )
          ),
        ),
        child: Column(
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePageHeader(),
            Expanded(
              flex: 1,
              child: Container(
              ),
            ),
            HomePageToolButton()
          ],
        ),
      )
    );
  }
}


// 头部按钮
class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (BuildContext context) => IconButton(
              color: Colors.white,
              icon: Icon(Icons.person,size: 30.0,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.more),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}


// 下方按钮
class HomePageToolButton extends StatelessWidget {
  final List items = [
    {
      'title': '企业用车',
      'icon': Icons.settings_applications,
      'url': '/'
    },
    {
      'title': '个人用车',
      'icon': Icons.drag_handle,
      'url': '/'
    },
    {
      'title': '权限说明',
      'icon': Icons.dock,
      'url': '/'
    },
  ];
  Widget _createToolButton (BuildContext context,item) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(context, item['url']);
        },
        child: Container(
          padding: EdgeInsets.only(
            top:ScreenUtil().setHeight(60.0)
          ),
          child: Column(
            children: <Widget>[
              Icon(item['icon'],
                size: ScreenUtil().setSp(90.0),
              ),
              Text(item['title'])
            ],
          )
        ),
      ),
      flex: 1,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xfffafafa),
      // color: Colors.wh,
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ScreenUtil().setHeight(20.0)),
          topRight: Radius.circular(ScreenUtil().setHeight(20.0)),
        )
      ),
      padding: EdgeInsets.all(ScreenUtil().setHeight(20.0)),
      height: ScreenUtil().setHeight(300.0),
      width: ScreenUtil().setHeight(1000.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items.map((item) {
          return _createToolButton(context, item);
        }).toList(),
      ),
    );
  }
}



// import '../../providers/counter.dart';

// provide传输与显示 
// 显示
 // Provide<Counter>(
//   builder: (context, child, counter) => Text(
//     '${counter.value}',
//     style: Theme.of(context).textTheme.display1,
//   ),
// ),

// 传输
// Provide.value<Counter>(context).increment()