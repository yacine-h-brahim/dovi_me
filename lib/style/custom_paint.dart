import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * -0.3483239);
    path_0.lineTo(0, size.height * -0.3483239);
    path_0.lineTo(0, size.height * 0.9789859);
    path_0.cubicTo(
        size.width * 0.003634903,
        size.height * 0.9666009,
        size.width * 0.01073415,
        size.height * 0.9552934,
        size.width * 0.02068705,
        size.height * 0.9464155);
    path_0.lineTo(size.width * 0.4496111, size.height * 0.5638310);
    path_0.cubicTo(
        size.width * 0.4773261,
        size.height * 0.5391103,
        size.width * 0.5198961,
        size.height * 0.5391103,
        size.width * 0.5476111,
        size.height * 0.5638310);
    path_0.lineTo(size.width * 0.9765362, size.height * 0.9464155);
    path_0.cubicTo(
        size.width * 0.9914638,
        size.height * 0.9597300,
        size.width * 0.9999710,
        size.height * 0.9785094,
        size.width,
        size.height * 0.9981972);
    path_0.lineTo(size.width, size.height * -0.3483239);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffDDF4D6).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
