import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/pages/msg/msg.dart';
import 'package:mwasc/FollowMe/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:mwasc/FollowMe/services/network.dart';

import 'dart:io' show Platform;

class CustomUI {
  static Padding appbarTxtTitleUi2(txt, fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.28,
        bottom: displayHeight(context) * 0.3,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              style: CustomTextStyle.titleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  static Widget headprofile(context, lgs, fontsizeapps, name) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: MyColor.color('SettingBackground'),
        ),
        child: Container(
          decoration: const BoxDecoration(

              // border: Border(
              //     bottom:
              //         BorderSide(color: MyColor.color('LineColor'), width: 5))
              ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
                      style: CustomTextStyle.dataHeadDataTxt(context, 5)),
                ],
              ),
              // Expanded(
              //   child: Align(
              //     alignment: FractionalOffset.bottomCenter,
              //     child: Padding(
              //       padding: EdgeInsets.only(bottom: 10.0),
              //       child: Divider(
              //         color: Colors.black,
              //         height: 20,
              //         thickness: 2,
              //         indent: 10,
              //         endIndent: 10,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  static AppBar appbarUi(title, fontsizeapps, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return AppBar(
      iconTheme: const IconThemeData(
        color: Color(0xFF2192FF),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Platform.isAndroid
            ? 10
            : (Platform.isIOS && tabletMode)
                ? 10
                : 0),
        child: Container(),
      ),
      shadowColor: Color.fromARGB(0, 0, 0, 0),
      backgroundColor: Colors.transparent,
      title: Text(title,
          textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
          style: CustomTextStyle.subTitleTxt(
              context, (Platform.isIOS && tabletMode) ? -5 : 0)),
    );
  }

  static AppBar appbarUiMainMenu(
      url, msgstatus, Param param, groupID, context) {
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
                          radius: tabletMode ? 40 : 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          child: CircleAvatar(
                              radius: tabletMode ? 40 : 40,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(url)),
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
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          child: CircleAvatar(
                              radius: tabletMode ? 80 : 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(url)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
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
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 26 : 13),
          child: IconButton(
            icon: msgstatus.toString() == '0'
                ? const Icon(Icons.notifications, color: Color(0xFF2192FF))
                : Badge(
                    label: Text(msgstatus.toString()),
                    child: const Icon(Icons.notifications,
                        color: Color(0xFF2192FF)),
                  ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Msgs(param: param, groupID: "1")),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 26 : 13),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF2192FF)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(param),
                ),
              );
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: Platform.isAndroid ? 26 : 13, right: 15),
          child: IconButton(
            icon:
                const Icon(Icons.power_settings_new, color: Color(0xFF2192FF)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        'ออกจากแอปพลิเคชัน',
                        style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                      ),
                      content: Text(
                        'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text(
                            'ยกเลิก',
                            style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text(
                            'ตกลง',
                            style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                          ),
                          onPressed: () {
                            Platform.isIOS
                                ? FlutterExitApp.exitApp(iosForceExit: true)
                                : FlutterExitApp.exitApp();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }

  static Container appbarDetailUi(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Container(
      alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(top: displayHeight(context) * 0.075),
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.1
            : displayWidth(context) * 0.2,
        height: tabletMode
            ? displayWidth(context) * 0.1
            : displayWidth(context) * 0.2,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.only(
          top: displayHeight(context) * (tabletMode ? 0.09 : 0.08)),
      alignment: Alignment.topCenter,
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.37,
        height: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.37,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi2(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.13),
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.25,
        height: tabletMode
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi3(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      padding: EdgeInsets.only(
          top: displayHeight(context) * (tabletMode ? 0.05 : 0.02)),
      alignment: Alignment.topCenter,
      child: Image.asset(
        url,
        width: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.32,
        height: tabletMode
            ? displayWidth(context) * 0.22
            : displayWidth(context) * 0.32,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUiPro(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.05),
      child: CircleAvatar(
        radius: tabletMode ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage:
            NetworkImage('${MyClass.hostApp()}/public/member/profile/boy.jpg'),
        child: CircleAvatar(
            radius: tabletMode ? 80 : 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url)),
      ),
    );
  }

  static Container appbarDetailUiPro1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // imageCache.clear();
    return Container(
      alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(top: displayHeight(context) * 0.12),
      child: CircleAvatar(
        radius: tabletMode ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage: const AssetImage('assets/imgs/boy.jpg'),
        child: ClipOval(
          child: Image.network(
            url,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                  '${MyClass.hostApp()}/public/member/profile/boy.jpg');
            },
          ),
        ),
        // child: CircleAvatar(
        //   radius: tabletMode ? 80 : 40,
        //   backgroundColor: Colors.transparent,
        //   backgroundImage:
        //       NetworkImage('${MyClass.hostApp()}/public/member/profile/boy.jpg'),
        //   child: CircleAvatar(
        //       radius: tabletMode ? 80 : 40,
        //       backgroundColor: Colors.transparent,
        //       backgroundImage: NetworkImage(url)),
        // ),
      ),
    );
  }

  static Padding appbarBackgroundUi(context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 2.0),
    );
  }

  static Padding appbarTxtTitleUi(txt, fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.05,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              style: CustomTextStyle.titleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  static Padding sliverTxtTitleUi(txt, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.1,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.fontSizeApp(),
              style: CustomTextStyle.titleTxt(context, -15),
            ),
          ),
        ],
      ),
    );
  }
}

class NamedIcon extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  final VoidCallback? onTap;
  final int? notificationCount;

  const NamedIcon({
    super.key,
    this.onTap,
    @required this.text,
    @required this.iconData,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: tabletMode ? 55 : 30,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.white,
                  size: tabletMode ? 45 : 27,
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: notificationCount != 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: tabletMode ? 20 : 4,
                        vertical: tabletMode ? 9 : 7,
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text(
                        '$notificationCount',
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: TextStyle(
                          fontSize: tabletMode ? 23 : 15,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarUiMainMenu extends StatefulWidget implements PreferredSizeWidget {
  AppBarUiMainMenu(
      {super.key,
      required this.url,
      required this.param,
      required this.groupID,
      required this.tabletMode,
      required this.context})
      : preferredSize = Size.fromHeight(Platform.isAndroid
            ? 100
            : (tabletMode && Platform.isIOS)
                ? 125
                : 100);

  final String url;
  final Param param;
  final String groupID;
  final bool tabletMode;
  final dynamic context;

  @override
  final Size preferredSize;

  @override
  State<AppBarUiMainMenu> createState() => _AppBarUiMainMenuState();
}

class _AppBarUiMainMenuState extends State<AppBarUiMainMenu> {
  int _msgstatus = 0;
  Future<void> getMsgStatus() async {
    var objMsgStatus = '{"mode": "3","message_type":"0"}';
    final List msg =
        await Network.fetchMsgStatus(objMsgStatus, widget.param.token, context);
    setState(() {
      _msgstatus = MyClass.json(msg)[0]['countStatus'];
    });
  }

  @override
  void initState() {
    super.initState();
    getMsgStatus();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // shadowColor: const Color(0x99000000),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        // decoration: BoxDecoration(
        //     borderRadius: const BorderRadius.only(
        //         bottomLeft: Radius.circular(25),
        //         bottomRight: Radius.circular(25)),
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: <Color>[
        //         MyColor.color('buttongra'),
        //         MyColor.color('buttongra1'),
        //       ],
        //     )),
        child: Padding(
          padding: Platform.isAndroid
              ? const EdgeInsets.only(top: 15, left: 15, bottom: 15)
              : const EdgeInsets.only(top: 15, left: 15, bottom: 15),
          child: SafeArea(
            child: widget.tabletMode
                ? Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/imgs/boy.jpg'),
                          child: ClipOval(
                            child: Image.network(
                              widget.url,
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                                Language.menuLg('welcome', widget.param.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.titleWTxt(widget.context,
                                    widget.tabletMode ? -18 : -7)),
                          ),
                          Expanded(
                            child: Text(widget.param.name,
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.titleWTxt(widget.context,
                                    widget.tabletMode ? -28 : -12)),
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
                          radius: widget.tabletMode ? 80 : 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              const AssetImage('assets/imgs/boy.jpg'),
                          child: ClipOval(
                            child: Image.network(
                              widget.url,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                    '${MyClass.hostApp()}/public/member/profile/boy.jpg');
                              },
                            ),
                          ),
                          // backgroundImage: Image.network(widget.url)
                          // NetworkImage(
                          //     '${MyClass.hostApp()}/public/member/profile/boy.jpg'),
                          // child: CircleAvatar(
                          //     radius: widget.tabletMode ? 80 : 30,
                          //     backgroundColor: Colors.transparent,
                          //     backgroundImage: NetworkImage(widget.url)),
                          // onBackgroundImageError: (_, __) {},
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(Language.menuLg('welcome', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.titleWTxt(widget.context,
                                  widget.tabletMode ? -20 : -7)),
                          Text(widget.param.name,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.titleWTxt(widget.context,
                                  widget.tabletMode ? -29 : -11)),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 25 : 25),
          child: IconButton(
            icon: _msgstatus.toString() == '0'
                ? const Icon(Icons.notifications, color: Color(0xFF2192FF))
                : Badge(
                    label: Text(_msgstatus.toString()),
                    child: const Icon(Icons.notifications,
                        color: Color(0xFF2192FF)),
                  ),
            onPressed: () {
              Navigator.push(
                widget.context,
                MaterialPageRoute(
                  builder: (context) => Msgs(param: widget.param, groupID: "1"),
                ),
              ).whenComplete(() => getMsgStatus());
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Platform.isAndroid ? 25 : 25),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF2192FF)),
            onPressed: () {
              Navigator.push(
                widget.context,
                MaterialPageRoute(
                  builder: (context) => Setting(widget.param),
                ),
              );
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: Platform.isAndroid ? 25 : 25, right: 15),
          child: IconButton(
            icon:
                const Icon(Icons.power_settings_new, color: Color(0xFF2192FF)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        'ออกจากแอปพลิเคชัน',
                        style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
                      ),
                      content: Text(
                        'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
                        style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text(
                            'ยกเลิก',
                            style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text(
                            'ตกลง',
                            style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                          ),
                          onPressed: () {
                            Platform.isIOS
                                ? FlutterExitApp.exitApp(iosForceExit: true)
                                : FlutterExitApp.exitApp();
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
