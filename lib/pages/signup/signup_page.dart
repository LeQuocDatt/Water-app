import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim())
        .then((value) => addUserDetail(_fullNameController.text.trim(),
            int.parse(_phoneNumberController.text.trim())))
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                duration: Duration(seconds: 5),
                content: Text('Successful Registered!'))))
        .then((value) => Navigator.pushNamed(context, pinCode));
  }

  Future addUserDetail(String fullName, int phoneNumber) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'fullName': fullName, 'phoneNumber': phoneNumber});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool obscure1 = true;
  bool check1 = false;
  String dropDownvalue = '84';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); //
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: CloseButton(
                  onPressed: () {
                    Navigator.pushNamed(context, loginPage);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Create an account\n',
                        style: poppins.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        children: [
                      TextSpan(
                          text: 'Securely login to your account',
                          style: poppins.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal))
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(1),
                            color: Colors.grey.shade300,
                            blurRadius: 0.1)
                      ],
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: lightBlue,
                        ),
                        border: InputBorder.none,
                        hintText: 'Full Name',
                        hintStyle:
                            poppins.copyWith(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(1),
                            color: Colors.grey.shade300,
                            blurRadius: 0.1)
                      ],
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: lightBlue,
                        ),
                        border: InputBorder.none,
                        hintText: 'Email address',
                        hintStyle:
                            poppins.copyWith(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(1),
                            color: Colors.grey.shade300,
                            blurRadius: 0.1)
                      ],
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9)
                    ],
                    decoration: InputDecoration(
                        prefixIcon: DropdownButton(
                          value: dropDownvalue,
                          icon: const Text('  '),
                          underline: Container(
                              color: const Color.fromRGBO(244, 244, 244, 1)),
                          items: [
                            DropdownMenuItem(
                                value: '84',
                                child: Row(
                                  children: [
                                    Image.asset(vietNam, width: 30, height: 30),
                                    const SizedBox(width: 10),
                                    Text(
                                      '+84',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                            DropdownMenuItem(
                                value: '234',
                                child: Row(
                                  children: [
                                    Image.asset(nigeria, width: 30, height: 30),
                                    const SizedBox(width: 10),
                                    Text(
                                      '+234',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                            DropdownMenuItem(
                                value: '251',
                                child: Row(children: [
                                  Image.asset(ethiopia, width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+251',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                            DropdownMenuItem(
                                value: '968',
                                child: Row(children: [
                                  Image.asset(oman, width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+968',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                            DropdownMenuItem(
                                value: '386',
                                child: Row(children: [
                                  Image.asset(slovenia, width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+386',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                            DropdownMenuItem(
                                value: '82',
                                child: Row(children: [
                                  Image.asset(southKorea,
                                      width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+82',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                            DropdownMenuItem(
                                value: '255',
                                child: Row(children: [
                                  Image.asset(tanzania, width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+255',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                            DropdownMenuItem(
                                value: '1',
                                child: Row(children: [
                                  Image.asset(unitedStates,
                                      width: 30, height: 30),
                                  const SizedBox(width: 10),
                                  Text('+1',
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ])),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropDownvalue = value!;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter number',
                        hintStyle:
                            poppins.copyWith(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(1),
                            color: Colors.grey.shade300,
                            blurRadius: 0.1)
                      ],
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obscure1,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                obscure1 = !obscure1;
                              });
                            },
                            icon: obscure1
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: lightBlue,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle:
                            poppins.copyWith(fontSize: 12, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            check1 = !check1;
                          });
                        },
                        icon: check1
                            ? const Icon(Icons.check_circle, color: Colors.grey)
                            : const Icon(Icons.circle_outlined,
                                color: Colors.grey)),
                    Text('Remember me',
                        style:
                            poppins.copyWith(color: Colors.grey, fontSize: 10))
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 17)),
                          elevation: const MaterialStatePropertyAll(7),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightBlue),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        'Create Account',
                        style: poppins.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'I Already Have an Account ',
                          style: poppins,
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, loginPage);
                                  },
                                text: 'Log in',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: lightBlue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: lightBlue)),
                          ])),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
