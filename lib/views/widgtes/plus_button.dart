import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';

Widget plusButton(BuildContext context, Widget page) => InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: lightGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.add,
            size: 30,
            color: blackich,
          )),
    );
