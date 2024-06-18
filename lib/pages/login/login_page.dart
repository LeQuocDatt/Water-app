import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _emailController1 = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    Navigator.pushNamed(context, setupInfo);
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController1.text.trim())
          .then((value) => showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                    content:
                        Text('Password reset link sent! Check your email')),
              ));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text(e.message.toString())),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailController1.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool obscure = true;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: CloseButton(
                  onPressed: () {
                    Navigator.pushNamed(context, onboardingPage);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Login\n',
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
                    controller: _passwordController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            icon: obscure
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
                            check = !check;
                          });
                        },
                        icon: check
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
                  padding: const EdgeInsets.only(top: 10, bottom: 50),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 150, vertical: 17)),
                          elevation: const MaterialStatePropertyAll(7),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightBlue),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        signIn();
                      },
                      child: Text(
                        'LOG IN',
                        style: poppins.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                              contentPadding: const EdgeInsets.all(20),
                              children: [
                                Text(
                                    'Enter Your Email and we will send you a password reset link',
                                    textAlign: TextAlign.center,
                                    style: poppins),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset.fromDirection(1),
                                            color: Colors.grey.shade300,
                                            blurRadius: 0.1)
                                      ],
                                      color: const Color.fromRGBO(
                                          244, 244, 244, 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextFormField(
                                    controller: _emailController1,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.mail_outline,
                                          color: lightBlue,
                                        ),
                                        border: InputBorder.none,
                                        hintText: 'Email address',
                                        hintStyle: poppins.copyWith(
                                            fontSize: 12, color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                lightBlue)),
                                    onPressed: () {
                                      passwordReset();
                                    },
                                    child: Text('Reset Password',
                                        style: poppins.copyWith(
                                            color: Colors.white)))
                              ],
                            ));
                  },
                  child: Text(
                    'Forgot Password',
                    style: poppins.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: lightBlue,
                        fontSize: 12,
                        color: lightBlue),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    '- OR Continue with -',
                    style: poppins.copyWith(fontSize: 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: lightBlue))),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightGrey)),
                      onPressed: () {},
                      icon: Image.asset(google),
                      label:
                          Text('Google', style: poppins.copyWith(fontSize: 12)),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: lightBlue))),
                          backgroundColor:
                              const MaterialStatePropertyAll(lightGrey)),
                      onPressed: () {},
                      icon: Image.asset(faceBook),
                      label: Text('Facebook',
                          style: poppins.copyWith(fontSize: 12)),
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Create An Account ',
                          style: poppins,
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, signupPage);
                                  },
                                text: 'Sign Up\n',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: lightBlue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: lightBlue)),
                            TextSpan(
                                text:
                                    '\nBy clicking Continue, you agree to our ',
                                style: poppins.copyWith(fontSize: 10)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Terms of Service\n',
                                style: poppins.copyWith(
                                    fontSize: 10, color: lightBlue)),
                            TextSpan(
                                text: 'and ',
                                style: poppins.copyWith(fontSize: 10)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Privacy Policy',
                                style: poppins.copyWith(
                                    fontSize: 10, color: lightBlue))
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
