import 'dart:io';

import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/locals/db_pdpa.dart';
import 'package:mwasc/FollowMe/models/sql/pdpa_db.dart';
import 'package:mwasc/FollowMe/pages/intro/checkrg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String lgs = 'th';
String xxx = '';
final format = DateFormat("y-MMM-d");

class Pdpa extends StatefulWidget {
  const Pdpa({super.key});

  @override
  SeandfoState createState() => SeandfoState();
}

class SeandfoState extends State<Pdpa> {
  bool checkbox = false;
  PdpaDb pdpaDb = PdpaDb();
  bool checkbutton = false;
  late ScrollController _scrollController;

  late DBPdpa dbPdpa;

  _scrollLister() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      setState(() {
        checkbutton = true;
      });
    } else {}
  }

  @override
  void initState() {
    dbPdpa = DBPdpa();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollLister);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: MyWidget.bgApp(),
              // color: Colors.red[60],
              height: double.infinity,
              width: double.infinity,
              child: SafeArea(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Text(
                          "เงื่อนไขการลงทะเบียน",
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.defaultTxtPaint(
                              context, 15, "bl", 3),
                        ),
                        Text(
                          "เงื่อนไขการลงทะเบียน",
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.defaultTxt1(context, 15, "w"),
                        ),
                      ],
                    ),
                    lineSizedBox(context, 0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 0.5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        // height: displayHeight(context) * 0.625,
                        width: displayWidth(context) * 0.95,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Container(
                              decoration: MyWidget.bgPdpa(),
                              child: Column(
                                children: [
                                  Text(
                                    Language.pdpa('pdpa', lgs),
                                    textAlign: TextAlign.center,
                                    textScaleFactor: MyClass.fontSizeApp(),
                                    style:
                                        CustomTextStyle.defaultTxt(context, 0),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      child: Form(
                                        child: Column(
                                          children: [
                                            Text(
                                              Language.pdpa('pdpaDtail', lgs),
                                              textScaleFactor:
                                                  MyClass.fontSizeApp(),
                                              style: CustomTextStyle.defaultTxt(
                                                  context, -1),
                                            ),
                                            // _checkBox(context),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _checkBox(context),
                    _onLogin(context),
                    lineSizedBox(context, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkBox(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.fromLTRB(
          displayWidth(context) * 0.035, displayWidth(context) * 0.025, 0, 10),
      child: Row(
        children: [
          Transform.scale(
            scale: tabletMode ? 2.0 : 1.0,
            child: Checkbox(
              activeColor: MyColor.color('divider'),
              value: checkbox,
              onChanged: checkbutton
                  ? (bool? value) {
                      setState(() {
                        checkbox = value!;
                      });
                    }
                  : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
            child: Text(
              Language.pdpa('pdpacheckbox', lgs),
              textScaleFactor: MyClass.fontSizeApp(),
              style: CustomTextStyle.defaultTxtBoldLineUnder(
                  context, 2, checkbutton),
            ),
          ),
        ],
      ),
    );
  }

  Widget _onLogin(context) {
    return Container(
      padding: EdgeInsets.only(top: displayWidth(context) * 0.015),
      child: Row(
        children: [
          const Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: MyColor.color('w'),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Platform.isIOS
                    ? FlutterExitApp.exitApp(iosForceExit: true)
                    : FlutterExitApp.exitApp();
              },
              child: Center(
                child: Text(
                  Language.pdpa('pdpacancel', lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.defaultTxt1(context, 5, 'R'),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: MyColor.color('G'),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                if (checkbox == true) {
                  pdpaDb.pdpa = "1";
                  dbPdpa.initDB().then((value) => {
                        dbPdpa.insertPdpa(pdpaDb).then((value) => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Checkrg(),
                                ),
                              )
                            }),
                      });
                } else {
                  MyClass.showToast(Language.pdpa('alertpdpa', lgs));
                }
              },
              child: Center(
                child: Text(
                  Language.pdpa('pdpasave', lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonTxt(context, 5),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
