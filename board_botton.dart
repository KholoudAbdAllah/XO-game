// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClick; // this is a callback function
  BoardButton(
      {required this.text, required this.index, required this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            onButtonClick(index);
          },
          child: Text(
            '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
