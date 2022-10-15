import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
        padding: const EdgeInsets.only(left: 8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: lightGreen, borderRadius: BorderRadius.circular(12)),
        child: const Center(child: Icon(Icons.arrow_back_ios))),
  );
}
