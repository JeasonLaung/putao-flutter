import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:template/api/user.dart';
import 'package:template/config/application.dart';
import 'package:template/providers/user.dart';


import '../../components/tag.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);

    // getUserInfo().then((val) {
    //   print(val);
    // });
    return Drawer(
      child: Provide<UserProvider>(
        builder: (context, child, user){
          return  Container(
            height: ScreenUtil().setHeight(1920),
            child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff7d86fc),
                              Color(0xff635ff2)
                            ]
                          )
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(user.info['avatar']),
                        ),
                        accountName: Builder(
                          builder: (context) {
                            return Row(
                              children: <Widget>[
                                Text(user.info['name']),
                                SuiTag(
                                  title: '高管',
                                )
                              ],
                            );
                          },
                        ),
                        accountEmail: Builder(
                          builder: (context) {
                            return Text(user.info['company_name']);
                          },
                        ),
                      ),
                    ],
                  ),
                  MyDrawerFixButton()
                ]
              ),
          );
        },
      )

    );
  }
}

class MyDrawerIconNavigator extends StatelessWidget{
  List _list = [
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
  Widget _createGridView(BuildContext context,item) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Icon(item['icon']),
          Text(item['title']),
        ],
      ),
      onTap: () {
        Application.router.navigateTo(context, item['url']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      children: _list.map((item) {
        _createGridView(context, item);
      }).toList()
    );
  }
}


class MyDrawerList {
  
}



// 下方按钮
class MyDrawerFixButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenUtil().setHeight(150.0),
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
              onTap: (){},
              child: Container(
                width: ScreenUtil().setWidth(280.0),
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
                width: ScreenUtil().setWidth(280.0),
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
      ),
    );
  }
}

// class MyDrawer extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     List items = [
//       {
//         'title': '设置',
//         'url': '/setting',
//         'icon': Icons.settings
//       },
//       {
//         'title': '设置',
//         'url': '/setting',
//         'icon': Icons.settings
//       },
//       {
//         'title': '设置',
//         'url': '/setting',
//         'icon': Icons.settings
//       },
//       {
//         'title': '设置',
//         'url': '/setting',
//         'icon': Icons.settings
//       }
//     ];
//     List list = [
//       {
//         'title': '钱包',
//         'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//       },
//       {
//         'title': '余额',
//         'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//       },
//       {
//         'title': '车辆',
//         'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//       },
//       {
//         'title': '消息',
//         'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//       },
//     ];
//     return Drawer(
//       child: ListView(
//         physics: BouncingScrollPhysics(),
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i0.hdslb.com/bfs/article/bac1333e15fda682caeb099cfde92e03495d0cfc.jpg@1320w_916h.webp')),
//             accountName: Row(
//               children: <Widget>[
//                 Text('盛盛夺人', style: TextStyle(color: Colors.white, fontSize: 18.0),),
//                 Container(
//                   padding: EdgeInsets.all(2.0),
//                   child: Text('高管', style: TextStyle(fontSize: 9.0),),
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(2.0)
//                   ),
//                 )
//               ],
//             ),
//             accountEmail: Text(''),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage('https://i0.hdslb.com/bfs/article/a493bfd308cd50c3e8cc0f7d56334f3b2e3bc3b5.jpg@1320w_882h.webp')
//               )
//             )
//           ),
//           TopNavigator(items: list),
//           MyDrawerList()
//         ],
//       ),
//     );
//   }
// }


// 导航图标
// class MyDrawerNavigatorIcon extends StatelessWidget {
//   List<Map> list = [
//     {
//       'title': '钱包',
//       'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//     },
//     {
//       'title': '余额',
//       'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//     },
//     {
//       'title': '车辆',
//       'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//     },
//     {
//       'title': '消息',
//       'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
//     },
//   ];
//   Widget _gridViewUi (item) {
//     return InkWell(
//       child: Column(
//         children: <Widget>[
//           Image.network(item['img']),
//           Text(item['title'])
//         ],
//       ),
//       onTap: (){},
//     );
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5.0),
//       child: GridView.count(
//         crossAxisCount: list.length,
//         children: list.map((item) {
//           return _gridViewUi(item);
//         }).toList()
//       )
//     );
//   }
// }


// // 顶部导航
// class TopNavigator extends StatelessWidget {
//   final List items;
//   TopNavigator({Key key, this.items}) : super(key: key);

//   Widget _gridItemUI(BuildContext context, item) {
//     return InkWell(
//       onTap: () {
//         print('点击了导航');
//       },
//       child: Column(
//         children: <Widget>[
//           Image.network(
//             item['img'],
//             height: 40.0,
//             width: 40.0,
//           ),
//           Text(item['title']),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (this.items.length > 10) {
//       this.items.removeRange(10, this.items.length);
//     }
//     return Container(
//       height: 70.0,
//       padding: EdgeInsets.fromLTRB(20, 0,20.0,0),
//       child: GridView.count(
//         // 解决顶部导航区域（GridView）与全局（SingleChildScrollView）的滑动冲突问题
//         physics: NeverScrollableScrollPhysics(),
//         crossAxisCount: items.length,
//         padding: EdgeInsets.all(5.0),
//         children: items.map((item) {
//           return _gridItemUI(context, item);
//         }).toList(),
//       ),
//     );
//   }
// }


// class MyDrawerList extends StatelessWidget {
//   List items = [
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     }
//   ];

// // // 顶部导航
// class MyDrawerList extends StatelessWidget {
//   final List items = [
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     },
//     {
//       'title': '设置',
//       'url': '/setting',
//       'icon': Icons.settings
//     }
//   ];
//   // MyDrawerList({Key key}) : super(key: key);

//   Widget _gridItemUI(item) {
//     return InkWell(
//       child: Row(
//         children: <Widget>[
//           Icon(Icons.settings),
//           Expanded(
//             flex: 1,
//             child: Text(''),
//           ),
//           Text(item['title'])
//         ],
//       )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 110.0,
//       child: ListView(
//         children: items.map((item) {
//           return _gridItemUI(item);
//         }).toList(),
//       ),
//     );
//   }
// }
