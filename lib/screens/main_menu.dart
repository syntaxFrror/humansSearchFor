import 'package:flutter/material.dart';
import 'package:things_humans_google/cardsData.dart';
import 'dart:math';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int cardNumber = Random().nextInt(listOfCards.length);
  bool isAnswersVisable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cardNumber = Random().nextInt(listOfCards.length);
            isAnswersVisable = false;
            print(cardNumber);
          });
        },
        child: Icon(Icons.navigate_next),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Things Humans Search For',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: Colors.grey[400],
              elevation: 5.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        listOfCards[cardNumber].initialSearch,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff212121),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                    color: Color(0xffFFC107),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.search,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !isAnswersVisable,
              child: FlatButton(
                child: Text('SHOW RESULTS'),
                onPressed: () {
                  setState(() {
                    isAnswersVisable = !isAnswersVisable;
                  });
                },
              ),
            ),
            Visibility(
              visible: isAnswersVisable,
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          listOfCards[cardNumber].mostPopularSearches.length,
                      itemBuilder: (context, i) {
                        return Text(
                          listOfCards[cardNumber].mostPopularSearches[i],
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
