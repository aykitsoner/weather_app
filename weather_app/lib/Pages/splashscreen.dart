import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/API/weatherApi.dart';
import 'package:weather_app/Pages/homepage.dart';
import 'package:weather_app/Pages/location.dart';
import 'package:weather_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    String location_latitude = locationData.latitude.toString();
    String location_longitude = locationData.longitude.toString();
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

  asyncFunc() async {
    print('girdi');
    await getLocationData();
    await WeatherApi().getData(
      query: {
        'lat': locationData.latitude.toString(),
        'lon': locationData.longitude.toString()
      },
    );

    setState(() {
      print(weatherData);
    });
    print('çikti');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocationData();
    asyncFunc();

    Future.delayed(const Duration(milliseconds: 10000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.grey,
            ],
          ),
        ),
        child: Center(
            child:
                // Load a Lottie file from a remote url
                Lottie.network(
                    'https://assets10.lottiefiles.com/private_files/lf30_jmgekfqg.json')),
      ),
    );
  }
}
