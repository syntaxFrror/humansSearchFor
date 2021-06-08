import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
