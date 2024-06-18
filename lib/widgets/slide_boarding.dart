import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class SlideBoarding extends StatefulWidget {
  const SlideBoarding({
    super.key,
    required this.show,
    required this.write,
    required this.detail,
  });

  final Pictures show;
  final Pictures write;
  final Pictures detail;

  @override
  State<SlideBoarding> createState() => _SlideBoardingState();
}

class _SlideBoardingState extends State<SlideBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.show.images), fit: BoxFit.cover)),
          ),
        )),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Text(
                  widget.write.content,
                  style: inter,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  widget.detail.text,
                  style: poppins,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
