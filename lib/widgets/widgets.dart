import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
      text: TextSpan(style: TextStyle(fontSize: 26.0), children: [
    TextSpan(
        text: 'Quiz',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        )),
    TextSpan(
        text: "Maker",
        style: TextStyle(
          color: Colors.blue,
        ))
  ]));
}

Widget blueButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18.0),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(label, style: TextStyle(color: Colors.white, fontSize: 19.0)),
  );
}
