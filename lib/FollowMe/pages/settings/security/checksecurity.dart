import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/pages/auth/check_register.dart';
import 'package:mwasc/FollowMe/pages/auth/login.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/locals/db_pin.dart';
import 'package:mwasc/FollowMe/locals/db_user.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Checksecurity extends StatefulWidget {
  final Param param;
  final String type;
  const Checksecurity({super.key, required this.type, required this.param});

  @override
  ChecksecurityState createState() => ChecksecurityState();
}

class CheckSecuritys {
  String title;
  String detail;

  CheckSecuritys({required this.title, required this.detail});
}

class ChecksecurityState extends State<Checksecurity> {
  late DBPin dBPin;
  late DBUser dBUser;
  @override
  void initState() {
    dBPin = DBPin();
    dBUser = DBUser();
    super.initState();
  }

  @override
  void dispose() {
    dBPin.close();
    dBUser.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    List<CheckSecuritys> checkSecuritys = <CheckSecuritys>[
      CheckSecuritys(
          title: Language.settingLg('changePin', widget.param.lgs),
          detail: Language.settingLg('changePinDetail', widget.param.lgs)),
      CheckSecuritys(
          title: Language.settingLg('forgotPassword1', widget.param.lgs),
          detail: Language.settingLg('forgotPasswordDetail', widget.param.lgs)),
      CheckSecuritys(
          title: Language.settingLg('deactivate', widget.param.lgs),
          detail: Language.settingLg('deactivateDetail', widget.param.lgs)),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGroundAuth(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
                  lineSizedBox(context, -15),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Text(
                                MyClass.company('th'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, 7, "bl2", 2),
                              ),
                              Text(MyClass.company('th'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, 7, 'bl')),
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                MyClass.company('en'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, -2, "bl2", 2),
                              ),
                              Text(MyClass.company('en'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, -2, 'bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  lineSizedBox(context, -15),
                  Center(
                      child: Text(
                    checkSecuritys[int.parse(widget.type)].title,
                    textAlign: TextAlign.center,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHeadTitleCTxt(
                        context, 4, 'TxtBlue'),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                        child: Text(
                      checkSecuritys[int.parse(widget.type)].detail,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHeadTitleCTxt(
                          context, 0, 'TxtBlue'),
                    )),
                  ),
                  lineSizedBox(context, 0),
                  Stack(
                    children: [
                      Text(
                        Language.settingLg('youWant', widget.param.lgs) +
                            "${checkSecuritys[int.parse(widget.type)].title} " +
                            Language.settingLg('yesOrNo', widget.param.lgs),
                        textScaleFactor: MyClass.fontSizeApp(),
                        textAlign: TextAlign.center,
                        style:
                            CustomTextStyle.defaultTxtPaint(context, 1, "w", 2),
                      ),
                      Text(
                          Language.settingLg('youWant', widget.param.lgs) +
                              "${checkSecuritys[int.parse(widget.type)].title} " +
                              Language.settingLg('yesOrNo', widget.param.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, 1, 'R')),
                    ],
                  ),
                  lineSizedBox(context, -15),
                  _buttom()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttom() {
    return Row(
      children: [
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.4,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.fromDirection(2, 3),
                  blurRadius: 6.0,
                  spreadRadius: 1.0)
            ],
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('w'),
                MyColor.color('w'),
              ],
            ),
          ),
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                Language.settingLg('no', widget.param.lgs),
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
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.fromDirection(2, 3),
                  blurRadius: 6.0,
                  spreadRadius: 1.0)
            ],
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('bl1'),
                MyColor.color('w'),
              ],
            ),
          ),
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            onTap: _submit,
            child: Center(
              child: Text(
                Language.settingLg('yes', widget.param.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt1(context, 5, 'bl'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
      ],
    );
  }

  _submit() {
    if (int.parse(widget.type) == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Pins(gettitle: 'originalPINCode'),
        ),
      );
    } else if (int.parse(widget.type) == 1) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Checkregister(
                                  title: Language.loginLg(
                                      'forgotPassword', widget.param.lgs))),
                          (Route<dynamic> route) => false)
                    },
                  )
            },
          );
    } else if (int.parse(widget.type) == 2) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      dBUser.initDB().then(
                            (value) => {
                              dBUser.deleteAll().then((value) => {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => Login(
                                                  lgs: widget.param.lgs,
                                                )),
                                        (Route<dynamic> route) => false)
                                  })
                            },
                          ),
                    },
                  )
            },
          );
    }
  }
}
