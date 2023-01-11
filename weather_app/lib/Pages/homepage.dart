import 'package:flutter/material.dart';

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
    return Column(
      children: [
        headerWidget(size),
        weatherIconWidget(),
        weatherDegreeWidget(),
        locationWidget(),
      ],
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Icon(
        Icons.cloud,
        color: Colors.amber,
        size: 100,
      ),
    );
  }

  Widget weatherDegreeWidget() {
    return Text("12", style: TextStyle(fontSize: 30));
  }

  Widget locationWidget() {
    return Text("Konum");
  }
}
