import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:e_first_aid/logout.dart';
import 'package:e_first_aid/oed.dart';
import 'package:e_first_aid/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'dart:convert';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'acil_listesi.dart';
import 'bogulma.dart';
import 'cpr.dart';
import 'hastaneler.dart';
import 'homepage.dart';
import 'oed.dart';
import 'hastaneler.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "First Aid App",
    home: Home(),
  ),
);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

/*class Number {
  var City;
  var ZipCode;
  var name;
  var phone;

  Number({this.City, this.ZipCode, this.name, this.phone});
}*/

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  bool _speechRecognitionAvailable = false;
  late SpeechRecognition _speech;
  bool _isListening = false;
  String transcription = '';

  DeviceInfoPlugin plugin = DeviceInfoPlugin();
  bool isSimulator = false;

  var lat;
  var long;
  var zip;
  var loc;
  var theNum;
  List temp = [];

  Future getZipCode() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    this.lat = (position.latitude).toString();
    this.long = (position.longitude).toString();
    this.zip = (placemark[0].postalCode).toString();
    this.loc = (placemark[0].locality).toString();

    double lat1 = double.parse(lat);
    double long1 = double.parse(long);
    print(position);
    print(placemark[0].postalCode);
    print(placemark[0].locality);

    var num;
    for (int i = 0; i < test().length; i++) {
      var pos = (Geolocator.distanceBetween(
        lat1,
        long1,
        test()[i].Lat,
        test()[i].Long,
      ) *
          0.00062137);
      this.temp += [pos];
    }
    //print(temp);
    var min = temp[0];
    var place;
    for (int i = 0; i < temp.length; i++) {
      if (min > temp[i]) {
        min = temp[i];
        this.theNum = test()[i].Num;
        place = test()[i].Name;
      }
    }
    print(temp);
    print(theNum);
    print(place);
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not call $command");
    }
  }

  @override
  void initState() {
    super.initState();
    DeviceInfoPlugin().iosInfo.then((v) {
      isSimulator = (v.isPhysicalDevice == false);
    });
    //this.getLocation();
    this.getZipCode();
  }

  final List<Widget> _pages = [

    Center(
      child: Text(
        'home',
        style: TextStyle(fontSize: 50),
      ),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 4,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Merak Etmeyin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Text(
                    "Size yardm etmek için buradayız!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          MaterialButton(
            height: 75,
            minWidth: MediaQuery
                .of(context)
                .size
                .width / 1.1,
            //color: Theme.of(context).primaryColor,
            color: Colors.deepPurple,
            textColor: Colors.white,
            child: new Text(
              "Kalp Masajı",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () =>
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cprPage()),
              ),
              print('Kalp Masajı'),
            },
          ),

          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          MaterialButton(
            height: 75,
            minWidth: MediaQuery
                .of(context)
                .size
                .width / 1.1,
            color: Colors.deepPurple,
            textColor: Colors.white,
            child: new Text(
              "OED Kit Kullanımı",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () =>
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => oedPage()),
              ),
              print('Oed Kit Kullanımı'),
            },
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          MaterialButton(
            height: 75,
            minWidth: MediaQuery
                .of(context)
                .size
                .width / 1.1,
            //color: Theme.of(context).primaryColor,
            color: Colors.deepPurple,
            textColor: Colors.white,
            child: new Text(
              "Boğulmak",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () =>
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chokePage()),
              ),
              print('Boğulma Durumunda Yapılması Gerekenler'),
            },
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height / 50),
          MaterialButton(
            height: 75,
            minWidth: MediaQuery
                .of(context)
                .size
                .width / 1.1,
            //color: Theme.of(context).primaryColor,
            color: Colors.deepPurple,
            textColor: Colors.white,
            child: new Text(
              "112 Acil Hattı",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () =>
            {
              //sleep(Duration(seconds: 2)),
              if (lat != null && long != null)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            emergencyPage(
                              lat: lat,
                              long: long,
                              lst: temp,
                            )),
                  ),
                },
              print('Yakındaki Acil Servisler'),
            },
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height / 50,
          ),
          FloatingActionButton(
            onPressed: _speechRecognitionAvailable && !_isListening
                ? () => start()
                : null,
            child: _isListening
                ? Stack(
              alignment: Alignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.microphoneAlt),
                CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ],
            )
                : FaIcon(FontAwesomeIcons.microphone),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );



  }


  start() {}


}
