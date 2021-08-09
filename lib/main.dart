import 'package:stoicmonk/utilities/constants.dart';

import 'screens/Exercises/stoicjourneyintro.dart';
import 'screens/Homescreen/homescreen.dart';
import 'welcomescreen.dart';
import "testScreen.dart";
import 'screens/Quotes/stoicquotes.dart';
import 'registerationscreen.dart';
import 'loginscreen.dart';
import 'screens/Introduction/introduction_animation_screen.dart';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
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
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        primaryColor: kPrimaryColor,
        primaryColorLight: kLightPrimaryColor,//todo Cosmetic need to change this
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      // home: WelcomeScreen(),


      initialRoute: IntroductionAnimationScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        StoicQuotesScreen.id : (context) => StoicQuotesScreen(),
        StoicExercises.id : (context) => StoicExercises(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        TestScreen.id : (context) => TestScreen(),

        IntroductionAnimationScreen.id : (context) => IntroductionAnimationScreen(),
      },
    );
  }
}

