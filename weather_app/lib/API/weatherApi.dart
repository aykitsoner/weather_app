import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const apiKey = "bc7215741fmshc93c5123ecc8a5dp149a13jsn0fc581e24d2f";
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
    var data = jsonDecode(response.body);
    print(data);
  }
}
