import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/location_loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Location_loading(),
      '/location_loading':(context) => ChooseLocation(),
      '/home': (context) => Home(),
      '/location': (context) => Loading(),
    },
  ));
}

