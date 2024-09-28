import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget softButton({Widget child = const SizedBox.shrink(), Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    ),
  );
}
