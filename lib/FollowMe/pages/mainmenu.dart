import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  final Param param;
  const MainMenu(this.param, {super.key});

  @override
  MainMenuState createState() => MainMenuState();
}

var _colorMenu = const Color(0xCCFFFFFF);
var _colorBorderMenu = const Color(0x00000000);

class Menu {
  final String title;
  final String img;
  final String page;

  const Menu({required this.title, required this.img, required this.page});
}

final List<Menu> menus = <Menu>[
  const Menu(title: "share", img: 'assets/imgs/share.png', page: '/share'),
  const Menu(title: "loan", img: 'assets/imgs/loan.png', page: '/loan'),
  const Menu(
      title: "deposit", img: 'assets/imgs/deposit.png', page: '/deposit'),
  const Menu(
      title: "guarantee", img: 'assets/imgs/guarantee.png', page: '/guarantee'),
  const Menu(title: "kept", img: 'assets/imgs/kept.png', page: '/kept'),
  const Menu(
      title: "dividend", img: 'assets/imgs/dividend.png', page: '/dividend'),
  const Menu(title: "gain", img: 'assets/imgs/gain.png', page: '/gain'),
  const Menu(
      title: "requestforwelfare",
      img: 'assets/imgs/RequestWelfare.png',
      page: '/requestforwelfare'),

  /* const Menu(
      title: "welfare", img: 'assets/imgs/welfare.png', page: '/welfare'),
  const Menu(
      title: "cremation", img: 'assets/imgs/cremation.png', page: '/cremation'),
  const Menu(
      title: "paymentbirthday",
      img: 'assets/imgs/paymentbirthday.png',
      page: '/paymentbirthday'),
  const Menu(title: "retire", img: 'assets/imgs/retire.png', page: '/retire'),
  const Menu(
      title: "welfarereceive",
      img: 'assets/imgs/welfarereceive.png',
      page: '/welfarereceive'),
  const Menu(
      title: "creditinsure",
      img: 'assets/imgs/creditinsure.png',
      page: '/creditinsure'),
  const Menu(
      title: "grouplife", img: 'assets/imgs/grouplife.png', page: '/grouplife'),
  const Menu(
      title: "welmaster", img: 'assets/imgs/welmaster.png', page: '/welmaster'),*/
  // const Menu(title: "", img: '', page: ''),
];

class Tab {
  final String title;
  final IconData icon;

  const Tab({required this.title, required this.icon});
}

class MainMenuState extends State<MainMenu> {
  String? imgprofile;
  Random random = Random();

  Future<bool> _onBackPressed() async {
    // return showDialog<void>(context: context);
    return await showDialog(
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
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ตกลง',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
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
  }

  @override
  void initState() {
    super.initState();
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membershipNo}.jpg?';
    // ${random.nextInt(100000000)}
    // initMessaging();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // initMessaging();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'prompt'),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: CustomUI.appbarUiMainMenu(
        //     imgprofile, _msgstatus, widget.param, '0', context),
        appBar: AppBarUiMainMenu(
          url: imgprofile!,
          param: widget.param,
          groupID: '0',
          tabletMode: tabletMode,
          context: context,
        ),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: tabletMode
                        ? const AssetImage("assets/imgs/bg1.jpg")
                        : const AssetImage("assets/imgs/bg1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      // top: tabletMode ? 200 : 160,
                      left: 20,
                      right: 20,
                      // bottom: Platform.isAndroid ? 100 : 125
                    ),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverPadding(
                          padding: EdgeInsets.only(
                              top: tabletMode ? 100 : 60,
                              bottom: Platform.isAndroid ? 100 : 125),
                          sliver: SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: tabletMode ? 4 : 3),
                            delegate: SliverChildListDelegate(
                              List.generate(
                                menus.length,
                                (index) => Padding(
                                  padding: tabletMode
                                      ? const EdgeInsets.all(10.0)
                                      : const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: _colorMenu,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset:
                                                  Offset.fromDirection(0, 2.0),
                                              blurRadius: 6.0,
                                              spreadRadius: 1.0)
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: _colorBorderMenu, width: 1)),
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Image.asset(
                                              menus[index].img,
                                              fit: BoxFit.contain,
                                              width: tabletMode ? 100 : 50,
                                              height: tabletMode ? 100 : 50,
                                            ),
                                          ),
                                          AutoSizeText(
                                            Language.menuLg(menus[index].title,
                                                widget.param.lgs),
                                            textAlign: TextAlign.center,
                                            textScaleFactor:
                                                MyClass.blocFontSizeApp(
                                                    widget.param.fontsizeapps),
                                            style: TextStyle(
                                              fontSize: tabletMode ? 23 : 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxFontSize: tabletMode ? 30 : 20,
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, menus[index].page);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
