import 'package:flutter/material.dart';
import 'package:weather_app/API/weatherApi.dart';
import 'package:weather_app/Pages/location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      print("Konum bilgileri gelmiyor.");
    } else {
      setState(() {
        print("latitude: " + locationData.latitude.toString());
        print("longitude: " + locationData.longitude.toString());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocationData();
    asyncFunc();
  }

  asyncFunc() async {
    print('girdi');
    await WeatherApi().getData(query: {'lat': '41', 'lon': '29'});
    print('çikti');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("latitude: ${locationData.latitude}"),
            // Text("longitude: ${locationData.longitude}")
          ],
        ),
      ),
    );
  }
}
