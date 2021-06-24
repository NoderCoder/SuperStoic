import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'utilities/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/homescreen.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 60,
                // color: Colors.white,
              ),
              // S Added code ---------------------

              Container(
                height: 500,
                // color: Colors.white24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(child: Text("#STOICHELP", style: rTextStyle)),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    Expanded(
                        child: SizedBox(
                          height: 34,
                          width: 250,
                          child: Container(
                            child: Text(
                          "Daily stoic inspiration to guide you through this ephemeral world.",
                              textAlign: TextAlign.center,
                      )),
                        ),
                    ),

                    // //Rotated text kit
                    // Text(
                    //   "Help with",
                    //   style: lTextStyle,
                    // ),
                    // SizedBox(
                    //   width: 200,
                    //   height: 16,
                    // ),
                    // Container(
                    //   child: DefaultTextStyle(
                    //     style: rTextStyle,
                    //     child: AnimatedTextKit(
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         FadeAnimatedText(
                    //           "ANXIETY",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "DISCIPLINE",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "REGRET",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "CONFIDENCE",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "STABILITY",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "ACCEPTANCE",
                    //           textStyle: rTextStyle,
                    //         ),
                    //         FadeAnimatedText(
                    //           "ENVY",
                    //           textStyle: rTextStyle,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )

              // S Added code ---------------------
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "HomeScreen");
        },
        child: Icon(Icons.arrow_downward), //TODO 1 : change this button to be more conspicuous
        backgroundColor: Colors.black,
      ),
    );
  }
}
