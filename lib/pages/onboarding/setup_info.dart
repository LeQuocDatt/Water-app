import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class SetupInfo extends StatefulWidget {
  const SetupInfo({super.key});

  @override
  State<SetupInfo> createState() => _SetupInfoState();
}

class _SetupInfoState extends State<SetupInfo> {
  bool checkMale = false;
  bool checkFemale = false;
  bool checkNoneSex = false;
  void check(String gender) {
    setState(() {
      checkMale = false;
      checkFemale = false;
      checkNoneSex = false;
      switch (gender) {
        case 'Male':
          checkMale = true;
          break;
        case 'Female':
          checkFemale = true;
          break;
        case 'NoneSex':
          checkNoneSex = true;
          break;
      }
    });
  }

  int currentHour = 0;
  int currentHour1 = 0;
  int currentMinute = 0;
  int currentMinute1 = 0;

  bool container = false;
  bool container1 = true;

  double currentSlider = 0;
  double currentSlider1 = 0;
  double currentSlider2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                BackButton(
                  color: lightBlue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Select your age, weight,\ngender and height',
                    style: poppins.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'What is your gender',
              style: poppins.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    check('Male');
                  },
                  child: checkMale
                      ? Badge(
                          backgroundColor: Colors.green,
                          label: const Icon(Icons.check, color: Colors.white),
                          largeSize: 32,
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                                color: bitGrey,
                                shape: BoxShape.circle,
                                border: Border.all(color: lightBlue),
                                image: const DecorationImage(
                                    image: AssetImage(male))),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: BoxDecoration(
                              color: bitGrey,
                              shape: BoxShape.circle,
                              border: Border.all(color: lightBlue),
                              image: const DecorationImage(
                                  image: AssetImage(male))),
                        ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    check('Female');
                  },
                  child: checkFemale
                      ? Badge(
                          backgroundColor: Colors.green,
                          label: const Icon(Icons.check, color: Colors.white),
                          largeSize: 32,
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                                color: bitGrey,
                                shape: BoxShape.circle,
                                border: Border.all(color: lightBlue),
                                image: const DecorationImage(
                                    image: AssetImage(female))),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: BoxDecoration(
                              color: bitGrey,
                              shape: BoxShape.circle,
                              border: Border.all(color: lightBlue),
                              image: const DecorationImage(
                                  image: AssetImage(female))),
                        ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    check('NoneSex');
                  },
                  child: checkNoneSex
                      ? Badge(
                          backgroundColor: Colors.green,
                          label: const Icon(Icons.check, color: Colors.white),
                          largeSize: 32,
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                                color: bitGrey,
                                shape: BoxShape.circle,
                                border: Border.all(color: lightBlue),
                                image: const DecorationImage(
                                    image: AssetImage(noneSex))),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: BoxDecoration(
                              color: bitGrey,
                              shape: BoxShape.circle,
                              border: Border.all(color: lightBlue),
                              image: const DecorationImage(
                                  image: AssetImage(noneSex))),
                        ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'How old are you',
              style: poppins.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(children: [
              SliderTheme(
                data: SliderThemeData(
                    thumbShape: SliderComponentShape.noOverlay,
                    valueIndicatorShape: SliderComponentShape.noOverlay),
                child: Slider(
                  activeColor: lightBlue,
                  divisions: 100,
                  min: 0,
                  max: 100,
                  value: currentSlider,
                  onChanged: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 22, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0', style: poppins),
                    Text('100', style: poppins),
                  ],
                ),
              ),
              Positioned(
                  top: 10,
                  left: (currentSlider + 3.3) * 3.33,
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.fromDirection(1),
                              blurRadius: 1,
                              color: Colors.grey)
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.1, color: Colors.grey)),
                    child: Text(currentSlider.toStringAsFixed(0)),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: RichText(
                text: TextSpan(
                    text: 'What is your weight ',
                    style: poppins.copyWith(fontSize: 16),
                    children: [
                  TextSpan(
                      text: '(in kg)',
                      style: poppins.copyWith(fontSize: 10, color: Colors.grey))
                ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(children: [
              SliderTheme(
                data: SliderThemeData(
                    thumbShape: SliderComponentShape.noOverlay,
                    valueIndicatorShape: SliderComponentShape.noOverlay),
                child: Slider(
                  activeColor: lightBlue,
                  divisions: 200,
                  min: 0,
                  max: 200,
                  value: currentSlider1,
                  onChanged: (value) {
                    setState(() {
                      currentSlider1 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 22, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0', style: poppins),
                    Text('200', style: poppins)
                  ],
                ),
              ),
              Positioned(
                  top: 10,
                  left: ((currentSlider1 + 7) * 3.33) / 2,
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.fromDirection(1),
                              blurRadius: 1,
                              color: Colors.grey)
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.1, color: Colors.grey)),
                    child: Text(currentSlider1.toStringAsFixed(0)),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: RichText(
                text: TextSpan(
                    text: 'What is your height ',
                    style: poppins.copyWith(fontSize: 16),
                    children: [
                  TextSpan(
                      text: '(in cm)',
                      style: poppins.copyWith(fontSize: 10, color: Colors.grey))
                ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(children: [
              SliderTheme(
                data: SliderThemeData(
                    thumbShape: SliderComponentShape.noOverlay,
                    valueIndicatorShape: SliderComponentShape.noOverlay),
                child: Slider(
                  activeColor: lightBlue,
                  divisions: 200,
                  min: 0,
                  max: 200,
                  value: currentSlider2,
                  onChanged: (value) {
                    setState(() {
                      currentSlider2 = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 22, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0', style: poppins),
                    Text('200', style: poppins)
                  ],
                ),
              ),
              Positioned(
                  top: 10,
                  left: ((currentSlider2 + 7) * 3.33) / 2,
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.fromDirection(1),
                              blurRadius: 1,
                              color: Colors.grey)
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.1, color: Colors.grey)),
                    child: Text(currentSlider2.toStringAsFixed(0)),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Wake up time',
              style: poppins.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              children: [
                Container(
                  height: 43,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 43,
                        width: 36,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentHour = value;
                          }),
                          physics: const FixedExtentScrollPhysics(),
                          itemExtent: 23,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: (context, index) => container
                                ? Text(
                                    index < 9
                                        ? '0${index + 1}'
                                        : (index + 1).toString(),
                                    style: poppins.copyWith(
                                        fontSize: 22,
                                        color: currentHour == index
                                            ? Colors.black
                                            : Colors.grey))
                                : Text(
                                    index < 10 ? '0$index' : index.toString(),
                                    style: poppins.copyWith(
                                        fontSize: 22,
                                        color: currentHour == index
                                            ? Colors.black
                                            : Colors.grey)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(':', style: poppins.copyWith(fontSize: 22)),
                      ),
                      SizedBox(
                        height: 45,
                        width: 39,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentMinute = value;
                          }),
                          physics: const FixedExtentScrollPhysics(),
                          itemExtent: 23,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) => Text(
                                index < 10 ? '0$index' : index.toString(),
                                style: poppins.copyWith(
                                    fontSize: 22,
                                    color: currentMinute == index
                                        ? Colors.black
                                        : Colors.grey)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        container = !container;
                      });
                    },
                    child: Stack(children: [
                      AnimatedContainer(
                        alignment: container
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        height: 43,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                              alignment: Alignment.center,
                              height: 38,
                              width: 39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: lightBlue),
                                  color: lightGrey),
                              child: Text(container ? 'PM' : 'AM',
                                  style: poppins.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      AnimatedPositioned(
                          top: 10,
                          right: container ? 47 : 10,
                          duration: const Duration(milliseconds: 200),
                          child: Text('Off',
                              style: poppins.copyWith(fontSize: 15)))
                    ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Sleeping time',
              style: poppins.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              children: [
                Container(
                  height: 43,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 43,
                        width: 36,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentHour1 = value;
                          }),
                          physics: const FixedExtentScrollPhysics(),
                          itemExtent: 23,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: (context, index) => container1
                                ? Text(
                                    index < 9
                                        ? '0${index + 1}'
                                        : (index + 1).toString(),
                                    style: poppins.copyWith(
                                        fontSize: 22,
                                        color: currentHour1 == index
                                            ? Colors.black
                                            : Colors.grey))
                                : Text(
                                    index < 10 ? '0$index' : index.toString(),
                                    style: poppins.copyWith(
                                        fontSize: 22,
                                        color: currentHour1 == index
                                            ? Colors.black
                                            : Colors.grey)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(':', style: poppins.copyWith(fontSize: 22)),
                      ),
                      SizedBox(
                        height: 45,
                        width: 39,
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) => setState(() {
                            currentMinute1 = value;
                          }),
                          physics: const FixedExtentScrollPhysics(),
                          itemExtent: 23,
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) => Text(
                                index < 10 ? '0$index' : index.toString(),
                                style: poppins.copyWith(
                                    fontSize: 22,
                                    color: currentMinute1 == index
                                        ? Colors.black
                                        : Colors.grey)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        container1 = !container1;
                      });
                    },
                    child: Stack(children: [
                      AnimatedContainer(
                        alignment: container1
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        height: 43,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                              alignment: Alignment.center,
                              height: 38,
                              width: 39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: lightBlue),
                                  color: lightGrey),
                              child: Text(container1 ? 'PM' : 'AM',
                                  style: poppins.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      AnimatedPositioned(
                          top: 10,
                          right: container1 ? 47 : 10,
                          duration: const Duration(milliseconds: 200),
                          child: Text('Off',
                              style: poppins.copyWith(fontSize: 15)))
                    ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined,
                      color: lightBlue.withOpacity(0.53)),
                  label: Text('Skip',
                      style: poppins.copyWith(
                          color: lightBlue.withOpacity(0.53), fontSize: 17)),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, tabMenu);
                  },
                  icon: Text('Next',
                      style: poppins.copyWith(color: lightBlue, fontSize: 17)),
                  label: const Icon(Icons.arrow_forward, color: lightBlue),
                )
              ],
            ),
          )
        ],
      )),
    ));
  }
}
