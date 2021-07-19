

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoicmonk/utilities/quotesbank.dart';
import 'package:stoicmonk/utilities/constants.dart';

class StoicQuotesScreen extends StatefulWidget {
  static String id = "StoicQuotes";
  @override
  _StoicQuotesScreenState createState() => _StoicQuotesScreenState();
}

class _StoicQuotesScreenState extends State<StoicQuotesScreen> {
  QuotesBank quotesBank = QuotesBank();
  String rawQuote;
  String rawAuthorName;
  int quoteNumber = 3;

  //Making a lsit of widgets //TODO this is not used anywhere
  List<Widget> displayQuoteWidgetsList() {
    int quotesListLength = quotesBank.makeStoicQuotesList().length;
    List<Widget> tempList=[];
    for (int j = 0; j < quotesListLength; j++) {
      tempList.add(QuoteAuthorStackedDisplayCard(
        author: quotesBank.makeStoicQuotesList()[j].authorName,
        quote: quotesBank.makeStoicQuotesList()[j].quoteText,
      ),);
      tempList.add(SizedBox(height: 48));
    }
    return tempList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  // title: Text("Stoic Quotes"),
                  elevation: 10,
                  floating: true,
                  backgroundColor: quoteScreenBackgroundColor,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Stoic Quotes", style: TextStyle(fontSize: 32),),
                  ),
                  pinned: true,
                  // snap: true,
                  actionsIconTheme: IconThemeData(opacity: 0.0),

                ),
                // SliverPadding(
                //   padding: new EdgeInsets.all(16.0),
                //   sliver: new SliverList(
                //     delegate: new SliverChildListDelegate([
                //       //Add tabs if needed
                //       // TabBar(
                //       //   labelColor: Colors.black87,
                //       //   unselectedLabelColor: Colors.grey,
                //       //   tabs: [
                //       //     new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                //       //     new Tab(
                //       //         icon: new Icon(Icons.lightbulb_outline),
                //       //         text: "Tab 2"),
                //       //   ],
                //       // ),
                //     ]),
                //   ),
                // ),
              ];
            },
            body: Container(
              color: quoteScreenBackgroundColor,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: quotesBank.makeStoicQuotesList().length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 48,),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: QuoteAuthorStackedDisplayCard(
                      author: quotesBank.makeStoicQuotesList()[index].authorName,
                      quote: quotesBank.makeStoicQuotesList()[index].quoteText,
                    ),
                  );
                  //   ListTile(
                  //   title: Text('item $index', style: TextStyle(color: Colors.white
                  //   ),),
                  // );
                },
              ),
            ),
          ),
        ));
  }
}

//TODO Feature Add a star to the QuoteAuthorStackedDisplayCard so taht people can save their faavourite Quote
//TODO Display the starred quotes iin another Tab