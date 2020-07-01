import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicx/colors.dart';
import 'package:musicx/playerControls.dart';

import 'albumart.dart';
import 'navbar.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(fontFamily: "Circular"),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavigationBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 3, //for 3 songs right now!
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            "Impossible",
            style: TextStyle(
                fontSize: 28,
                color: darkPrimaryColor,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "James Arthur",
            style: TextStyle(
                fontSize: 20,
                color: darkPrimaryColor,
                fontWeight: FontWeight.w300),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
            ),
            child: Slider(
              activeColor: darkPrimaryColor,
              inactiveColor: darkPrimaryColor.withOpacity(0.4),
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              min: 0,
              max: 20,
            ),
          ),
          PlayerControls(),
          SizedBox(
            height: 75,
          )
        ],
      ),
    );
  }
}
