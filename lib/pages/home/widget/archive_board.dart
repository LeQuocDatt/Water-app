import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class ArchiveBoard extends StatefulWidget {
  const ArchiveBoard({super.key});

  @override
  State<ArchiveBoard> createState() => _ArchiveBoardState();
}

class _ArchiveBoardState extends State<ArchiveBoard> {
  bool feel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Today - 16 June',
              style:
                  poppins.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Hi, Aashifa Sheikh,',
              style: poppins.copyWith(color: Colors.grey),
            ),
            feel ? Image.asset(happy) : Image.asset(sad),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    feel = !feel;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  height: MediaQuery.of(context).size.height * 0.43,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[50]),
                  child: Stack(clipBehavior: Clip.none, children: [
                    RichText(
                        text: TextSpan(
                            text: feel ? 'Congratulations!\n' : 'Oops!\n',
                            style: poppins.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: feel
                                  ? '\nHarry has archive your goal today\n'
                                  : '\nHarry has not archive your goal today\n',
                              style: poppins.copyWith(fontSize: 16)),
                          TextSpan(
                              text: feel
                                  ? '\nYou can get everything in life you\nwant if you will just help enough other\npeople get what they want.'
                                  : '\nSuccess is not final, failure\nis not fatal: it is the courage\nto continue that count.',
                              style: poppins.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.normal))
                        ])),
                    Positioned(top: -85, right: -43, child: Image.asset(cheer)),
                    Positioned(
                        left: -20, bottom: -120, child: Image.asset(goldTrophy))
                  ]),
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 45, vertical: 15)),
                    backgroundColor: const MaterialStatePropertyAll(lightBlue)),
                onPressed: () {
                  Navigator.pushNamed(context, tabMenu);
                },
                child: Text('Go to Home',
                    style: poppins.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    ));
  }
}
