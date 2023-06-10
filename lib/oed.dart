import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class oedPage extends StatelessWidget {
  const oedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OED"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InteractiveViewer(
              //padding: EdgeInsets.all(20.0),
              maxScale: 4,
              child: ListView(
                children: <Widget>[
                  Image(
                    image: AssetImage(""),
                    //height: MediaQuery.of(context).size.height / 3,
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
    );
  }
}
