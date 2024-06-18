import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class FormFill extends StatelessWidget {
  const FormFill({
    super.key,
    required this.edit,
    required this.title,
    required this.hint,
    required this.formController,
  });
  final String title;
  final String hint;
  final bool edit;
  final TextEditingController formController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(title,
            style: poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                  color: bitGrey, borderRadius: BorderRadius.circular(10)),
              child: edit
                  ? TextFormField(
                      controller: formController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hint,
                          hintStyle: poppins.copyWith(color: Colors.grey)),
                    )
                  : Text(formController.text.trim(), style: poppins))),
    ]);
  }
}
