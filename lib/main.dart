import 'screens/Exercises/stoicexercises.dart';
import 'welcomescreen.dart';
import "homescreen.dart";
import 'screens/Quotes/stoicquotes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StoicHelp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, //todo Cosmetic need to change this
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      // home: WelcomeScreen(),


      initialRoute: 'WelcomeScreen',
      routes: {
        'WelcomeScreen': (context) => WelcomeScreen(),
        'HomeScreen' : (context) => HomeScreen(),
        'StoicQuotes' : (context) => StoicQuotesScreen(),
        'StoicExercises' : (context) => StoicExercises(),


      },
    );
  }
}

