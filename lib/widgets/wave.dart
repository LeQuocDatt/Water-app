import 'dart:math' as math;

import 'package:flutter/material.dart';

class Wave extends StatefulWidget {
  final double? value;
  final Color color;
  const Wave({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);
  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3500,
      ),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) => ClipPath(
        clipper: _WaveClipper(
          animationValue: _animationController.value,
          value: widget.value,
          direction: Axis.vertical,
        ),
        child: Container(
          color: widget.color,
        ),
      ),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  final double animationValue;
  final double? value;
  final Axis direction;

  _WaveClipper({
    required this.animationValue,
    required this.value,
    required this.direction,
  });

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addPolygon(_generateVerticalWavePath(size), false)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  List<Offset> _generateVerticalWavePath(Size size) {
    final waveList = <Offset>[];
    for (int i = -2; i <= size.width.toInt() + 2; i++) {
      final waveHeight = (size.height / 10);
      final dy = math.sin((animationValue * 360 - i) % 360 * (math.pi / 180)) *
              waveHeight +
          (size.height - (size.height * value!));
      waveList.add(Offset(i.toDouble(), dy));
    }
    return waveList;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) =>
      animationValue != oldClipper.animationValue;
}
