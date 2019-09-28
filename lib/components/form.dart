
import 'package:flutter/material.dart';
import 'package:weui/button/index.dart';

class SuiForm extends StatelessWidget {
  final Widget title;
  final Widget child;
  final Widget submitButton;
  final Function onSubmit;
  final String submitText;

  SuiForm({
    Key key, 
    this.title,
    this.child,
    this.submitButton,
    @required this.onSubmit,
    this.submitText
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 状态栏高度
    final double statusHeight = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

    // 屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    
    // 屏幕高度
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // appbar 高度
    const double appBarHeight = 56.0;
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Container(
        color: Color(0xffffffff),
        height: screenHeight - statusHeight - appBarHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: child,
            ),
            Builder(
              builder: (context) {
                if(submitButton == null) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                      top: 20.0,
                      bottom: 30.0
                    ),
                    child: WeButton(
                      submitText == null ? '提交' : submitText,
                      theme: WeButtonType.primary,
                      onClick: (){
                        onSubmit();
                      },
                    )
                  );
                } else {
                  return submitButton;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

