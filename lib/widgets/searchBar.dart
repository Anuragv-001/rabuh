import 'package:flutter/material.dart';

Widget searchBar(TextEditingController searchBarController, {String hintText = "Search", Function(String)? onChanged, Function(String)? onSubmitted, Icon? prefixIcon = const Icon(Icons.search_outlined)}) {
  return TextField(
    textAlignVertical: TextAlignVertical.bottom,
    controller: searchBarController,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    style: TextStyle(
      height: 0.5,
    ),
    cursorHeight: 18,
    onTapOutside: (e) {
      FocusManager.instance.primaryFocus?.unfocus();
    },
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );
}