import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response response = await get('https://api.covid19api.com/summary');
    var body = jsonDecode(response.body);

    Navigator.popAndPushNamed(context, '/home',
        arguments: {'global': body['Global'], 'countries': body['Countries']});
    // List bb = body['Countries'];

    // for (var b in bb) {
    //   if (b['Country'] == "Ghana") {
    //     print(b);
    //   } else
    //     continue;
    // }
    print('working');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.red[400],
          size: 100.0,
        ),
      ),
    );
  }
}
