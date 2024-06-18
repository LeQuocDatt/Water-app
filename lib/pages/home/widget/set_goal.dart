import 'package:dummy_template/pages/home/widget/bottom_water.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class SetGoal extends StatefulWidget {
  const SetGoal({super.key});

  @override
  State<SetGoal> createState() => _SetGoalState();
}

class _SetGoalState extends State<SetGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Stack(alignment: Alignment.topCenter, children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.958,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(backGroundWater, fit: BoxFit.fill)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Row(
                  children: [
                    BackButton(
                        color: lightBlue,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        'Set Your Goal',
                        style: poppins.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 110,
                child: Container(
                  alignment: Alignment.center,
                  height: 90,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: lightBlue, border: Border(right: BorderSide())),
                  child: Image.asset(number8, fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField(
                    hint: Text('Unit: Number of glass ', style: poppins),
                    iconSize: 25,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      setState(() {});
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Unit: Number of glass ',
                        child: Text('Unit: Number of glass '),
                      ),
                      DropdownMenuItem(
                        value: '4',
                        child: Text('4 Glass'),
                      ),
                      DropdownMenuItem(
                        value: '6',
                        child: Text('6 Glass'),
                      ),
                      DropdownMenuItem(
                        value: '8',
                        child: Text('8 Glass'),
                      ),
                      DropdownMenuItem(
                        value: '10',
                        child: Text('10 Glass'),
                      ),
                      DropdownMenuItem(
                        value: '12',
                        child: Text('12 Glass'),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 400,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                          shadowColor:
                              const MaterialStatePropertyAll(shadowBlue),
                          elevation: const MaterialStatePropertyAll(10),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightBlue)),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const BottomWater());
                      },
                      child: Text(
                        'Water Goal',
                        style: poppins.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )))
            ]),
          ]),
        ),
      ),
    );
  }
}
