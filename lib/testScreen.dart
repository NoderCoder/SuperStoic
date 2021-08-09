
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stoicmonk/screens/Exercises/stoicjourneyintro.dart';
import 'package:stoicmonk/screens/Quotes/stoicquotes.dart';
import 'package:stoicmonk/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TestScreen extends StatefulWidget {
  static String id = "TestScreen";
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  void initState() {
    super.initState();
    getCurretntUser();
  }

  // Firebase setup
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurretntUser() async {
    try {
    final user = await _auth.currentUser;
    if (user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }}
    catch(e){print(e);}
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Icon(
            Icons.view_sidebar,
            color: Colors.black87,
          ),
        ),
        title: Text(
          "Get help the Stoic way",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        elevation: 0.8,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FeatureTile(
                  featureIcon: FontAwesomeIcons.vihara,
                  gradiantColor1: Colors.redAccent,
                  gradiantColor2: Colors.orangeAccent,
                  title: "Meditate",
                  screenRoute: (){print("Meditate pushed");

                  },
                ),
                SizedBox(
                  height: 16,
                ),
                FeatureTile(
                  featureIcon: FontAwesomeIcons.quoteLeft,
                  gradiantColor1: Colors.greenAccent,
                  gradiantColor2: Colors.yellowAccent,
                  title: "Stoic Quotes",
                  screenRoute: (){Navigator.pushNamed(context, StoicQuotesScreen.id);},
                ),
                SizedBox(
                  height: 16,
                ),
                FeatureTile(
                  featureIcon: FontAwesomeIcons.book,
                  gradiantColor1: Colors.purpleAccent,
                  gradiantColor2: Colors.cyanAccent,
                  title: "Mood Journal",
                  screenRoute: (){print("Mood Journel Pressed");},
                ),
                SizedBox(
                  height: 16,
                ),
                FeatureTile(
                  featureIcon: FontAwesomeIcons.balanceScaleLeft,
                  gradiantColor1: Colors.amberAccent,
                  gradiantColor2: Colors.lightGreenAccent,
                  title: "Stoic Exercises",
                  screenRoute: (){Navigator.pushNamed(context, StoicExercises.id);},
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}

//Feature tile discribing features
class FeatureTile extends StatelessWidget {
  FeatureTile(
      {this.gradiantColor1, this.gradiantColor2, this.featureIcon, this.title, this.screenRoute});

  Color gradiantColor1;
  Color gradiantColor2;
  IconData featureIcon;
  String title;
  Function screenRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: screenRoute,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradiantColor1, gradiantColor2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Icon(
                  featureIcon,
                  size: tileIconSize,
                ),
                SizedBox(
                  width: 32,
                ),
                Text(
                  title,
                  style: featureTileTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
