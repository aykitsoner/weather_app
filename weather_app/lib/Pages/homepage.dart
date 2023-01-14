import 'package:flutter/material.dart';
import 'package:weather_app/Pages/location.dart';
import 'package:weather_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: mainWidget(size),
    );
  }

  Widget mainWidget(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.amber,
      child: Stack(
        //fit: StackFit.expand,
        children: [
          Image.asset(
            'images/gunesli.jpg',
            fit: BoxFit.fill,
            width: size.width,
            height: size.height,
          ),
          weatherIconWidget(),
          weatherDegreeWidget(),
          locationWidget(),
        ],
      ),
    );
  }

  Widget headerWidget(size) {
    return Container(
      width: size.width,
      height: 60,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add),
            Text("Şehir"),
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("Get The App")
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.chrome_reader_mode),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("About")
                    ],
                  ),
                ),
              ],
              offset: Offset(0, 100),
              color: Colors.grey,
              elevation: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget weatherIconWidget() {
    // String temp_s = weatherData['data'][0]['weather']['icon'];
    // int tempInteger = int.parse(temp_s);
    return weatherData['data'][0]['weather']['code'] <= 522
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.add,
                ),
              ),
            ],
          )
        : Padding(
            padding: EdgeInsets.only(top: 30),
            child: Icon(
              Icons.abc,
            ),
          );
  }

  Widget weatherDegreeWidget() {
    double temp = weatherData['data'][0]['temp'];
    int tempInteger = temp.toInt();
    return weatherData == null
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(tempInteger.toString() + '°',
                    style: TextStyle(fontSize: 50)),
              ),
            ],
          );
  }

  Widget locationWidget() {
    return weatherData == null
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  weatherData['city_name'].toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          );
  }
}
