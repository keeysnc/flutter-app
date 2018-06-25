import 'package:flutter/material.dart';
import './quiz_page.dart';

// Create an object for Landing Page
// extends an instance of the statelessWidget object - stateless doesn't change- it's static
class LandingPage extends StatelessWidget{

//override default widget features
 @override 

//build new content and create Material Widget- Blank paper
 Widget build( BuildContext context){
 return new Material(
  color: Colors.greenAccent,
   child: new InkWell(
     onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new QuizPage)),
     child: new Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         new Text('Lets Quiz!', style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
         new Text( 'Tap to Start', style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
       ],
     ),
   ),
   
 );
 }
}