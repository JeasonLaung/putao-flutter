// import 'dart:io';

import 'dart:io';
import 'package:dio/dio.dart';

import '../config/application.dart';

Future axios({url, data = false, headers = const {}, params = const {}, method = 'get'}) async {

  Map<String, dynamic> mapPlaceholder = {};
  FormData formPlaceholder = FormData.from({});
  try {
    print('开始获取数据..............');
    Response response;
    Dio dio = new Dio();
    if (headers != null) {
      dio.options.headers.addAll(headers.length > 0 ? headers : mapPlaceholder);
    }
    // 检测请求地址是否是完整地址
    if(!url.startsWith('http')){
      url = Application.host + url;
    }
    // print(data ? data : '没有数据');
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    if (method == 'post') {
      response = await dio.post(
        url,
        data: data is FormData ? data : formPlaceholder,
        queryParameters: params.length > 0 ? params : mapPlaceholder,
      );
    } else {
      response = await dio.get(
        url,
        queryParameters: params.length > 0 ? params : mapPlaceholder,
      );
    }
    
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口出现异常。');
    }
  } catch (e) {
    return print('ERROR:===========>$e');
  }
}



// Future axios(
//   {
//     String url = BASE_HOST,
//     String method = 'GET',
//     data,
//     headers,
//     Map params
//   }
// ) async{
//   // int _code;
//   // String _msg;
//   // var _backData;

//   // 检测请求地址是否是完整地址
//   if(!url.startsWith('http')){
//     url = BASE_HOST + url;
//   }

//   try{
//     // var dataMap = data == null ? new Map() : data;
//     // Map<String, dynamic> headersMap = headers == null ? new Map() : headers;

//     // 配置dio请求信息
//     Response response;
//     Dio dio = new Dio();
//     dio.options.connectTimeout = 10000;        // 服务器链接超时，毫秒
//     dio.options.receiveTimeout = 3000;         // 响应流上前后两次接受到数据的间隔，毫秒
//     dio.options.headers.addAll(headers);    // 添加headers,如需设置统一的headers信息也可在此添加

//     if(method == 'get'){
//       response = await dio.get(url);
//     }else{
//       response = await dio.post(url,data: data);
//     }

//     // 返回结果处理
//     // Map<String, dynamic> resCallbackMap = response.data;
//     // _code = resCallbackMap['code'];
//     // _msg = resCallbackMap['msg'];
//     // _backData = resCallbackMap['data'];
//     return response;

//   } catch (e){
//     print('数据请求错误：' + e.toString());
//     throw('请求错误=========================》$url');
//   }
//   // FormData data = FormData();

//   // BaseOptions baseOptions = new BaseOptions(
//   //   baseUrl: BASE_HOST,
//   //   connectTimeout: 5000,
//   //   receiveTimeout: 3000,
//   // );

//   // Dio dio = new Dio(baseOptions);
//   // dio.interceptors.add(InterceptorsWrapper(
//   //   onRequest:(RequestOptions options) async {
//   //     // Do something before request is sent
//   //     return options; //continue
//   //     // If you want to resolve the request with some custom data，
//   //     // you can return a `Response` object or return `dio.resolve(data)`.
//   //     // If you want to reject the request with a error message,
//   //     // you can return a `DioError` object or return `dio.reject(errMsg)`
//   //   },
//   //   onResponse:(Response response) async {
//   //     // Do something with response data
//   //     return response; // continue
//   //   },
//   //   onError: (DioError e) async {
//   //     // Do something with response error
//   //     return  e;//continue
//   //   }
//   // ));
//   // try {
//   //   switch (method.toLowerCase()) {
//   //     case 'post':
//   //       response = await dio.post(
//   //         url,
//   //         queryParameters: params,
//   //         data: data,
//   //         options: options
//   //       );
//   //       break;
//   //     case 'put':
//   //       response = await dio.put(
//   //         url,
//   //         queryParameters: params,
//   //         data: data,
//   //         options: options
//   //       );
//   //       break;
//   //     case 'delete':
//   //       response = await dio.delete(
//   //         url,
//   //         queryParameters: params,
//   //         data: data,
//   //         options: options
//   //       );
//   //       break;
//   //     default:
//   //       response = await dio.get(
//   //         url,
//   //         queryParameters: params
//   //       );
//   //       break;
//   //   }
//   // } on DioError catch (e) {
//   //   // The request was made and the server responded with a status code
//   //   // that falls out of the range of 2xx and is also not 304.
//   //   // if(e.response) {
//   //       print(e.response.data);
//   //       print(e.response.headers);
//   //       print(e.response.request);
//   //   // } else{
//   //       // Something happened in setting up or sending the request that triggered an Error
//   //       print(e.request);
//   //       print(e.message);
//   //   // }
//   // }
//   // return response;
// }