import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/pages/auth/check_register.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/locals/db_pin.dart';
import 'package:udtscc/FollowMe/locals/db_tf.dart';
import 'package:udtscc/FollowMe/locals/db_user.dart';
import 'package:udtscc/FollowMe/models/sql/user_db.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

import '../lock/lockpin.dart';

class Login extends StatefulWidget {
  final String? lgs;

  const Login({super.key, this.lgs});

  @override
  LoginState createState() => LoginState();
}

class Devices {
  deviceInfo() {
    name = '';
    platform = '';
    version = '';
    model = '';
  }

  String? name;
  String? platform;
  String? version;
  String? model;
}

class LoginState extends State<Login> {
  UserDb user = UserDb();
  final _formKey = GlobalKey<FormState>();

  late DBUser dBUser;
  late DBPin dBPin;
  late DBTf dBTf;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();

    super.initState();
  }

  @override
  void dispose() {
    dBUser.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _initusers();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.01
                          : displayHeight(context) * 0.01,
                    ),
                    CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
                    Container(
                      padding:
                          EdgeInsets.only(top: displayHeight(context) * 0.025),
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(MyClass.company('th'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.dataHeadTitleCTxt(
                                    context, 3, 'Go')),
                            Text(MyClass.company('en'),
                                textAlign: TextAlign.center,
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.dataHeadTitleCTxt(
                                    context, -2, 'Go')),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.01
                          : displayHeight(context) * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 0, bottom: 0),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: MyClass.fontSizeApp(),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.defaultTxt(context, 0),
                          decoration: InputDecoration(
                            labelText:
                                Language.loginLg('memberNumber', widget.lgs),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Opacity(
                              opacity: 0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.visibility,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            prefixIcon: Icon(Icons.account_circle,
                                size: tabletMode ? 40 : 30,
                                color: const Color(0xFFBA8C26)),
                            labelStyle: TextStyle(
                                color: MyColor.color('TextFormFieldTextStyle')),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.color('TextFormFieldBorderSide'),
                                width: 2.0,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            _validatUser;
                            return null;
                          },
                          onSaved: (String? value) {
                            user.user = MyClass.genmember(value);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                      ),
                      child: Text(Language.loginLg('memberDetail', widget.lgs),
                          textScaleFactor: MyClass.fontSizeApp(),
                          style:
                              CustomTextStyle.defaultTxt1(context, -4, 'Gr')),
                    ),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.03
                          : displayHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 0, bottom: 0),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: MyClass.fontSizeApp(),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.defaultTxt(context, 0),
                          decoration: InputDecoration(
                            labelText: Language.loginLg('password', widget.lgs),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                icon: _obscureText == true
                                    ? Icon(
                                        Icons.visibility_off,
                                        size: tabletMode ? 40 : 30,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        size: tabletMode ? 40 : 30,
                                        color: const Color(0xFFBA8C26),
                                      ),
                                onPressed: () {
                                  _toggle();
                                },
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: tabletMode ? 40 : 30,
                              color: const Color(0xFFBA8C26),
                            ),
                            // labelText: Language.loginLg('password', widget.lgs),
                            labelStyle: TextStyle(
                                color: MyColor.color('TextFormFieldTextStyle')),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.color('TextFormFieldBorderSide'),
                                width: 2.0,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: _obscureText,
                          validator: (String? value) {
                            _validatPassword;
                            return null;
                          },
                          onSaved: (String? value) {
                            user.password = value;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        Language.loginLg('pleaseYourpassword', widget.lgs),
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: CustomTextStyle.defaultTxt1(context, -4, 'Gr'),
                      ),
                    ),
                    hSizedBoxButton(context, 0),
                    Center(child: _buildsubmitButton()),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(child: _buildRegitResetButton()),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegitResetButton() {
    return SizedBox(
      width: displayWidth(context) * 0.85,
      height: displayHeight(context) * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('buttonRegis'),
                  MyColor.color('buttonRegis'),
                ],
              ),
            ),
            // padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('memberRegis', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Center(
                child: Text(
                  Language.loginLg('memberRegis', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataBoldTxt1(context, -8),
                ),
              ),
            ),
          ),
          Container(
            width: displayWidth(context) * 0.05,
          ),
          Container(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('button1'),
                  MyColor.color('button1'),
                ],
              ),
            ),
            // padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('forgotPassword', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Center(
                child: Text(
                  Language.loginLg('forgotPassword', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataBoldTxt1(context, -8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildsubmitButton() {
    return Container(
      width: displayWidth(context) * 0.85,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: _submit,
        child: Center(
          child: Text(
            Language.loginLg('logIn', widget.lgs),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.dataBoldTxt1(context, -3),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );

      // Network.fetchpinlogin('{"membership_no": "' +
      //         user.user! +
      //         '","mem_password":"' +
      //         user.password! +
      //         '"}')
      //     .then((value) => {
      //           // print(value),
      //           _onLoadingParm(value),
      //         });
      Network.fetchpinlogin(
              '{"membership_no": "${user.user}","mem_password":"${user.password}"}')
          .then((value) => {
                // print(value),
                _onLoadingParm(value),
              });
    } else {}
  }

  DeviceInfoPlugin device1 = DeviceInfoPlugin();
  Devices getdeviceall = Devices();

  void _getDevice() async {
    String udid = await FlutterUdid.udid;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await device1.androidInfo;
      getdeviceall.name = androidInfo.device;
      getdeviceall.platform = androidInfo.product;
      getdeviceall.version = androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device1.iosInfo;
      getdeviceall.name = iosInfo.name;
      getdeviceall.platform = iosInfo.systemName;
      getdeviceall.version = iosInfo.systemVersion;
    }
    await getDeviceStatus(udid);
  }

  getDeviceStatus(udid) {
    var obj =
        '{"mode": "1","membership_no":"${user.user}","imei":"$udid","platform":"${getdeviceall.platform} ","model":"${getdeviceall.name}(${getdeviceall.version})","phone":"","bank":""}';
    Network.fetchDeviceStatus(obj, context).then((value) => {});
  }

  void _onLoadingParm(value) {
    // print(value);
    if (value != 'NoData') {
      Future.delayed(const Duration(), () {
        // Navigator.pop(context);
        // Navigator.of(context, rootNavigator: true).pop('dialog');
        user.password = value[0]["refresh_token"];
        _getDevice();
        _checklogin(value);
      });
    } else {
      Future.delayed(const Duration(), () {
        // Navigator.pop(context);
        Navigator.of(context).pop();
        MyClass.showToast(Language.loginLg('alertlogin', widget.lgs));
      });
    }
  }

  _checklogin(value) async {
    await dBPin.initDB();
    await dBPin.deleteAll();
    await dBPin.close();

    await dBTf.initDB();
    await dBTf.deleteAll();
    await dBTf.close();

    await dBUser.initDB();
    await dBUser.deleteAll();
    await dBUser.insertUsers(user).then(
      (value) {
        _checkAuthLock(value.user);
      },
    );
    await dBUser.close();
  }

  _checkAuthLock(value) async {
    var objAuth = '';
    var objAuth1 = '';
    objAuth = '{"pass":"","mode": "5","membership_no":"$value"}';

    objAuth1 = '{"pass":"","mode": "8","membership_no":"$value"}';
    Network.fetchAuthCount(objAuth).then((v) => {
          if (MyClass.json(v)[0]["status"].toString() == '1')
            {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LockPin(user: value),
                  ),
                  (Route<dynamic> route) => false)
            }
          else
            {
              Network.fetchAuthCount(objAuth1).then((v1) => {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Pins(
                                  gettitle: 'setPassword',
                                )),
                        (Route<dynamic> route) => false)
                  }),
            }
        });
  }

  _validatUser(String? value) {
    if (value!.isEmpty) {
      return Language.loginLg('memberDetail', widget.lgs);
    }
  }

  _validatPassword(String? value) {
    if (value!.isEmpty) {
      return Language.loginLg('pleaseYourpassword', widget.lgs);
    }
  }

  _initusers() => FutureBuilder(
        future: dBUser.initDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}
          return Center(
            child: snapshot.hasError
                ? Text(snapshot.error.toString())
                : const CircularProgressIndicator(),
          );
        },
      );
}
