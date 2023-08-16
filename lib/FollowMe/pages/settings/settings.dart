import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/locals/db_tf.dart';
import 'package:udtscc/FollowMe/locals/dblg.dart';
import 'package:udtscc/FollowMe/pages/settings/about/about.dart';
import 'package:udtscc/FollowMe/pages/settings/security/security.dart';
import 'package:udtscc/FollowMe/models/sql/lg_db.dart';
import 'package:udtscc/FollowMe/models/sql/tf_db.dart';
import 'package:flutter/material.dart';

bool isSwitched = false;
double _fontsizeapps = 1.0;

class Setting extends StatefulWidget {
  final Param param;
  const Setting(this.param, {super.key});

  @override
  SettingState createState() => SettingState();
}

var txtLanguage = '';
int numLanguage = 0;
late DBLg dBLg;
LGDb lg = LGDb();

class SettingState extends State<Setting> {
  TFDb tf = TFDb();
  late DBTf dBTf;
  var imgprofile = '';
  @override
  void initState() {
    dBTf = DBTf();
    dBLg = DBLg();
    super.initState();
    isSwitched = false;
    _inittf();
  }

  @override
  void dispose() {
    dBTf.close();
    super.dispose();
  }

  _getlg() async {
    List<LGDb> l;
    await dBLg.initDB();
    l = await dBLg.getLg();

    if (MyClass.json(l)[0]['lg'] == '1') {
      txtLanguage = 'English';
      numLanguage = 1;
    } else {
      txtLanguage = 'ไทย';
      numLanguage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membershipNo}.jpg';
    _fontsizeapps = widget.param.fontsizeapps;
    _getlg();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.settingLg('setting', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0),
            child: Column(
              children: const [],
            ),
          ),
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -10),
                  CustomUI.appbarDetailUiPro1(imgprofile, context),
                  lineSizedBox(context, -10),
                  Center(
                    child: CustomUI.headprofile(context, widget.param.lgs,
                        widget.param.fontsizeapps, widget.param.name),
                  ),
                  lineSizedBox(context, -30),
                  _about(context, widget.param),
                  _passwordsecurity(context, widget.param),
                  _touchandface(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _touchandface(context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('touchAndFace', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch(
                          activeColor: MyColor.color('button'),
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              if (value == true) {
                                tf.tf = '1';
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Pins(
                                        gettitle: 'confirmTouchIDAndFaceID'),
                                  ),
                                );
                              } else {
                                dBTf.initDB().then((value) => {
                                      dBTf.deleteAll().then((value) => {}),
                                    });
                              }
                            });
                          })

                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inittf() {
    try {
      dBTf.initDB().then((value) => {
            dBTf
                .getTf()
                .then((value) => {_checkTF(MyClass.json(value)[0]['tf'])})
          });
    } catch (error) {
      setState(() {
        isSwitched = false;
      });
    }
  }

  _checkTF(value) {
    if (value == '1') {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}

InkWell _about(context, Param param) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => About(param),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('about', param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('buttonnext'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

InkWell _passwordsecurity(context, Param param) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Security(param),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 0,
        color: MyColor.color('SettingBackground'),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('LineColor'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('passwordSecurity', param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('buttonnext'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
