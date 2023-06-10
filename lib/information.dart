import 'package:e_first_aid/screens/login_screen.dart';

import 'homepage.dart';
import 'package:flutter/material.dart';

class information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Poly(),
    );
  }
}

class Poly extends StatefulWidget {
  @override
  _PolyState createState() => _PolyState();
}

class _PolyState extends State<Poly> {
  List<String> str = [
    "Trip Ativisor Atakan Berk Yılmaz tarafından yapılan bir uygulamadır.",
    "Trip Ativisor bir seyahat uygulamasıdır, uygulamada gittiğiniz şehirdeki önemli yerleri rezervasyon sayesinde gezebilirisinz"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerCodeOnly(),
        appBar: new AppBar(
            title: new Text('Hakkında'),
            backgroundColor: const Color(0xff4098ff)),
        body: ListView(
          padding: EdgeInsets.all(18),
          children: [
            Column(
              children: str.map((strone) {
                return Row(children: [
                  Text(
                    "\u2022",
                    style: TextStyle(fontSize: 22, color: Color(0xff0c3358)),
                  ), //bullet text
                  SizedBox(
                    width: 10,
                  ), //space between bullet and text
                  Expanded(
                    child: Text(
                      strone,
                      style: TextStyle(fontSize: 20),
                    ), //text
                  )
                ]);
              }).toList(),
            ),
          ],
        ));
  }
}
