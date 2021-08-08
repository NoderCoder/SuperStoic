import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:stoicmonk/utilities/constants.dart';
import 'package:stoicmonk/utilities/quotesbank.dart';

class StoicExercises extends StatefulWidget {
  static String id = "StoicExercises";
  @override
  _StoicExercisesState createState() => _StoicExercisesState();
}

class _StoicExercisesState extends State<StoicExercises> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [

          Center(
            child: QuoteAuthorStackedDisplayCard(author: "mantra the great !!!",quote: "What a wonderful world",quoteBoxHeight: 200,),
          ),
        ],
      ),
    );
  }
}


