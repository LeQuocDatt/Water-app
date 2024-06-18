import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class SuccessLogin extends StatefulWidget {
  const SuccessLogin({super.key});

  @override
  State<SuccessLogin> createState() => _SuccessLoginState();
}

class _SuccessLoginState extends State<SuccessLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(complete),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'You are Verified\n',
                  style: poppins.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22),
                  children: [
                    TextSpan(
                        text:
                            'Congratulations to you. You are now Verified!\nKindly proceed to log in',
                        style: poppins.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal))
                  ])),
        ),
        ElevatedButton(
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 135, vertical: 17)),
                elevation: const MaterialStatePropertyAll(7),
                backgroundColor: const MaterialStatePropertyAll(lightBlue),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () {
              Navigator.pushNamed(context, setupInfo);
            },
            child: Text(
              'Continue',
              style: poppins.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ])),
    );
  }
}
