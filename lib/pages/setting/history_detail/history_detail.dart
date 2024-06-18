import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class HistoryDetail extends StatefulWidget {
  const HistoryDetail({super.key});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              color: lightBlue,
              child: Stack(children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text('Weekly Completion',
                      style: poppins.copyWith(color: Colors.white)),
                ),
                Positioned(
                  bottom: 1,
                  top: 40,
                  left: 20,
                  right: 20,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: historyText.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Image.asset(historyText[index].image),
                                Text(
                                  historyText[index].day,
                                  style: poppins.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          )),
                ),
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 15),
          child: Text('Drink Water Report',
              style:
                  poppins.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const Divider(),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: amountWater.length,
                itemBuilder: (context, index) => Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListTile(
                          horizontalTitleGap: 0,
                          leading: amountWater[index].container,
                          title:
                              Text(amountWater[index].amount1, style: poppins),
                          trailing: Text(amountWater[index].amount2,
                              style: poppins.copyWith(
                                  fontSize: 12, color: lightBlue)),
                        ),
                      ),
                      const Divider()
                    ])),
          ),
        )
      ],
    );
  }
}
