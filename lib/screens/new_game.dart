import 'package:flutter/material.dart';
import 'dart:math';
import 'package:things_humans_google/networking.dart';
import 'package:things_humans_google/widgets/hidingAnswersWidget.dart';
import 'package:things_humans_google/widgets/initialSearchWidget.dart';
import 'package:things_humans_google/widgets/resultsWidget.dart';
import 'package:things_humans_google/widgets/searchIconWidget.dart';
import 'package:things_humans_google/constants.dart';

class NewGame extends StatefulWidget {
  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  List<dynamic> listOfCards;
  bool isAnswerVisable = false;
  int cardNumber;

  @override
  void initState() {
    super.initState();
    NetworkHelper().getCardsData().then((value) => updateUI(value));
  }

  void updateUI(dynamic data) {
    setState(() {
      listOfCards = data;
      cardNumber = Random().nextInt(listOfCards.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Things Humans Search For',
          style: TextStyle(color: appBarTextColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cardNumber = Random().nextInt(listOfCards.length);
            isAnswerVisable = false;
          });
        },
        child: Icon(Icons.navigate_next),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: initialSearchColor,
              elevation: 5.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Row(
                children: [
                  InitialSearch(listOfCards, cardNumber),
                  SearchIcon(),
                ],
              ),
            ),
            Visibility(
              visible: !isAnswerVisable,
              child: TextButton(
                child: HidingAnswersWidget(),
                onPressed: () {
                  setState(() {
                    isAnswerVisable = !isAnswerVisable;
                  });
                },
              ),
            ),
            Visibility(
              visible: isAnswerVisable,
              child: ResultsWidget(listOfCards, cardNumber),
            ),
          ],
        ),
      ),
    );
  }
}
