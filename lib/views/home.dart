import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double fieldsize = 30.0;
  double valuesize = 50.0;
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map props = ModalRoute.of(context).settings.arguments;

    data = data.isNotEmpty ? data : props['global'];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/world.png'),
                radius: 100.0,
              ),
              Padding(padding: EdgeInsets.all(40.0)),
              Column(
                children: <Widget>[
                  Text(
                    'Total Confirmed',
                    style:
                        TextStyle(color: Colors.grey[300], fontSize: fieldsize),
                  ),
                  Text(
                    format(data['TotalConfirmed']),
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: valuesize,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              Column(
                children: <Widget>[
                  Text(
                    'Total Deaths',
                    style:
                        TextStyle(color: Colors.grey[300], fontSize: fieldsize),
                  ),
                  Text(
                    format(data['TotalDeaths']),
                    style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: valuesize,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Population',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  Text('696969'),
                ],
              ),
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(props['Countries']);
          Navigator.pushNamed(context, '/choose_location',
              arguments: {'props': props['countries']});
        },
        child: Icon(Icons.location_searching),
      ),
    );
  }

  String format(int s) {
    String str = s.toString();
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    return str.replaceAllMapped(reg, mathFunc);
  }
}
