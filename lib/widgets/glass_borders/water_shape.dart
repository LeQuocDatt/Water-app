import 'package:flutter/cupertino.dart';

class GlassOfWater extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1227833, size.height * 0.0919783);
    path_0.cubicTo(
        size.width * 0.1777500,
        size.height * 0.5178173,
        size.width * 0.1832833,
        size.height * 0.5600983,
        size.width * 0.2277833,
        size.height * 0.9682971);
    path_0.cubicTo(
        size.width * 0.4651500,
        size.height * 1.0097161,
        size.width * 0.5182000,
        size.height * 1.0086776,
        size.width * 0.7530667,
        size.height * 0.9684989);
    path_0.cubicTo(
        size.width * 0.8128000,
        size.height * 0.5655753,
        size.width * 0.8178333,
        size.height * 0.5284922,
        size.width * 0.8744667,
        size.height * 0.0919450);
    path_0.cubicTo(
        size.width * 0.5185000,
        size.height * 0.0935776,
        size.width * 0.4827833,
        size.height * 0.0935253,
        size.width * 0.1227833,
        size.height * 0.0919783);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
