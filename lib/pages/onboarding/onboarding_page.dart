import 'dart:async';

import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:dummy_template/widgets/slide_boarding.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final selectIndex = ValueNotifier(0);
  PageController pageController = PageController(
    initialPage: 0,
  );
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (selectIndex.value == picture.length - 1) {
          selectIndex.value = 0;
        } else {
          selectIndex.value = selectIndex.value + 1;
        }
        pageController.animateToPage(
          selectIndex.value,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      selectIndex.value = value;
                    },
                    itemCount: picture.length,
                    itemBuilder: (context, index) {
                      return SlideBoarding(
                        detail: picture[index],
                        show: picture[index],
                        write: picture[index],
                      );
                    },
                  ),
                  Positioned(
                    bottom: 190,
                    child: Column(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: selectIndex,
                          builder: (context, value, child) {
                            return Row(
                              children: List<Widget>.generate(
                                picture.length,
                                (indexSlide) => AnimatedContainer(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  width: 25,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: indexSlide == value
                                          ? lightBlue
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8)),
                                  duration: const Duration(milliseconds: 350),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 50,
                      child: ValueListenableBuilder(
                        valueListenable: selectIndex,
                        builder: (context, value, child) {
                          if (value == picture.length - 3) {
                            return const Text('');
                          }
                          return BackButton(
                            style: const ButtonStyle(
                                iconSize: MaterialStatePropertyAll(40)),
                            color: lightBlue,
                            onPressed: () {
                              final backPage = selectIndex.value - 1;
                              pageController.animateToPage(backPage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                          );
                        },
                      )),
                  Positioned(
                    bottom: 40,
                    child: ValueListenableBuilder(
                      valueListenable: selectIndex,
                      builder: (context, value, child) {
                        if (value == picture.length - 1) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, auth);
                            },
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    const MaterialStatePropertyAll(lightBlue)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Center(
                                    child: Text('GET STARTED',
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              ),
                            ),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () {
                            final nextPage = selectIndex.value + 1;
                            pageController.animateToPage(nextPage,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  const MaterialStatePropertyAll(lightBlue)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Center(
                                  child: Text('NEXT',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
