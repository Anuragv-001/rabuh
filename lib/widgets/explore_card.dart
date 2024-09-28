import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget{
  final String image;
  const ExploreCard(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Image(
        image: NetworkImage(image),
        fit: BoxFit.cover,
      ),
    );
  }

}