import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';

//rendering full body of app
void main() {

  //run app pages using Material App instance
    runApp(new MaterialApp(
      home: new LandingPage(),
  ));
}




