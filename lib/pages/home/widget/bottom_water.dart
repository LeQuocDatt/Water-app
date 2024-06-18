import 'package:dummy_template/pages/home/widget/activities.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class BottomWater extends StatelessWidget {
  const BottomWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const RangeMaintainingScrollPhysics(),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Container(
                  height: 4,
                  width: 70,
                  decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(20))),
            ),
            Text('Water Goal',
                style: poppins.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 10),
            Text(
              'We prepared a lot of goals for you!',
              style: poppins.copyWith(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 25),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search Template',
                      hintStyle: poppins.copyWith(color: Colors.grey),
                      prefixIcon: Image.asset(search),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                itemCount: toDo.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return Activities(
                      hour: toDo[index],
                      quantity: toDo[index],
                      power: toDo[index]);
                },
              ),
            )
          ])),
    );
  }
}
