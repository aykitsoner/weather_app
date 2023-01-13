import 'package:flutter/material.dart';
import 'package:weather_app/API/weatherApi.dart';
import 'package:weather_app/Pages/homepage.dart';
import 'package:weather_app/Pages/splashscreen.dart';

Future<void> main() async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
  print('girdi 1');
  await WeatherApi().getData(query: {'lat': '41', 'lon': '29'});
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
  print('çikti 1');
}
