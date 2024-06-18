import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/glass_borders/water_shape.dart';
import 'package:dummy_template/widgets/wave.dart';
import 'package:flutter/material.dart';

class LevelOfWater extends StatefulWidget {
  const LevelOfWater({super.key, required this.glass});
  final double glass;

  @override
  State<LevelOfWater> createState() => _LevelOfWaterState();
}

class _LevelOfWaterState extends State<LevelOfWater> {
  double _height = 0;
  @override
  void initState() {
    super.initState();
    {
      Future(() => setState(
            () {
              _height = widget.glass * 20;
            },
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final glass = _height / 20;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          alignment: Alignment.topCenter,
          height: _height,
          width: 100,
          duration: const Duration(seconds: 3),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '${glass.toStringAsFixed(1)} Glass\nWater',
              style:
                  poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const Icon(Icons.arrow_forward)
          ]),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: 200,
          width: 46.5,
          child: SingleChildScrollView(
            child: Column(
                children: List.generate(
                    10,
                    (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${10 - (index * 1)}'),
                            Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: AnimatedContainer(
            height: _height,
            width: 120,
            duration: const Duration(seconds: 3),
            child: ClipPath(
              clipper: GlassOfWater(),
              child: const Wave(value: 0.9, color: lightBlue),
            ),
          ),
        )
      ],
    );
  }
}
