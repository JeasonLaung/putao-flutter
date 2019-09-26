import 'package:flutter/material.dart';
import 'package:weui/weui.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var form = {
    'notify': false
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: WeCell(
                  label: '通知',
                  content: WeSwitch(
                    checked: form['notify'],
                    onChange: (val){
                      this.setState((){
                        form['notify'] = val;
                      });
                    },
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: WeButton(
              '退出登录',
              theme: WeButtonType.warn,
              onClick: () {
                WeDialog.confirm(context)(
                  '是否确认登出？',
                  onConfirm: () {
                    // 登出操作
                  },
                  onCancel: () {
                    // 取消操作
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


// class SettingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           WeCell(
//             label: '通知',
            
//           )
//         ],
//       ),
//     );
//   }
// }