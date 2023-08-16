import 'dart:io';

import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/pages/linkAccount/link_account.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class CustomUIPro {
  static AppBar appbarUiMainMenu(url, name, lgs, fontsizeapps, token, cooptoken,
      accountStatus, param, msgstatus, bankNo, bankAccNo, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Platform.isAndroid
            ? 50
            : (tabletMode && Platform.isIOS)
                ? 50
                : 30),
        child: Container(),
      ),
      shadowColor: const Color(0x99000000),
      elevation: 10,
      leadingWidth: 80,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            )),
        child: Padding(
          padding: Platform.isAndroid
              ? const EdgeInsets.only(top: 30, left: 15, bottom: 15)
              : const EdgeInsets.only(top: 10, left: 15, bottom: 15),
          child: SafeArea(
            child: tabletMode
                ? Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/imgs/boy.jpg'),
                          child: ClipOval(
                            child: Image.network(
                              url,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                    '${MyClass.hostApp()}/public/member/profile/boy.jpg');
                              },
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(Language.menuLg('welcome', param.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.titleWTxt(
                                    context, tabletMode ? -22 : -7)),
                          ),
                          Expanded(
                            child: Text(param.name,
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.titleWTxt(
                                    context, tabletMode ? -29 : -12)),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: tabletMode ? 80 : 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/imgs/boy.jpg'),
                          child: ClipOval(
                            child: Image.network(
                              url,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                    '${MyClass.hostApp()}/public/member/profile/boy.jpg');
                              },
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Language.menuLg('welcome', param.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(param.fontsizeapps),
                              style: CustomTextStyle.titleWTxt(
                                  context, tabletMode ? -20 : -7)),
                          Text(param.name,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(param.fontsizeapps),
                              style: CustomTextStyle.titleWTxt(
                                  context, tabletMode ? -29 : -11)),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
      actions: [
        bankNo == '00'
            ? Container()
            : Padding(
                padding: EdgeInsets.only(
                    top: Platform.isAndroid ? 26 : 13, right: 15),
                child: IconButton(
                  icon: const Icon(Icons.link, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LinkAccount(
                            accountStatusBay: accountStatus,
                            param: param,
                            bankNo: bankNo,
                            bankAccNo: bankAccNo),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }

  static AppBar appbarUi() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            )),
      ),
      elevation: 10,
    );
  }

  static AppBar appbarUi1() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static AppBar appbarUi2() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static AppBar appbarDetailUiPro(url, name, f, l, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Platform.isAndroid
            ? 10
            : (Platform.isIOS && tabletMode)
                ? 10
                : 0),
        child: Container(),
      ),
      shadowColor: const Color(0x99000000),
      elevation: 10,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            )),
      ),
      backgroundColor: const Color(0x00000000),
      title: Container(
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.only(
        //     // top: displayHeight(context) * 0.05,
        //     left: displayWidth(context) * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              url,
              width: tabletMode
                  ? displayWidth(context) * 0.1
                  : displayWidth(context) * 0.1,
              height: tabletMode
                  ? displayWidth(context) * 0.1
                  : displayWidth(context) * 0.1,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const Text('   '),
                Text(
                  LanguagePro.menuPro(name, l),
                  textScaleFactor: MyClassPro.fontSizeApp(f),
                  style: CustomTextStylePro.defaultTxtC(context, 6, 'w'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Container appbarDetailUiPro1(url, name, f, l, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
          top: displayHeight(context) * 0.05,
          left: displayWidth(context) * 0.1),
      child: Row(
        children: [
          Image.asset(
            url,
            width: tabletMode
                ? displayWidth(context) * 0.1
                : displayWidth(context) * 0.1,
            height: tabletMode
                ? displayWidth(context) * 0.1
                : displayWidth(context) * 0.1,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text(
                LanguagePro.menuPro(name, l),
                textScaleFactor: MyClassPro.fontSizeApp(f),
                style: CustomTextStylePro.defaultTxt1(context, 2),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PhotoViewScreen extends StatelessWidget {
  final String url;

  const PhotoViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: PhotoView(
            imageProvider: AssetImage(url),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
