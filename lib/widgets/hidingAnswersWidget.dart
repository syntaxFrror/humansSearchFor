import 'package:flutter/material.dart';

class HidingAnswersWidget extends StatefulWidget {
  @override
  _HidingAnswersWidgetState createState() => _HidingAnswersWidgetState();
}

class _HidingAnswersWidgetState extends State<HidingAnswersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0, bottom: 120.0),
      child: Text(
        'Tap here to \nshow results...',
        style: TextStyle(
          fontSize: 24.0,
          fontStyle: FontStyle.italic,
          color: Color(0x55FFFFFF),
        ),
      ),
    );
  }
}
