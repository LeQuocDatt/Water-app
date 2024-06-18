import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  const Activities(
      {super.key,
      required this.hour,
      required this.quantity,
      required this.power});
  final ToDo hour;
  final ToDo quantity;
  final ToDo power;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hour.timeText,
              style: poppins.copyWith(color: Colors.grey, fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(quantity.amountText,
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Image.asset(power.actIcon)
            ],
          )
        ],
      ),
    );
  }
}
