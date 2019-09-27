import 'package:flutter/material.dart';
import '../api/user.dart';

class UserProvider extends ChangeNotifier {
  Map info = {
    'type': 0,
    'lines': '0.00',
    'balance': '0.00',
    'name': '',
    'nick_name': '',
    'phone': '',
    // 'avatar': '', 
    'id': 0,
    'company_name': '',
    'company_id': null
  };
  void getInfo() async{
    print(info);
    // if (info['id']) {
    //   return;
    // } else {
    await getUserInfo().then((val) {
      info = val['data'];
      notifyListeners();
    });
    // }
  }
}