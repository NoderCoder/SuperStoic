import 'screens/Exercises/stoicexercises.dart';
import 'welcomescreen.dart';
import "homescreen.dart";
import 'screens/Quotes/stoicquotes.dart';
import 'package:flutter/material.dart';
import 'registerationscreen.dart';
import 'loginscreen.dart';
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


      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        StoicQuotesScreen.id : (context) => StoicQuotesScreen(),
        StoicExercises.id : (context) => StoicExercises(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
      },
    );
  }
}

