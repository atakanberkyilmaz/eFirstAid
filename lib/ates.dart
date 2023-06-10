import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:flutter/material.dart';
import 'hastaneler.dart';
import 'dart:math' as Math;
import 'main.dart';

class tempPage extends StatelessWidget {
  final String Name;
  final String num;
  final String map;

  const tempPage({
    Key? key,
    required this.Name,
    required this.num,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Name),
      ),
      body: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              text: "\nCall: ",
            ),
            TextSpan(
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch("tel:" + num);
                },
              text: "(" +
                  num.substring(0, 3) +
                  ") " +
                  num.substring(3, 6) +
                  " " +
                  num.substring(6, 10),
            ),
            TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              text: "\n\nAnlatmamı ister misiniz?  ",
            ),
            TextSpan(
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              text: "Buraya tıklayın",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch(map);
                },
            ),
          ],
        ),
      ),
    );
  }
}
