import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/utils/constants.dart';

class WeatherApi {
  static const apiKey = "bf3d153343msh122e68983c57eddp14d527jsn445b2b10c57d";
  static Map<String, String> headers = {
    "X-RapidAPI-Key": apiKey,
    "X-RapidAPI-Host": "weatherbit-v1-mashape.p.rapidapi.com",
  };
  dynamic getData(
      {String? endpoint, required Map<String, String> query}) async {
    endpoint = 'forecast/daily/';
    // Map<String, dynamic> parameters = {
    //   "lat": '41',
    //   "lon": '29',
    // };
    Map<String, dynamic> parameters = {
      "lat": query['lat'],
      "lon": query['lon'],
    };

    Uri uri =
        Uri.https("weatherbit-v1-mashape.p.rapidapi.com", endpoint, parameters);
    final response = await http.get(uri, headers: headers);
    print(response.statusCode);
    weatherData = jsonDecode(response.body);
    print(weatherData);
    print(weatherData['city_name']);
  }
}
