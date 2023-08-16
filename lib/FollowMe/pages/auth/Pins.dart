import 'dart:async';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/pages/auth/login.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/locals/db_font_size.dart';
import 'package:udtscc/FollowMe/locals/db_pin.dart';
import 'package:udtscc/FollowMe/locals/db_tf.dart';
import 'package:udtscc/FollowMe/locals/db_user.dart';
import 'package:udtscc/root/tabs.dart';
import 'package:udtscc/FollowMe/models/sql/font_size_db.dart';
import 'package:udtscc/FollowMe/models/sql/lg_db.dart';
import 'package:udtscc/FollowMe/models/sql/pin_db.dart';
import 'package:udtscc/FollowMe/models/sql/tf_db.dart';
import 'package:udtscc/FollowMe/models/sql/user_db.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../lock/lockpin.dart';

class Param {
  String token;
  String name;
  String membershipNo;
  String sex;
  String lgs;
  double fontsizeapps;
  String cooptoken;
  String baytoken;

  Param(
    this.token,
    this.name,
    this.membershipNo,
    this.sex,
    this.lgs,
    this.fontsizeapps,
    this.cooptoken,
    this.baytoken,
  );
}

class Pins extends StatefulWidget {
  final String? gettitle;

  const Pins({super.key, this.gettitle});

  @override
  PinsState createState() => PinsState();
}

class PinsState extends State<Pins> {
  UserDb userref = UserDb();

  PinDb pin = PinDb();
  TFDb tf = TFDb();
  // DBLg dBLg = DBLg();
  LGDb lg = LGDb();

  String? getlgs;
  String numberPin = '';
  String numberPin1 = '';
  String title = '';

  late DBUser dBUser;
  late DBPin dBPin;
  late DBTf dBTf;

  late DBFs dBFs;
  FontSizeDb fs = FontSizeDb();

  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  double _fontSizeApp = 1.0;

  hiddenDialog(n) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  hiddenDialogMillisec(n) {
    Future.delayed(Duration(milliseconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  // _checkpassword() {
  //   dBUser.initDB().then((value) => {
  //     dBUser.getUsers().then((value) => {
  //       _gocheckpass(MyClass.json(value)[0]['user'],
  //           MyClass.json(value)[0]['password']),
  //     })
  //   });
  // }

  // _gocheckpass(user, pass) {
  //   Network.fetchCheckpassword(
  //       '{"membershipNo": "' + user + '","password":"' + pass + '"}')
  //       .then(
  //         (value) => value.toString() == '1' ? _newlogin() : null,
  //     // (value) =>  print(value),
  //   );
  // }

  _checkAuthLock() async {
    var objAuth = '';
    var objAuth1 = '';
    await dBUser.initDB();
    await dBUser.getUsers().then((value) => {
          objAuth =
              '{"pass":"","mode": "5","membership_no":"${MyClass.json(value)[0]['user']} "}',
          objAuth1 =
              '{"pass":"","mode": "7","membership_no":"${MyClass.json(value)[0]['user']} "}',
          Network.fetchAuthCount(objAuth).then((v) => {
                if (MyClass.json(v)[0]["status"].toString() == '1')
                  {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LockPin(user: MyClass.json(value)[0]['user']),
                      ),
                    ),
                  }
                else
                  {
                    Network.fetchAuthCount(objAuth1).then((v1) => {
                          if (MyClass.json(v1)[0]["status"].toString() == '1')
                            {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              ),
                            }
                        }),
                  }
              }),
        });
  }

  _resetall() async {
    await dBPin.initDB();
    await dBPin.deleteAll();
    await dBUser.initDB();
    await dBUser.deleteAll().then((value) => {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Login(
                lgs: getlgs,
              ),
            ),
          )
        });
  }

  _showAlert(msg, context, lgs) {
    Alert(
      context: context,
      type: AlertType.warning,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 3)),
      title: "",
      desc: msg,
      onWillPopActive: true,
      useRootNavigator: false,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      buttons: [
        DialogButton(
          onPressed: () => {Navigator.pop(context), _resetall()},
          gradient: LinearGradient(
            colors: <Color>[
              MyColor.color('buttongra'),
              MyColor.color('buttongra1'),
            ],
          ),
          child: Text(
            "ปิด",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        ),
      ],
    ).show();
  }

  // Future<void> _getSystemClose() {
  //   Network.fetchSystemClose('{}').then((value) => {
  //     _checkSystemClose(value),
  //   });
  // }

  // _checkSystemClose(v) {
  //   if (v[0]['status'] == '1') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => SystemClose(
  //           title: v[0]['title'],
  //           detail: v[0]['detail'],
  //         ),
  //       ),
  //     );
  //   }else{
  //     _authTF();
  //   }
  // }

  _oneSignal(user) async {
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId("533b8306-e6d8-4818-9914-d2562cc0cd75");
    // await OneSignal.shared
    //     .promptUserForPushNotificationPermission(fallbackToSettings: true);
    await OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {
      // MyClass.showToast(accepted);
    });
    await OneSignal.shared.sendTag('membership_no', user);
    //
    // OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
    //   MyClass.showToast(action);
    // });
  }

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();
    // dBLg = DBLg();
    dBFs = DBFs();

    super.initState();
    // _getSystemClose();
    _checkAuthLock();
    _getfs();
    _authTF();
    _gettitles();
  }

  @override
  void dispose() {
    dBUser.close();
    dBPin.close();
    dBTf.close();
    // dBLg.close();
    dBFs.close();

    super.dispose();
  }

  _getfs() async {
    try {
      await dBFs.initDB();
      await dBFs.getFs().then((value) => {
            value.isNotEmpty
                ? _fontSizeApp = double.parse(MyClass.json(value)[0]['fs'])
                : _fontSizeApp = 1.0,
          });
    } catch (err) {
      _fontSizeApp = 1.0;
    }
  }

  bool tabletMode1 = false;
  var counts = 0;
  bool isAlertPin = false;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    tabletMode1 = tabletMode;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGroundAuth(),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.03
                      : displayHeight(context) * 0.05,
                ),
                CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.0275
                      : displayHeight(context) * 0.0275,
                ),
                Text(MyClass.company('th'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.dataHeadTitleCTxt(context, 3, 'Go')),
                Text(MyClass.company('en'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    textAlign: TextAlign.center,
                    style:
                        CustomTextStyle.dataHeadTitleCTxt(context, -2, 'Go')),
                const SizedBox(
                  height: 15,
                ),
                Text(_checktitle(),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldTxt2(
                        context, tabletMode ? -12 : -5, _checkkey()
                        // title == Language.pinLg('confirmPleaseTryAgain', getlgs)
                        //     ? 'R'
                        //     : 'B')),
                        )),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    numberPin.isNotEmpty
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 2
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 3
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 4
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 5
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 6
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: tabletMode ? 2.8 : 1.8,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      _buttompin('1'),
                      _buttompin('2'),
                      _buttompin('3'),
                      _buttompin('4'),
                      _buttompin('5'),
                      _buttompin('6'),
                      _buttompin('7'),
                      _buttompin('8'),
                      _buttompin('9'),
                      title == Language.pinLg('setPassword', getlgs)
                          ? _buttompin(Language.pinLg('reset', getlgs))
                          : title == Language.pinLg('confirmPassword', getlgs)
                              ? _buttompin(Language.pinLg('reset', getlgs))
                              : title ==
                                      Language.pinLg(
                                          'confirmPleaseTryAgain', getlgs)
                                  ? _buttompin(Language.pinLg('reset', getlgs))
                                  : title ==
                                          Language.pinLg(
                                              'originalPINCode', getlgs)
                                      ? Container()
                                      // : title ==
                                      //         Language.pinLg(
                                      //             'incorrectOriginalPINCode',
                                      //             getlgs)
                                      //     ? Container()
                                      : _buttompin(
                                          Language.pinLg('forgot', getlgs)),
                      _buttompin('0'),
                      _buttompin(Language.pinLg('delete', getlgs)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              // child: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0.0,
              // ),
              child: CustomUI.appbarBackgroundUi(context)),
          // Container(
          //     alignment: Alignment.topCenter,
          //     padding: const EdgeInsets.only(top: 60),
          //     child: Image.asset('assets/imgs/icon.png',
          //         width: tabletMode
          //             ? displayWidth(context) * 0.2
          //             : displayWidth(context) * 0.3,
          //         height: tabletMode
          //             ? displayWidth(context) * 0.3
          //             : displayWidth(context) * 0.4)),
        ],
      ),
    );
  }

  // _checkkey() {
  //   return Container(
  //       child: Text(title,
  //           textScaleFactor: MyClass.fontSizeApp(),
  //           style: CustomTextStyle.dataBoldTxt2(context, 3, _()
  //               // title == Language.pinLg('confirmPleaseTryAgain', getlgs)
  //               //     ? 'R'
  //               //     : 'B')),
  //               )));
  // }

  _checkkey() {
    if (title == Language.pinLg('incorrectOriginalPINCode', getlgs) ||
        title == Language.pinLg('confirmPleaseTryAgain', getlgs) ||
        title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs) ||
        title == Language.pinLg('pleaseTryAgain', getlgs)) {
      return 'R';
    } else {
      return 'B';
    }
  }

  _checktitle() {
    if (title == Language.pinLg('incorrectOriginalPINCode', getlgs) ||
        title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs) ||
        title == Language.pinLg('pleaseTryAgain', getlgs)) {
      return '$title ($counts/3)';
    } else {
      return title;
    }
  }

  _buttompin(n) {
    return InkResponse(
      onTap: () {
        _onCodeClick(n);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: MyColor.color('button'),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, -2),
              ),
              BoxShadow(
                color: MyColor.color('button'),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              )
            ]),
        child: Center(
          child: Text(
            n.toString(),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.dataBoldTxt(
                context, tabletMode1 == true ? 4 : 5),
          ),
        ),
      ),
    );
  }

  _onCodeClick(n) {
    setState(() {
      numberPin += n;
      if (n == Language.pinLg('delete', getlgs)) {
        numberPin = '';
      }

      if (n.toString() == Language.pinLg('reset', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        title = Language.pinLg('setPassword', getlgs);
      }

      if (n.toString() == Language.pinLg('forgot', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        _resetall();
      }
    });
    if (numberPin.length >= 6) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );
      if (title == Language.pinLg('setPassword', getlgs)) {
        hiddenDialog(2);
        numberPin1 = numberPin;
        numberPin = '';
        title = Language.pinLg('confirmPassword', getlgs);
      } else if (title == Language.pinLg('confirmPassword', getlgs) ||
          title == Language.pinLg('confirmPleaseTryAgain', getlgs)) {
        hiddenDialog(0);
        if (numberPin == numberPin1) {
          pin.pinnumber = numberPin1;
          dBPin.initDB().then((value) => {
                dBPin.deleteAll().then((value) => {
                      dBPin.insertPins(pin).then((value) => {
                            numberPin = '',
                            _onLogin(''),
                            title = Language.pinLg('pinCode', getlgs),
                          })
                    })
              });
        } else {
          numberPin = '';
          // hiddenDialog(2);
          title = Language.pinLg('confirmPleaseTryAgain', getlgs);
        }
      } else if (title == Language.pinLg('pinCode', getlgs) ||
          title == Language.pinLg('pleaseTryAgain', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onCheckLogin(MyClass.json(value)[0]['pinnumber']),
                    },
                  )
            });
      } else if (title == Language.pinLg('originalPINCode', getlgs) ||
          title == Language.pinLg('incorrectOriginalPINCode', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      setState(() {}),
                      // hiddenDialog(2),
                      _onChangpin(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      } else if (title == Language.pinLg('confirmTouchIDAndFaceID', getlgs) ||
          title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onTouchIDAndFaceID(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      }
    }
    // });
  }

  _onTouchIDAndFaceID(pin, pinnum) async {
    if (pin == pinnum) {
      var objAuth = '';
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "4","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {}),
          });
      numberPin = '';
      hiddenDialog(0);
      tf.tf = '1';
      dBTf.initDB().then((value) => {
            dBTf.insertTf(tf).then((value) => {
                  // _onCheckLogin(pin)
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            'Success',
                            style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                          ),
                          content: Text(
                            'เปิดใช้งานระบบ Touch ID หรือ Face ID เรียบร้อยแล้ว',
                            style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                                style:
                                    CustomTextStyle.dataHTxt(context, 3, 'B'),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Pins()),
                                    (Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        );
                      })
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => Setting(),
                  //   ),
                  // )
                }),
          });
      numberPin = '';
    } else {
      var objAuth = '';
      hiddenDialogMillisec(150);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "3","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {
                  title = Language.pinLg(
                      'incorrectconfirmTouchIDAndFaceID', getlgs),
                  numberPin = '',
                  _setcounts(value),
                }),
          });
    }
  }

  _onChangpin(pin, pinnum) async {
    if (pin == pinnum) {
      var objAuth = '';
      hiddenDialog(1);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "4","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {}),
          });
      numberPin = '';
      title = Language.pinLg('setPassword', getlgs);
    } else {
      var objAuth = '';
      hiddenDialogMillisec(100);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "3","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {
                  title = Language.pinLg('incorrectOriginalPINCode', getlgs),
                  numberPin = '',
                  _setcounts(value),
                }),
          });
    }
  }

  _onCheckLogin(pin) async {
    if (pin == numberPin) {
      var objAuth = '';
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "4","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {}),
          });
      numberPin = '';
      _onLogin('n');
    } else {
      var objAuth = '';
      hiddenDialogMillisec(150);
      await dBUser.initDB();
      await dBUser.getUsers().then((value) => {
            objAuth =
                '{"pass":"","mode": "3","membership_no":"${MyClass.json(value)[0]['user']}"}',
            Network.fetchAuthCount(objAuth).then((value) => {
                  title = Language.pinLg('pleaseTryAgain', getlgs),
                  numberPin = '',
                  _setcounts(value),
                }),
          });
    }
  }

  _alertPin() {
    if (isAlertPin) {
      Alert(
        context: context,
        closeIcon: const Text(''),
        useRootNavigator: false,
        style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleTxt(context, 2),
          titleStyle: CustomTextStyle.dataHeadTitleTxt(context, 6),
          alertBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
        ),
        title: "คำเตือน",
        desc:
            "หากกรอก Pin ผิดเกิน 3 ครั้ง\nระบบจะทำการล็อคจากแอปพลิเคชั่น\nเป็นเวลา 24 ชม.\nหากจำรหัส Pin ไม่ได้ กดปุ่มลืม Pin",
        onWillPopActive: true,
        buttons: [
          DialogButton(
            radius: const BorderRadius.all(Radius.circular(20)),
            width: displayWidth(context) * 0.5,
            onPressed: () => {Navigator.pop(context)},
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            ),
            child: Text(
              "ยืนยัน",
              style: CustomTextStyle.dataBoldTxt1(context, -5),
            ),
          ),
        ],
      ).show();
    }
  }

  _setcounts(v) {
    counts = MyClass.json(v)[0]["count"];
    _checkAuthLock();
    if (counts == 2) {
      setState(() {
        isAlertPin = true;
      });
    } else {
      setState(() {
        isAlertPin = false;
      });
    }
    _alertPin();
  }

  Future<String> _getDevice() async {
    String udid = await FlutterUdid.udid;
    return udid;
  }

  _onLogin(n) async {
    await dBUser.initDB();
    await dBUser.getUsers().then((value) async => {
          await _getDevice().then((udid) => {
                _goMenu(MyClass.json(value)[0]['user'],
                    MyClass.json(value)[0]['password'], udid, n),
              })
        });
  }

  _goMenu(user, pass, udid, n) {
    n == 'n' ? Navigator.of(context, rootNavigator: true).pop('dialog') : null;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyClass.loading();
      },
    );

    Timer t = Timer(const Duration(seconds: 10), () {
      Navigator.of(context, rootNavigator: true).pop('AlertDialog');
      setState(() {
        numberPin = '';
      });
    });

    Network.fetchpinrefresh(
            '{"refresh_token":"$pass","membership_no":"$user","imei":"$udid"}',
            context)
        .then((value) async => {
              if (value == 'NoData')
                {
                  t.cancel(),
                  _showAlert(
                      Language.pinLg('checkapplogin', 'th'), context, getlgs),
                }
              else
                {
                  userref.user = await user,
                  userref.password = await value[0]["refresh_token"],
                  await dBUser.initDB(),
                  await dBUser.deleteAll(),
                  await dBUser.insertUsers(userref).then((userdb) => {
                        Network.fetchpinloginInfo(
                                '{"mode": "1"}', value[0]['access_token'])
                            .then((val) => {
                                  _getToken(
                                      value[0]['access_token'],
                                      val[0]['member_full_name'],
                                      MyClass.genmember(user).toString(),
                                      t),
                                }),
                      }),
                }
            });
  }

  _getToken(token, name, user, t) {
    Param param;
    param = Param(
        token.toString(),
        name.toString(),
        user.toString(),
        'M'.toString(),
        'th'.toString(),
        _fontSizeApp,
        ''.toString(),
        ''.toString());
    Navigator.of(context, rootNavigator: true).pop('AlertDialog');
    _oneSignal(user.toString());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Tabs(param)),
        (Route<dynamic> route) => false);
    t.cancel();
  }

  _codePanel(n) {
    if (n == 1) {
      return SizedBox(
          width: 22,
          height: 22,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFBA8C26), width: 2.0),
                color: const Color(0xFFBA8C26)),
          ));
    } else {
      return SizedBox(
        width: 22,
        height: 22,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE4E4E4), width: 2.0),
              color: const Color(0xFFE4E4E4)),
        ),
      );
    }
  }

  Widget _joinCodePanel(n) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: _codePanel(n),
    );
  }

  _authTF() {
    dBPin.initDB().then((value) => {
          dBPin.getPins().then((value) => {_checkpin(MyClass.json(value))})
        });
  }

  _checkpin(pi) {
    if (title != Language.pinLg('setPassword', getlgs)) {
      try {
        if (pi[0]['pinnumber'].toString().length == 6) {
          if (title != Language.pinLg('originalPINCode', getlgs)) {
            dBTf.initDB().then((value) => {
                  // title = 'กรุณาใส่รหัส PIN Code',
                  dBTf.getTf().then((value) => {
                        if (value.isNotEmpty)
                          {_touchandface(MyClass.json(value)[0]['tf'])}
                      })
                });
          }
        }
      } catch (e) {
        throw Exception('Failed');
      }
    }
  }

  _touchandface(check) async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (check == '1') {
      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          _authenticate();
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      } else {
        if (availableBiometrics.contains(BiometricType.fingerprint) ||
            availableBiometrics.contains(BiometricType.strong)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      }
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });

      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException {
      rethrow;
    }
    if (!mounted) return;
    if (authenticated == true) {
      _onLogin('tf');
    }
    setState(() {});
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  _gettitles() {
    getlgs = 'th';
    _gettitle('th');
  }

  _gettitle(l) {
    if (widget.gettitle == null) {
      setState(() {
        title = KeyPin.key('pinCode', l);
      });
    } else {
      setState(() {
        title = KeyPin.key(widget.gettitle, l);
      });
    }
  }
}

class KeyPin {
  static key(k, l) {
    if (k == 'pinCode') {
      return Language.pinLg('pinCode', l);
    }
    if (k == 'originalPINCode') {
      return Language.pinLg('originalPINCode', l);
    }
    if (k == 'setPassword') {
      return Language.pinLg('setPassword', l);
    }
    if (k == 'confirmTouchIDAndFaceID') {
      return Language.pinLg('confirmTouchIDAndFaceID', l);
    }
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
