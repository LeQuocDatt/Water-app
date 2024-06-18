import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/heart_shape/heart_electric.dart';
import 'package:dummy_template/widgets/heart_shape/heart_shape_inside.dart';
import 'package:dummy_template/widgets/heart_shape/heart_shape_outside.dart';
import 'package:dummy_template/widgets/vertical.dart';
import 'package:dummy_template/widgets/wave.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  TimeOfDay timeOfDay = const TimeOfDay(hour: 8, minute: 00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('For Today',
                            style: poppins.copyWith(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                      ),
                      Expanded(
                          child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.bottomCenter,
                              children: [
                                LiquidLinearProgressIndicator(
                                    borderColor: Colors.black,
                                    borderWidth: 0.1,
                                    borderRadius: 20,
                                    value: 0.25,
                                    direction: Axis.vertical,
                                    valueColor:
                                        const AlwaysStoppedAnimation(bitBlue)),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: verticalSlide.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Vertical(
                                          percentSlide: verticalSlide[index]);
                                    },
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 20,
                                  child: Text('Water',
                                      style: poppins.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900)),
                                ),
                                const Divider(
                                  height: 173,
                                  indent: 15,
                                  endIndent: 15,
                                  color: sweetBlue,
                                ),
                                ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: const Wave(
                                        value: 0.17, color: lightBlue)),
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: RichText(
                                      text: TextSpan(
                                          text: '2.1 ',
                                          style: poppins.copyWith(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                          children: [
                                        TextSpan(
                                            text: 'liters',
                                            style: poppins.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal))
                                      ])),
                                )
                              ]),
                        ),
                      )),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Calories',
                                  style: poppins.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    '510.43',
                                    style: poppins.copyWith(
                                        fontSize: 25, color: lightBlue),
                                  ),
                                ),
                                Text(
                                  'Kcol',
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sleep',
                                    style: poppins.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) => setState(() {
                                              timeOfDay = value!;
                                            }));
                                      },
                                      child: SizedBox(
                                        child: Text(
                                          timeOfDay.format(context).toString(),
                                          style: poppins.copyWith(
                                              fontSize: 25, color: lightBlue),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'hours',
                                    style: poppins.copyWith(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.316,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned(
                            bottom: 50,
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 3500,
                              radius: 65,
                              lineWidth: 10,
                              percent: 0.45,
                              progressColor: lightBlue,
                              backgroundColor: bitBlue,
                              circularStrokeCap: CircularStrokeCap.round,
                              startAngle: 150,
                              center: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: '2628\n',
                                      style: poppins.copyWith(
                                          fontSize: 25,
                                          color: lightBlue,
                                          fontWeight: FontWeight.w900),
                                      children: [
                                        TextSpan(
                                            text: 'Steps\nCompleted',
                                            style:
                                                poppins.copyWith(fontSize: 12)),
                                      ])),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 20,
                            child: Text('Walk',
                                style: poppins.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w900)),
                          )
                        ]),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 90, 20, 100),
                              child: ClipPath(
                                  clipper: HeartShape(),
                                  child: Container(color: Colors.red)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 90, 20, 100),
                              child: ClipPath(
                                clipper: HeartShape2(),
                                child: Container(color: Colors.white),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              right: 15,
                              top: 30,
                              bottom: 90,
                              child: Lottie.network(
                                  'https://lottie.host/3cfc3832-3077-48f7-8ccb-d953a3042149/jG5Q4UAORf.json'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 130),
                              child: ClipPath(
                                clipper: const ShapeBorderClipper(
                                    shape: RoundedRectangleBorder()),
                                child: CustomPaint(
                                  size: Size(
                                      300,
                                      (300 * 0.5)
                                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                  painter: RPSCustomPainter(),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                'Heart',
                                style: poppins.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 45,
                              child: Text('105',
                                  style: poppins.copyWith(
                                      fontSize: 25, color: lightBlue)),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 20,
                              child: Text('bpm',
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.bold)),
                            )
                          ]),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
