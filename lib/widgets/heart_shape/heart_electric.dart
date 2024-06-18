import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
// Layer 1

    Paint paint = Paint()
      ..color = const Color.fromRGBO(145, 216, 246, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint.shader = ui.Gradient.linear(
        Offset(size.width * 0.54, size.height * 0.28),
        Offset(size.width * 0.54, size.height * 1.10),
        [const Color(0xff91d8e9), const Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0, size.height * 0.5);
    path_0.lineTo(size.width * 0.18, size.height * 0.5);
    path_0.lineTo(size.width * 0.25, size.height * 0.38);
    path_0.lineTo(size.width * 0.38, size.height * 0.54);
    path_0.lineTo(size.width * 0.5, size.height * 0.4);
    path_0.lineTo(size.width * 0.57, size.height * 0.5);
    path_0.lineTo(size.width * 0.74, size.height * 0.33);
    path_0.lineTo(size.width * 0.8, size.height * 0.49);
    path_0.lineTo(size.width * 0.87, size.height * 0.45);
    path_0.lineTo(size.width * 0.9, size.height * 0.5);
    path_0.quadraticBezierTo(size.width * 0.9263313, size.height * 0.5002417,
        size.width * 0.9992750, size.height * 0.5014333);
    path_0.quadraticBezierTo(size.width * 0.9994563, size.height * 0.6256583,
        size.width * 1.1400000, size.height * 1.0863333);
    path_0.lineTo(size.width * -0.0586750, size.height * 1.0987500);

    canvas.drawPath(path_0, paint);

// Layer 1

    Paint paintStroke = Paint()
      ..color = const Color.fromRGBO(94, 204, 252, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.013
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.bevel;

    canvas.drawPath(path_0, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
