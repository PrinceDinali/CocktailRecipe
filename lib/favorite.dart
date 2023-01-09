import 'package:flutter/material.dart';
import 'Background.dart';

class faves extends StatefulWidget {
  const faves({super.key});

  @override
  State<faves> createState() => _favesState();
}

class _favesState extends State<faves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(),
        Column(children: [
          Text("Favorites",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),)
        ],)
      ],)
    );
  }
}