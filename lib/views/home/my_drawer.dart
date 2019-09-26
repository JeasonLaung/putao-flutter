import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List list = [
      {
        'title': '钱包',
        'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
      },
      {
        'title': '余额',
        'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
      },
      {
        'title': '车辆',
        'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
      },
      {
        'title': '消息',
        'img': 'https://i.52112.com/icon/jpg/256/20190917/58831/2602634.jpg'
      },
    ];
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i0.hdslb.com/bfs/article/bac1333e15fda682caeb099cfde92e03495d0cfc.jpg@1320w_916h.webp')),
            accountName: Row(
              children: <Widget>[
                Text('盛盛夺人', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
                Container(
                  padding: EdgeInsets.all(2.0),
                  child: Text('高管', style: TextStyle(fontSize: 9.0),),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(2.0)
                  ),
                )
              ],
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://i0.hdslb.com/bfs/article/a493bfd308cd50c3e8cc0f7d56334f3b2e3bc3b5.jpg@1320w_882h.webp')
              )
            )
          ),
          TopNavigator(items: list)
        ],
      ),
    );
  }
}


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
class TopNavigator extends StatelessWidget {
  final List items;
  TopNavigator({Key key, this.items}) : super(key: key);

  Widget _gridItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['img'],
            height: 40.0,
            width: 40.0,
          ),
          Text(item['title']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.items.length > 10) {
      this.items.removeRange(10, this.items.length);
    }
    return Container(
      height: 150.0,
      padding: EdgeInsets.fromLTRB(20, 0,20.0,0),
      child: GridView.count(
        // 解决顶部导航区域（GridView）与全局（SingleChildScrollView）的滑动冲突问题
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: items.length,
        padding: EdgeInsets.all(5.0),
        children: items.map((item) {
          return _gridItemUI(context, item);
        }).toList(),
      ),
    );
  }
}