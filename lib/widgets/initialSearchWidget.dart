import 'package:flutter/material.dart';

class InitialSearch extends StatefulWidget {
  final listOfCards;
  final cardNumber;
  InitialSearch(this.listOfCards, this.cardNumber);

  @override
  _InitialSearchState createState() => _InitialSearchState();
}

class _InitialSearchState extends State<InitialSearch> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          widget.listOfCards == null
              ? 'Loading...'
              : widget.listOfCards[widget.cardNumber]['search'],
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff212121), //boja
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
