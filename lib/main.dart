import 'package:covidupdate/views/location_details.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/views/choose_location.dart';
import 'package:covidupdate/views/home.dart';
import 'package:covidupdate/views/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/choose_location': (context) => ChooseLocation(),
        '/location_details': (context) => LocationDetails()
      },
    );
  }
}
