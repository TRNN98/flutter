import 'dart:io' show Platform;
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class About extends StatefulWidget {
  final Param param;
  const About(this.param, {super.key});
  @override
  AboutState createState() => AboutState();
}

class DeviceInfo {
  DeviceInfo() {
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

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

class AboutState extends State<About> {
  DeviceInfo device = DeviceInfo();

  void getDevice() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device.name = androidInfo.device;
      device.platform = androidInfo.product;
      device.version = androidInfo.version.release;
      device.model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device.name = iosInfo.name;
      device.platform = iosInfo.systemName;
      device.version = iosInfo.systemVersion;
      device.model = iosInfo.model;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    getDevice();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.settingLg('about', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.030
                        : displayHeight(context) * 0.025,
                  ),
                  _versionApp(context, widget.param.lgs),
                  _versionMobile(device, context, widget.param.lgs),
                ],
              ),
            ),
          ),
          // CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarUi(),
          // CustomUI.appbarTxtTitleUi(
          //     Language.settingLg('about', widget.param.lgs),
          //     _fontsizeapps,
          //     context),
          // CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }
}

Container _versionApp(context, lgs) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.175,
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
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('LineColor'), width: 8))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Language.settingLg('application', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 3),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Language.settingLg('version', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 3),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            MyClass.versionApp().split('.')[0] +
                                '.' +
                                int.parse(MyClass.versionApp().split('.')[1])
                                    .toString(),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.settingTxt(context, 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container _versionMobile(device, context, lgs) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.25,
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
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('LineColor'), width: 8))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Language.settingLg('mobile', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 3),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Language.settingLg('version', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 3),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            device.version,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.settingTxt(context, 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Language.settingLg('platform', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 3),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            device.platform,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.settingTxt(context, 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Language.settingLg('model', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 3),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            device.model,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.settingTxt(context, 3),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
