import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_template/pages/home/widget/water_percent.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/wave.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final double _percentGoal = 0.5;
  late AnimationController animationController;
  final user = FirebaseAuth.instance.currentUser!.email;
  final users = FirebaseFirestore.instance
      .collection('users')
      .doc('first name')
      .get()
      .then((value) => value.data());
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          style: poppins.copyWith(color: Colors.grey),
                          text: DateTime.now().hour >= 5 &&
                                  DateTime.now().hour < 12
                              ? 'Good Morning,\n'
                              : DateTime.now().hour >= 12 &&
                                      DateTime.now().hour < 18
                                  ? 'Good Afternoon\n'
                                  : 'Good Evening\n',
                          children: [
                        TextSpan(
                            text: user, style: poppins.copyWith(fontSize: 20))
                      ])),
                  Badge(
                    largeSize: 15,
                    backgroundColor: Colors.red,
                    label: const Text('  '),
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(bell),
                        )),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(clipBehavior: Clip.none, children: [
                  LiquidLinearProgressIndicator(
                    borderWidth: 0.1,
                    borderColor: Colors.white,
                    value: animationController.value,
                    valueColor: const AlwaysStoppedAnimation(bitBlue),
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    direction: Axis.vertical,
                  ),
                  ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Wave(
                      value: animationController.value,
                      color: lightBlue,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: DateFormat.jm().format(DateTime.now()),
                                style: poppins.copyWith(fontSize: 20),
                                children: [
                              TextSpan(
                                  text: '\n200ml water(2 Glass)',
                                  style: poppins.copyWith(color: Colors.grey))
                            ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 25)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {
                                Navigator.pushNamed(context, setGoal);
                              },
                              child: Text(
                                'Add Your Goal',
                                style: poppins,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 42, right: 30, child: Image.asset(glassOfWater)),
                  Positioned(
                      bottom: 20, right: 0, child: Image.asset(dropWater))
                ]),
              ),
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
                  child: Stack(clipBehavior: Clip.none, children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: WaterPercent(
                          percent: _percentGoal,
                        )),
                    Positioned(
                      left: 145,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 0.1,
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              children: [
                                Row(children: [
                                  Text(
                                    '9:30 AM',
                                    style: poppins.copyWith(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: lightBlue),
                                      height: 4.5,
                                      width: 50,
                                    ),
                                  )
                                ]),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(soup),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          '100ml',
                                          style: poppins,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 65),
                                        child: Text(
                                          '5%',
                                          style: poppins.copyWith(
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.36,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text('Target',
                                      style: poppins.copyWith(
                                          fontSize: 12, color: Colors.grey)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text('2000ml',
                                      style: poppins.copyWith(fontSize: 16)),
                                )
                              ]),
                          IconButton(onPressed: () {}, icon: Image.asset(edit))
                        ]),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 30, 90, 80),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, dashBoard);
                      },
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40)),
                          elevation: const MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightBlue)),
                      child: Text(
                        'Go To Dashboard',
                        style: poppins.copyWith(color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'You got ${(_percentGoal * 100).toStringAsFixed(0)}% of today’s goal, keep focus on your health!',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 12, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


