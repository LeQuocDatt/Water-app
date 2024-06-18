import 'package:flutter/cupertino.dart';

class HeartShape2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..moveTo(55, 25)
      ..cubicTo(55, 40, 50, 0, 25, 7)
      ..cubicTo(7, 12, 7, 40, 9, 25)
      ..cubicTo(0, 55, 30, 73, 55, 88)
      ..cubicTo(80, 73, 105, 55, 103, 33)
      ..cubicTo(103.5, 33, 100, 0, 73, 8)
      ..cubicTo(65, 10, 55, 25, 55, 29)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
