import 'package:dummy_template/pages/profile/widget/form_fill.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int choice = 0;
  bool edit = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        edit
                            ? CloseButton(
                                onPressed: () {
                                  setState(() {
                                    edit = !edit;
                                  });
                                },
                                color: lightBlue,
                              )
                            : BackButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, tabMenu);
                                },
                                color: lightBlue,
                              ),
                        Text(
                          edit ? 'Edit Profile' : 'My Profile',
                          style: poppins.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                edit = !edit;
                              });
                            },
                            icon: Image.asset(bluePen))
                      ],
                    ),
                    Center(child: Image.asset(men)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.46,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            FormFill(
                                edit: edit,
                                title: 'First Name',
                                hint: 'Aashifa',
                                formController: _firstNameController),
                            FormFill(
                                edit: edit,
                                title: 'Last Name',
                                hint: 'Sheikh',
                                formController: _lastNameController),
                            FormFill(
                                edit: edit,
                                title: 'Email Address',
                                hint: 'aashifasheikh@gmail.com',
                                formController: _emailController),
                            FormFill(
                                edit: edit,
                                title: 'Age',
                                hint: '25',
                                formController: _ageController),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text('Gender',
                          style: poppins.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Radio(
                              fillColor:
                                  const MaterialStatePropertyAll(lightBlue),
                              activeColor: lightBlue,
                              value: 0,
                              groupValue: choice,
                              onChanged: (value) {
                                setState(() {
                                  edit ? choice = value! : null;
                                });
                              },
                            ),
                            Text('Male',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 20),
                            Radio(
                              fillColor:
                                  const MaterialStatePropertyAll(lightBlue),
                              activeColor: lightBlue,
                              value: 1,
                              groupValue: choice,
                              onChanged: (value) {
                                setState(() {
                                  edit ? choice = value! : null;
                                });
                              },
                            ),
                            Text('Female',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 20),
                            Radio(
                              fillColor:
                                  const MaterialStatePropertyAll(lightBlue),
                              activeColor: lightBlue,
                              value: 2,
                              groupValue: choice,
                              onChanged: (value) {
                                setState(() {
                                  edit ? choice = value! : null;
                                });
                              },
                            ),
                            Text('Other',
                                style: poppins.copyWith(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                          child: edit
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      shadowColor:
                                          const MaterialStatePropertyAll(
                                              shadowBlue),
                                      elevation:
                                          const MaterialStatePropertyAll(5),
                                      padding: const MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 15)),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              lightBlue),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  onPressed: () {},
                                  child: Text('Update',
                                      style: poppins.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)))
                              : null),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
