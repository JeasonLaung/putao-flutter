
import 'package:amap_base/amap_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import '../../providers/location.dart';
// import '../../model/search_address_model.dart';
import '../../config/application.dart';

class SearchAddressPage extends StatefulWidget {
  SearchAddressPage({Key key}) : super(key: key);

  _SearchAddressPageState createState() => _SearchAddressPageState();
}

class _SearchAddressPageState extends State<SearchAddressPage> {
  final TextEditingController _textController = TextEditingController();
  final EasyRefreshController _easyRefreshController = EasyRefreshController();
  final _amapLocation = AMapLocation();

  LocationProvider locationProvider;
  
  String keyword = "";
  int page = 1;

  // 当前位置
  // Location nowLocation;

  // 重选城市
  Map chooseCity = {
    "city": "佛山市",
    "province": "广东省",
    "adCode": ""
  };

  // 选择位置
  // Map chooseLocation = {
  //   "address": "",
  //   "latitude": "",
  //   "longtitude": "",
  //   "city": "",
  //   "province": "",
  //   "adCode": ""
  // };
  

  List result = [];
  final options = LocationClientOptions(
    isOnceLocation: true,
    locatingWithReGeocode: true,
  );

  // void _getUserLocation () async{
  //   if (await Permissions().requestPermission()) {
  //     _amapLocation
  //     .getLocation(options)
  //     .then((_) {
  //       // print(_);
  //       setState(() {
  //         this.nowLocation = _;
  //       });
  //     });
  //   } else {
  //     Scaffold.of(context)
  //       .showSnackBar(SnackBar(content: Text('权限不足')));
  //   }
  // }

  @override
  void initState() { 
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    Application.init(context);

    // 获取当前位置
    locationProvider.getUserLocation();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchAddressPageSearchBar(
            onInput: (val) {
              this.keyword = val;
              _searchAddress();
            },
            textController: _textController,
          ),
          Expanded(
            flex: 1,
            child: EasyRefresh(
              controller: _easyRefreshController,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: result.length,
                itemBuilder: (BuildContext context, index) {
                  return _createItem(result[index], index: index);
                },
              ),
              onLoad: () async{
                _searchMoreAddress();
                // _easyRefreshController.finishLoad(success: true,noMore: true);
              },
            ),
          )
        ],
      )
    );
  }
  

  // 更多页
  void _searchMoreAddress() {
    AMapSearch().searchPoi(
      PoiSearchQuery(
        query: this.keyword,
        pageNum: this.page,
        city: this.chooseCity['city'],
      ),
    ).then((val) {
      // print(val.toJson()['pois']);
      // if (val.query.) {

      // }
      if (val.query.d >= val.pageCount) {
        return _easyRefreshController.finishLoad(
          success: true,
          noMore: true
        );
      }
      this.page++;
      this.setState(() {
        result.addAll(val.toJson()['pois']);
      });
    });
  }

  // 搜索
  void _searchAddress() {
    if (this.keyword == '') {
      this.setState(() {
        result = [];
      });
      return;
    }
    AMapSearch().searchPoi(
      PoiSearchQuery(
        query: this.keyword,
        city: this.chooseCity['city'],
      ),
    ).then((val) {
      print(val.toJson()['pois']);
      this.setState(() {
        result = val.toJson()['pois'];
      });
    });
  }

  // 穿件一个item
  Widget _createItem(item, {index}) {
    Map types = {
      '01': Icons.local_car_wash,
      '02': Icons.local_car_wash,
      '03': Icons.local_car_wash,
      '04': Icons.directions_bike,
      '05': Icons.fastfood,
      '06': Icons.store_mall_directory,
      '07': Icons.restaurant_menu,
      '08': Icons.rowing,
      '09': Icons.local_hospital,
      '10': Icons.local_hotel,
      '11': Icons.streetview,
      '12': Icons.domain,
      '13': Icons.rate_review,
      '14': Icons.rate_review,
      '15': Icons.departure_board,
      '16': Icons.attach_money,
      '17': Icons.location_city,
      '18': Icons.place,
      '19': Icons.place,
      '20': Icons.place,
      '21': Icons.place,
      '22': Icons.transfer_within_a_station,
      '97': Icons.place,
      '99': Icons.place,
    };


    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black12
            )
          ),
        ),
        padding: EdgeInsets.fromLTRB(10.0, 16.0, 0.0, 16.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(types[item['typeCode'].toString().substring(0,2)], size: 35.0,color: Colors.blue,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(800.0),
                  child: Text(item['title'],
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(800.0),
                  child: Text(item['cityName'] + item['adName'] + (item['snippet'] != item['adName'] ? item['snippet'] : ''),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Text(item['typeDes']),
                // Text(item['typeCode']),

              ],
            ),
          ],
        )
      ),
      
    );
  }

}





// 头部
class SearchAddressPageSearchBar extends StatelessWidget {

  Widget leading = Container();
  String value;
  String placeholder;
  Function onInput;
  TextEditingController textController;

  SearchAddressPageSearchBar({
    Key key,
    this.leading, 
    this.value,
    this.placeholder, 
    this.onInput,
    this.textController
  });


  // void _searchAddress(keyword) {
  //   AMapSearch().searchPoi(
  //     PoiSearchQuery(
  //       query: '建设西一路',
  //       city: '佛山',
  //     ),
  //   ).then((val) {
  //     // print(val.toJson());
  //     this.setState(() {

  //     });
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Provide<LocationProvider>(
      builder: (context, child, user) {
        return Container(
          padding: EdgeInsets.only(
            top: Application.statusHeight
          ),
          height: ScreenUtil().setHeight(200.0),
          child: Row(
            children: <Widget>[
              leading ?? Container(),
              Row(children: <Widget>[
                Text('佛山'),
                Icon(Icons.keyboard_arrow_down),
              ]),
              Expanded(
                flex: 1,
                child: 
                TextFormField(
                  style: TextStyle(
                  ),
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: '输入地点',
                  ),
                  onChanged: (val) {
                    // this.value = val;
                    onInput(val);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel,
                color: Color(0xffcccccc),),
                onPressed: () {
                  textController.clear();
                  onInput('');
                },
              ),
            ],
          ),
        );
      }
      
    );
  }
}
