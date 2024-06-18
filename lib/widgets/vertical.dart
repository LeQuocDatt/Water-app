import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/widgets/vertical_bar.dart';
import 'package:flutter/material.dart';

class Vertical extends StatefulWidget {
  const Vertical({
    super.key,
    required this.percentSlide,
  });
  final Verticals percentSlide;

  @override
  State<Vertical> createState() => _VerticalState();
}

class _VerticalState extends State<Vertical> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: VerticalBar(
          backGroundColor: bitBlue,
          color: lightBlue,
          width: 7,
          circularRadius: 5,
          animationDuration: const Duration(milliseconds: 3500),
          percent: widget.percentSlide.percent),
    );
  }
}
