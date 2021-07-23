import 'package:flutter/material.dart';
import 'package:stoicmonk/homescreen.dart';

const lTextStyle = TextStyle(fontSize: 48, fontFamily: "Pacifico");
const rTextStyle =
    TextStyle(fontSize: 50, fontFamily: "Calid", color: Colors.black87);
const featureTileTextStyle =
    TextStyle(fontFamily: "Pacifico", color: Colors.black87, fontSize: 32);

const double tileIconSize = 62.00;

//Colors for the quots Screen

const Color authorTileColor = Color(0xff4d4b4e);
const Color quoteTileColor = Colors.white;
const Color backgroundColor = Color(0xff000000);
const Color quoteScreenBackgroundColor = Color(0xff1c1c1c);


const quoteTextStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Spartan MB",
  color: Colors.black87,
);
const authorTextStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Possum",
  color: Color(0xffd4af37),
);

const bottomRightElevatedBoxShadow = BoxShadow(
  color: Colors.grey,
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 3), // changes position of shadow
);

// ---------------------WIDGETS---------------------------------
class QuoteAuthorStackedDisplayCard extends StatelessWidget {
  QuoteAuthorStackedDisplayCard({this.author, this.quote, this.quoteBoxHeight});

  double quoteBoxHeight = 150;
  String quote;
  String author;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: quoteBoxHeight,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              color: quoteTileColor,
              borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 48),
                child: Text(
            quote,
            textAlign: TextAlign.center,
            style: quoteTextStyle,
          ),
              )),
        ),
        Positioned(
          bottom: -16,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.clear,
                color: authorTileColor,
                borderRadius: BorderRadius.circular(48),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            height: 48,
            width: 200,
            child: Center(
                child: Text(
              author,
              style: authorTextStyle,
            )),
          ),
        ),
      ],
    );
  }
}
//-----------------------------------------------------------
//------------Password validator----------------------------