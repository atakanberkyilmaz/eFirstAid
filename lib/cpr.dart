import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class cprPage extends StatelessWidget {
  const cprPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalp Masajı"
            ""),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InteractiveViewer(
              //padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Image(
                    image: AssetImage(""),
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 150,
                  ),
                  Image(
                    image: AssetImage(""),
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 150,
                  ),
                  Image(
                    image: AssetImage(""),
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 150,
                  ),
                  Image(
                    image: AssetImage(""),
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /*body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Image(
                    image: AssetImage("Assets/images/aed1.png"),
                  ),
                  ListTile(
                    //leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    leading: Text("1. "),
                    title: Text(
                        "NY Jets are bad.  NY Jets are bad  NY Jets are bad, "),
                  ),
                  ListTile(
                    leading: Text("2. "),
                    title: Text("Weather"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humidity"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),*/
    );
  }
}
