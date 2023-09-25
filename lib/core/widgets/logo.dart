import 'package:flutter/material.dart';

class Logo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 280,
          margin: const EdgeInsets.only( top: 300 ),

          child: Column(children: const <Widget>[
            Image(image: AssetImage('assets/images/splash_logo.png')),
            SizedBox(height: 0),
          ])),
    );
  }
}