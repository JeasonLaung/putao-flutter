import 'package:flutter/material.dart';
import 'package:weui/weui.dart';

import '../../../components/form.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var form = {
    'notify': true
  };
  @override 
  Widget build(BuildContext context) {
    return SuiForm(
      title: Text('设置'),
      onSubmit: () {
        print('我提交了');
        print(WeButtonType.warn);
      },
      child: ListView(
        children: <Widget>[
          // WeInput(
          //   label: '账号',
          // ),
          WeCell(
            label: '系统通知',
            content: WeSwitch(
              checked: form['notify'],
              onChange: (val) {
                this.setState(() {
                  form['notify'] = val;
                });
              },
            ),
          ),
          Divider(),
          WeCell(
            label: '',
          ),
        ],
      ),
    );
  }
}


// class SettingPage extends StatefulWidget {
//   @override
//   _SettingPageState createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   var form = {
//     'notify': false
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: WeCell(
//                   label: '通知',
//                   content: WeSwitch(
//                     checked: form['notify'],
//                     onChange: (val){
//                       this.setState((){
//                         form['notify'] = val;
//                       });
//                     },
//                   ),
//                 ),
//                 flex: 1,
//               ),
//             ],
//           ),
//           Divider(),
//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//             child: WeButton(
//               '退出登录',
//               theme: WeButtonType.warn,
//               onClick: () {
//                 WeDialog.confirm(context)(
//                   '是否确认登出？',
//                   onConfirm: () {
//                     // 登出操作
//                   },
//                   onCancel: () {
//                     // 取消操作
//                   }
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

