import 'dart:ui' as ui;

import 'package:dummy_template/values/color.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 1.01),
        Offset(size.width * 0.50, size.height * 0.13),
        [bitBlue, Colors.blue.shade50],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1227833, size.height * 0.1309718);
    path_0.cubicTo(
        size.width * 0.1777500,
        size.height * 0.5378667,
        size.width * 0.1832833,
        size.height * 0.5782667,
        size.width * 0.2277833,
        size.height * 0.9683061);
    path_0.cubicTo(
        size.width * 0.4651500,
        size.height * 1.0078825,
        size.width * 0.5182000,
        size.height * 1.0068902,
        size.width * 0.7530667,
        size.height * 0.9684989);
    path_0.cubicTo(
        size.width * 0.8128000,
        size.height * 0.5835000,
        size.width * 0.8178333,
        size.height * 0.5480667,
        size.width * 0.8744667,
        size.height * 0.1309400);
    path_0.cubicTo(
        size.width * 0.8564500,
        size.height * 0.2516500,
        size.width * 0.1374167,
        size.height * 0.2464167,
        size.width * 0.1227833,
        size.height * 0.1309718);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
