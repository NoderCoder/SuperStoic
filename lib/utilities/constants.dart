import 'package:flutter/material.dart';
import 'package:stoicmonk/testScreen.dart';

const kPrimaryColor = Color(0xff121F33);
const kLightPrimaryColor = Color(0xffa7a5a3);
const kScaffoldBackgroundColor = Color(0xffF7EBE1);

//Colors for the quots Screen

const Color authorTileColor = Color(0xff4d4b4e);
const Color quoteTileColor = Colors.white;
const Color backgroundColor = Color(0xff000000);
const Color quoteScreenBackgroundColor = Color(0xff1c1c1c);


const lTextStyle = TextStyle(fontSize: 48, fontFamily: "Pacifico");
const rTextStyle =
    TextStyle(fontSize: 50, fontFamily: "Calid", color: Colors.black87);
const featureTileTextStyle =
    TextStyle(fontFamily: "Pacifico", color: Colors.black87, fontSize: 32);

const double tileIconSize = 62.00;



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




const kInputBorder = InputDecoration(
  hintText: 'Enter your email',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
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