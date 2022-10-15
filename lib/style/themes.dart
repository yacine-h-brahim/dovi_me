import 'package:flutter/material.dart';

//APP COLORS
const Color lightGreen = Color.fromRGBO(221, 244, 214, 1);
const Color whitich = Color.fromRGBO(238, 238, 238, 1);
const Color blackich = Color.fromRGBO(6, 6, 6, 1);
const Color greenich = Color.fromRGBO(19, 155, 22, 1);
const Color greyich = Color.fromRGBO(170, 170, 170, 1);
const Color grey48 = Color.fromRGBO(238, 238, 238, 0.48);

//COLORS TO USE FOR GRADIENTS
const Color blueDark1 = Color.fromRGBO(0, 12, 64, 1);
const Color blueDark2 = Color.fromRGBO(96, 125, 139, 1);
const Color pink1 = Color.fromRGBO(200, 78, 137, 1);
const Color pink2 = Color.fromRGBO(241, 95, 121, 1);
const Color blue1 = Color.fromRGBO(116, 116, 191, 1);
const Color blue2 = Color.fromRGBO(52, 138, 199, 1);
const Color green1 = Color.fromRGBO(2, 170, 176, 1);
const Color green2 = Color.fromRGBO(0, 205, 172, 1);
const Color lighBlue = Color.fromRGBO(241, 245, 249, 1);

//THEMES
class Themes {
  TextStyle get haycha {
    return const TextStyle(
        fontWeight: FontWeight.w700, fontSize: 50, color: blackich);
  }

  TextStyle get headline0 {
    return const TextStyle(
        fontWeight: FontWeight.w700, fontSize: 32, color: blackich);
  }

  TextStyle get headline1 {
    return const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 20, color: blackich);
  }

  TextStyle get headline2 {
    return const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 17, color: blackich);
  }

  TextStyle get buttonText {
    return const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 20, color: blackich);
  }

  TextStyle get subtitleLableText {
    return const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 14, color: greyich);
  }

  TextStyle get bodyText1 {
    return const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 17, color: blackich);
  }

  TextStyle get bodyText2 {
    return const TextStyle(
        fontWeight: FontWeight.w500, fontSize: 14, color: blackich);
  }
}
