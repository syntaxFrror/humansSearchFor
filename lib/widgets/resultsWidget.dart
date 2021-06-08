import 'package:flutter/material.dart';

class ResultsWidget extends StatefulWidget {
  final List listOfCards;
  final int cardNumber;
  ResultsWidget(this.listOfCards, this.cardNumber);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
            itemCount: widget.listOfCards == null
                ? 0
                : widget.listOfCards[widget.cardNumber]['results']?.length,
            itemBuilder: (context, i) {
              return Text(
                widget.listOfCards[widget.cardNumber]['results'][i],
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              );
            }),
      ),
    );
  }
}
