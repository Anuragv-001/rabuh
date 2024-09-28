import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Heading1(String title, {FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 28,
    ),
  );
}

Widget Heading2(String title, {FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 20,
    ),
  );
}

Widget Heading3(String title, {Color textColor = Colors.black, FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 16,
      color: textColor,
    ),
  );
}

Widget Heading4(String title, {FontWeight fontWeight = FontWeight.w500, Color color = Colors.black, double fontSize = 12}) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),
  );
}

Widget MutedText(String text, {double fontSize = 12, FontWeight weight = FontWeight.w500}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: weight,
      fontSize: fontSize,
      color: Colors.grey,
    ),
  );
}