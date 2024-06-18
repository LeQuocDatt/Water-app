import 'package:dummy_template/pages/setting/history_detail/history_detail.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/list_anything.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var select = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 15,
            automaticallyImplyLeading: false,
            bottom: TabBar(
                labelStyle: roboto.copyWith(fontSize: 18, color: lightBlue),
                unselectedLabelStyle:
                    roboto.copyWith(fontSize: 18, color: Colors.grey),
                dividerColor: Colors.grey,
                dividerHeight: 3,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: lightBlue,
                onTap: (value) {
                  setState(() {
                    select = value;
                  });
                },
                tabs: const [
                  Tab(
                      icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history),
                      SizedBox(width: 5),
                      Text('History')
                    ],
                  )),
                  Tab(
                      icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings_outlined),
                      SizedBox(width: 5),
                      Text('Setting')
                    ],
                  ))
                ]),
          ),
          body: TabBarView(children: [
            const HistoryDetail(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: settingText.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      settingText[index].info,
                                      style: settingText[index].textStyle,
                                    ),
                                    Text(
                                      settingText[index].detail,
                                      style: poppins.copyWith(
                                          fontSize: 12, color: lightBlue),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(height: 10)
                            ],
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 70),
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Are you sure want to logout?',
                                      textAlign: TextAlign.center,
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              FirebaseAuth.instance
                                                  .signOut()
                                                  .then((value) =>
                                                      Navigator.pop(context))
                                                  .then((value) =>
                                                      Navigator.pushNamed(
                                                          context, loginPage));
                                            },
                                            child: Text(
                                              'Yes',
                                              style: poppins.copyWith(
                                                  color: lightBlue),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'No',
                                              style: poppins,
                                            ))
                                      ]),
                                ));
                      },
                      child: Text('Logout', style: poppins)),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
