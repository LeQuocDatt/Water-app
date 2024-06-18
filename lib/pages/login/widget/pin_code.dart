import 'dart:async';

import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinCode extends StatefulWidget {
  const PinCode({super.key});

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  String verificationIDReceived = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  void verifyPhoneNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: '+84 769 693 590',
        verificationCompleted: (PhoneAuthCredential credential) {
          auth
              .signInWithCredential(credential)
              .then((value) => print('object'));
        },
        verificationFailed: (FirebaseException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            verificationIDReceived = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  int sec = 60;

  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec > 0) {
        setState(() {
          sec--;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: IconButton(
                color: Colors.white,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(lightBlue),
                    shape: MaterialStatePropertyAll(CircleBorder())),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
              child: RichText(
                  text: TextSpan(
                      text: 'Verification Code\n',
                      style: poppins.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 22),
                      children: [
                    TextSpan(
                        text:
                            'We sent you a 4 digit code to your email\naddress. please check & enter your code',
                        style: poppins.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal))
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 70,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(7)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: lightBlue)),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      style: poppins.copyWith(
                        color: lightBlue,
                        fontSize: 36,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 340, bottom: 30),
              child: Text('$sec'),
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 150, vertical: 17)),
                      elevation: const MaterialStatePropertyAll(7),
                      backgroundColor:
                          const MaterialStatePropertyAll(lightBlue),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    verifyPhoneNumber();
                    // Navigator.pushNamed(context, successLogin);
                  },
                  child: Text(
                    'Verify',
                    style: poppins.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 270),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Didn’t Receive the Code? ',
                        style: poppins,
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: 'Resend',
                              style: poppins.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: lightBlue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: lightBlue)),
                        ])),
              ),
            )
          ],
        ),
      )),
    );
  }
}
