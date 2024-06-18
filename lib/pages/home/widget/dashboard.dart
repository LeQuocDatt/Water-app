import 'package:dummy_template/pages/home/widget/bottom_goal.dart';
import 'package:dummy_template/pages/home/widget/level_of_water.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/glass_borders/body_glass.dart';
import 'package:dummy_template/widgets/glass_borders/mount_glass.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backGroundWater), fit: BoxFit.fill)),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(children: [
                  BackButton(
                    color: lightBlue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Drink Water Glass',
                      style: poppins.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -38,
                        right: 45,
                        child: CustomPaint(
                          size: Size(140, (242 * 1).toDouble()),
                          painter: RPSCustomPainter(),
                        ),
                      ),
                      Positioned(
                        top: -38,
                        right: 45,
                        child: CustomPaint(
                          size: Size(140, (242 * 1).toDouble()),
                          painter: RPSCustomPainter2(),
                        ),
                      ),
                      const LevelOfWater(glass: 10)
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                        shadowColor: const MaterialStatePropertyAll(shadowBlue),
                        elevation: const MaterialStatePropertyAll(10),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            const MaterialStatePropertyAll(lightBlue)),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const BottomGoal());
                    },
                    child: Text(
                      'Goal Archive',
                      style: poppins.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              )
            ],
          ))),
    );
  }
}
