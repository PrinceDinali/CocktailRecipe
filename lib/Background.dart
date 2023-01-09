import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 62, 18, 70),
            Colors.black
          ],
          begin: Alignment.topLeft,
          end: Alignment.center
          )
        ),
      );
  }
}