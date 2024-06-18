import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BottomGoal extends StatefulWidget {
  const BottomGoal({super.key});

  @override
  State<BottomGoal> createState() => _BottomGoalState();
}

class _BottomGoalState extends State<BottomGoal> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                  height: 4,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20))),
            ),
            Text('Date & Time',
                style: poppins.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
            const SizedBox(height: 10),
            Text(
              '16 June 2023',
              style: poppins.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              Text(
                                'Goal Preview',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, archiveBoard);
                                  },
                                  child: CircularPercentIndicator(
                                    animation: true,
                                    animationDuration: 2000,
                                    radius: 65,
                                    lineWidth: 10,
                                    percent: change ? 1 : 0.45,
                                    progressColor:
                                        change ? Colors.green : lightBlue,
                                    backgroundColor: Colors.grey.shade200,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    startAngle: 150,
                                    center: Text(change ? '100%' : '67%',
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                  ),
                                ),
                              )
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 10, 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 0.1, color: Colors.grey)),
                                    child: Row(children: [
                                      RichText(
                                          text: TextSpan(
                                              text: 'Athlete\nPerformance\n',
                                              style: poppins.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              children: [
                                            TextSpan(
                                                text: change ? '100%' : '-60%',
                                                style: poppins.copyWith(
                                                    color: change
                                                        ? Colors.green
                                                        : Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ])),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(runningMan)
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 10, 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 0.1, color: Colors.grey)),
                                      child: Row(children: [
                                        RichText(
                                            text: TextSpan(
                                                text:
                                                    'Cognitive\nPerformance\n',
                                                style: poppins.copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                                children: [
                                              TextSpan(
                                                  text:
                                                      change ? '100%' : '-50%',
                                                  style: poppins.copyWith(
                                                      color: change
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16))
                                            ])),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Image.asset(brain)
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30)),
                                shadowColor:
                                    const MaterialStatePropertyAll(shadowBlue),
                                elevation: const MaterialStatePropertyAll(3),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    const MaterialStatePropertyAll(lightBlue)),
                            onPressed: () {
                              setState(() {
                                change = !change;
                              });
                            },
                            child: Text(
                              change ? 'Goal Archive' : 'Goal Not Archive',
                              style: poppins.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      )
                    ],
                  ),
                ))
          ])),
    );
  }
}
