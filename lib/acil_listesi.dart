
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'ates.dart';
import 'hastaneler.dart';
import 'dart:math' as Math;
import 'main.dart';

//var lat;
//var long;

class emergencyPage extends StatelessWidget {
  final String lat;
  final String long;
  final List lst;

  const emergencyPage({
    Key? key,
    required this.lat,
    required this.long,
    required this.lst,
  }) : super(key: key);

  /*void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    //print(position);
    lat = position.latitude;
    long = position.longitude;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ES Numaraları"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /*Text(
            "Testing this feature",
            style: TextStyle(
              fontSize: 12,
            ),
          ),*/
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: test().length,
              itemBuilder: (context, int index) {
                return Container(
                  child: ListTile(
                    title: Text(
                      (test()[index].Name).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text((test()[index].Address).toString()),
                    trailing: Text(
                      lst[index].toString().substring(0, 6) + " Mi",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      var add = (test()[index].Address)
                          .toString()
                          .replaceAll(" ", "+");
                      var link =
                          "https://www.google.com/maps/dir/$lat,+$long/$add";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tempPage(
                            Name: test()[index].Name,
                            num: test()[index].Num,
                            map: link,
                          ),
                        ),
                      );
                      //getLocation();

                      //launch("tel:" + test()[index].Num);
                      //var lat2 = test()[index].Lat;
                      //var long2 = test()[index].Long;

                      //print(add);
                      //launch(
                      //    "https://www.google.com/maps/dir/$lat,+$long/$add");
                      //print(lat);
                      //print(test()[index].Lat);
                      //print(test()[index].Address);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*Geolocator.distanceBetween(
                            lat,
                            long,
                            test()[index].Lat,
                            test()[index].Long,
                          ).toString() */