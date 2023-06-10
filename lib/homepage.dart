import 'package:e_first_aid/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(
              icon: Icons.home,
            text: "",
          ),
          GButton(
              icon: Icons.favorite_border,
            text: "",
          ),
          GButton(
              icon: Icons.search,
                  text: "",
          ),
          GButton(
              icon: Icons.settings,
            text: "",
          ),
        ]
      ),
    );
  }
}