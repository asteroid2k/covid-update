import 'package:flutter/material.dart';
import 'package:covidupdate/models/country.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final locations = Country.loadLocations();
  dynamic data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    data = data['props'];
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Choose a City'),
      ),
      body: Container(
        child: ListView(
          children: getLocations(),
        ),
      ),
    );
  }

  List<Widget> getLocations() {
    return locations
        .map((wt) => Card(
              color: Colors.grey[700],
              child: ListTile(
                onTap: () {
                  var obj = {
                    'country': wt.country,
                    'code': wt.code,
                    'flag': wt.flag
                  };
                  Navigator.pushNamed(context, '/location_details',
                      arguments: {'obj': obj, 'data': data});
                },
                title: Text(wt.country,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.amber[300],
                        fontWeight: FontWeight.w500)),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(wt.flag),
                ),
              ),
            ))
        .toList();
  }
}
