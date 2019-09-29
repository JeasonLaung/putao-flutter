import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:weui/cell/index.dart';

import '../../config/application.dart';
import '../../providers/user.dart';


import '../../components/tag.dart';

class MyDrawer extends StatelessWidget{
  final List listViews = [
    {
      'title': '收藏车辆',
      'icon': Icons.collections,
      'url': '/message'
    },
    {
      'title': '历史订单',
      'icon': Icons.report,
      'url': '/message'
    },
    {
      'title': '我的消息',
      'icon': Icons.message,
      'url': '/message'
    },
    {
      'title': '意见反馈',
      'icon': Icons.error,
      'url': '/message'
    },
    {
      'title': '教程&协议',
      'icon': Icons.live_tv,
      'url': '/message'
    },
    {
      'title': '关于葡萄',
      'icon': Icons.group_work,
      'url': '/message'
    },
  ];
  final List iconNavigators = [
    {
      'title': '我的消息',
      'icon': Icons.message,
      'url': '/message'
    },
    {
      'title': '我的车辆',
      'icon': Icons.category,
      'url': '/mycar'
    },
    {
      'title': '我的钱包',
      'icon': Icons.account_balance_wallet,
      'url': '/mycar'
    },
    {
      'title': '我的额度',
      'icon': Icons.account_balance,
      'url': '/mycar'
    },
  ];
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    
    return Drawer(
      child: Provide<UserProvider>(
        builder: (context, child, user){
          return  Stack(
            children: <Widget>[
              ListView(
                physics: NeverScrollableScrollPhysics(),
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyDrawerUserDrawerHeader(user: user,),
                  Container(
                    // color: Colors.white,
                    height: ScreenUtil().setHeight(1920.0),
                    padding: EdgeInsets.only(
                      left:  ScreenUtil().setWidth(20.0),
                      right:  ScreenUtil().setWidth(20.0)
                    ),
                    child: Column(
                      children: <Widget>[
                        MyDrawerIconNavigator(items: iconNavigators,),
                        Divider(),
                        MyDrawerList(items: listViews),
                      ],
                    ),
                  ),
                ],
              ),
              MyDrawerFixButton()              
            ]
          );
        },
      )
    );
  }
}


class MyDrawerUserDrawerHeader extends StatelessWidget {
  final UserProvider user;
  MyDrawerUserDrawerHeader({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff7df6fc),
            Color(0xff635ff2)
          ]
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(300.0, 100.0),
        ),
        border: Border(

        )
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.info['avatar']),
      ),
      accountName: Builder(
        builder: (context) {
          return Row(
            children: <Widget>[
              Text(user.info['name'],
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(55.0)
                ),
              ),
              SuiTag(
                title: '高管',
              )
            ],
          );
        },
      ),
      accountEmail: Builder(
        builder: (context) {
          return Text(user.info['company_name'],
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0)
            ),
          );
        },
      ),
    );
  }
}

class MyDrawerIconNavigator extends StatelessWidget{
  final List items;
  MyDrawerIconNavigator({Key key, this.items}) : super(key: key);

  Widget _createGridView(BuildContext context,item) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(item['icon']),
          Padding(
            padding: EdgeInsets.only(
              top: 3.0
            ),
            child: Text(item['title'],
              style: TextStyle(
                fontSize: ScreenUtil().setSp(35.0)
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Application.router.navigateTo(context, item['url']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
      height: ScreenUtil().setHeight(200),
      child: GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(5.0),
        children: items.map((item) {
          return _createGridView(context,item);
        }).toList()
      )
    );
  }
}

class MyDrawerList extends StatelessWidget {
  final List items;
  MyDrawerList({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return InkWell(
          child: WeCell(
            label: Icon(item['icon']),
            footer: Container(
              child: Text(item['title']),
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0)
              ),
            ),
          ),
          onTap: (){
            Application.router.navigateTo(context, item['url']);
          },
        );
      }).toList(),
    );
  }
}



// 下方按钮
class MyDrawerFixButton extends StatelessWidget {

  MyDrawerFixButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: ScreenUtil().setHeight(150.0),
      child: Container(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Color(0xfff1f1f1)
            )
          )
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.cloud),
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(25.0)),
                      child: Text('夜间模式', style: TextStyle(),)
                    )
                  ],
                ),
                onTap: () {
                },
              ),
            ),
            InkWell(
              onTap: (){
                Application.router.navigateTo(context, '/setting');
              },
              child: Container(
                width: ScreenUtil().setWidth(250.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.settings),
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(25.0)),
                      child: Text('设置', style: TextStyle(),)
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                width: ScreenUtil().setWidth(250.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.close),
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(25.0)),
                      child: Text('退出')
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
