import '../utils/axios.dart';

Future getUserInfo() async{
  return axios(
    headers: {
      'x-putao-signature': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ1aWQiOjJ9.mNdAbmXw2kf7ublAYFnlKuTqr8bkXJf9wJVbzS5_Pmtq2s_2QOD7_Py9gmV6rSn1gyBoLgWYwA0yCn-UpzWUO4NrxK85Bx2bwNSCj59EtQwO8HZcCVpTv2yrdoYzf1MQYmaQLgBJMYsv747-Lhaa679KX8zPybtL3gwVuDzd1_I'
    },
    url: '/rental/login/getUserInfo',
  );
}