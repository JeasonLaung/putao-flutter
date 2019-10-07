
import 'package:flutter/material.dart';

class PermissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PlacePageOrderBoard(),
      ],
    );
  }
}

class PlacePageOrderBoard extends StatefulWidget {
  @override
  _PlacePageOrderBoardState createState() => _PlacePageOrderBoardState();
}

class _PlacePageOrderBoardState extends State<PlacePageOrderBoard> {
  double _distance = 0.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        // print(res);
        // 方向
        var direction = details.delta.direction > 0 ? 1.0 : -1.0;
        // print(details.delta.distance);
        this.setState((){
          _distance = details.delta.distance;
        });
      },
      child: Container(
        height: 100.0 + _distance,
        width: 100.0,
        child: Container(
          height: 200.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
            )
          ),
        )
      )
      //  Column(
      //   children: <Widget>[
      //     Container(
      //       height: 100.0,
      //       width: 300.0,
      //       decoration: BoxDecoration(
      //         color: Color(0xffffffff),
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(10.0),
      //           topRight: Radius.circular(10.0)
      //         )
      //       ),
      //     )
      //   ],
      // )
    );
  }
}