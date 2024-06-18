import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/wave.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class WaterPercent extends StatelessWidget {
  final double percent;
  const WaterPercent({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LiquidCircularProgressIndicator(
          value: percent,
          valueColor: const AlwaysStoppedAnimation(bitBlue),
          backgroundColor: Colors.white,
          borderColor: lightBlue,
          borderWidth: 7,
          direction: Axis.vertical,
        ),
        ClipPath(
          clipper: const ShapeBorderClipper(shape: CircleBorder()),
          child: Wave(value: percent, color: lightBlue),
        ),
        Positioned(
            child: Text('${(percent * 2000).toStringAsFixed(0)}ml',
                style: poppins.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.blue)))
      ],
    );
  }
}
