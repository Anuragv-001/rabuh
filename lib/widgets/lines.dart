import 'package:flutter/material.dart';

Widget line(double width, {Color color = Colors.grey}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: width,
        color: color,
      ),
    ),
  );
}


Widget lineWithLength(double width, double length, {Color color = Colors.grey}) {
  return Container(
    width: length,
    decoration: BoxDecoration(
      border: Border.all(
        width: width,
        color: color,
      ),
    ),
  );
}