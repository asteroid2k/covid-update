import 'package:flutter/material.dart';

class LocationDetails extends StatelessWidget {
  // const LocationDetails({Key key}) : super(key: key);
  List props = [];
  Map country = {};
  Map data = {};

  @override
  Widget build(BuildContext context) {
    Map argz = ModalRoute.of(context).settings.arguments;
    country = argz['obj'];
    props = argz['data'];
    data = getData();
    print(data);
    return Scaffold(
      body: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(country['flag']),
          ),
          Text('${country['country']}(${country['code']})'),
          Row(
            children: <Widget>[
              Text('Total Confirmed   '),
              Text(data['TotalConfirmed'].toString()),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Total Deaths   '),
              Text(data['TotalDeaths'].toString()),
            ],
          ),
        ],
      ),
    );
  }

  Map getData() {
    for (var c in props) {
      if (c['Country'] == country['country']) {
        return (c);
      }
    }
    return {};
  }
}
