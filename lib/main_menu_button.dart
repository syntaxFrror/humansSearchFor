import 'package:flutter/material.dart';

class ButtonMainMenu extends StatelessWidget {
  final String buttonName;
  final Function onPressed;

  ButtonMainMenu({@required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        buttonName,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        height: 80.0,
        width: 200.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      fillColor: Color(0xffFFC107),
    );
  }
}
