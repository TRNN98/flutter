import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/pages/intro/intro_screen.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/locals/db_pin.dart';
import 'package:mwasc/FollowMe/models/sql/pin_db.dart';
import 'package:flutter/material.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  PinDb pin = PinDb();

  late DBPin dBPin;

  @override
  void initState() {
    dBPin = DBPin();
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      _getversions();
    });
  }

  @override
  void dispose() {
    dBPin.close();
    super.dispose();
  }

  _authCheckPinCode() async {
    await dBPin.initDB();
    await dBPin.getPins().then((value) => {_checkpin(MyClass.json(value))});
  }

  _checkpin(pi) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const Otp(),
    //   ),
    // );
    if (pi.length > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Pins(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ),
      );
    }
  }

  _getversions() {
    Network.fetchVersions('{}').then((value) => _checkversion(value));
  }

  _checkversion(v) {
    if (Platform.isAndroid) {
      double.parse(v[0]['fandroid']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'a')
          : double.parse(v[0]['vandroid']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'a')
              : _authCheckPinCode();
      // : null;
      // : _authTF();
    } else if (Platform.isIOS) {
      double.parse(v[0]['fios']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'i')
          : double.parse(v[0]['vios']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'i')
              : _authCheckPinCode();
      // : null;
      // : _authTF();
    }
  }

  _showupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(Language.pinLg('uversion', 'th'),
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
          content: Text(v[0]['msg'],
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl')),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('no', 'th'),
                style: CustomTextStyle.dataHTxt(context, 3, 'R'),
              ),
              onPressed: () {
                _authCheckPinCode();
                // Navigator.of(context).pop();
                // _authTF();
              },
            ),
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('yes', 'th'),
                style: CustomTextStyle.dataHTxt(context, 3, 'B'),
              ),
              onPressed: () {
                _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
              },
            ),
          ],
        );
      },
    );
  }

  _showfupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(Language.pinLg('fversion', 'th'),
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
          content: Text(v[0]['fmsg'],
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl')),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                Language.pinLg('update', 'th'),
                style: CustomTextStyle.dataHTxt(context, 4, 'B'),
              ),
              onPressed: () {
                _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: MyClass.splash(),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
