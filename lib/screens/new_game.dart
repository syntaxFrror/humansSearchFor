import 'package:flutter/material.dart';
import 'dart:math';
import 'package:things_humans_google/networking.dart';

class NewGame extends StatefulWidget {
  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  List<dynamic> listOfCards;
  bool isAnswersVisable = false;
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
                        listOfCards == null
                            ? 'Loading...'
                            : listOfCards[cardNumber]['search'],
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 120.0),
                  child: Text(
                    'Press here to \nshow results...',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                      color: Color(0x55FFFFFF),
                    ),
                  ),
                ),
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
                      itemCount: listOfCards == null
                          ? 0
                          : listOfCards[cardNumber]['results']?.length,
                      itemBuilder: (context, i) {
                        return Text(
                          listOfCards[cardNumber]['results'][i],
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
