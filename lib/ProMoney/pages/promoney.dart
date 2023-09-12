import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/carditem.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/models/account/account_model.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class/mycolorpro.dart';

class ParamPro {
  String img;
  String img1;
  String type;
  String note;
  String imei;

  ParamPro(
    this.img,
    this.img1,
    this.type,
    this.note,
    this.imei,
  );
}

double fontsizeapps = 1.0;
String chare = '';

class Promoney extends StatefulWidget {
  final Param param;
  final String imei;
  final String bankNo;
  final String bankAccNo;

  const Promoney(
      {super.key,
      required this.imei,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  PromoneyState createState() => PromoneyState();
}

var _colorMenu = const Color(0xDDFFFFFF);

class MenuPro {
  String title;
  String img;
  String page;

  MenuPro({required this.title, required this.img, required this.page});
}

List<MenuPro> menuPros = <MenuPro>[
  MenuPro(title: "tran", img: 'assets/imgPro/tran.png', page: '/tran'),
  MenuPro(
      title: "withDrawBank",
      img: 'assets/imgPro/withDrawBank.png',
      page: '/withDrawBank'),
  MenuPro(
      title: "tranbank", img: 'assets/imgPro/tranbanks.png', page: '/tranbank'),
  MenuPro(title: "pay", img: 'assets/imgPro/pay.png', page: '/pay'),
  MenuPro(
      title: "drawLoan", img: 'assets/imgPro/drawLoan.png', page: '/drawLoan'),
  MenuPro(
      title: "loanpayment",
      img: 'assets/imgPro/withDrawBank.png',
      page: '/loanpayment'),
  // MenuPro(
  //     title: "diluteShares",
  //     img: 'assets/imgPro/DiluteShares.png',
  //     page: '/diluteShares'),
  // MenuPro(
  //     title: "calculate",
  //     img: 'assets/imgPro/calculate.png',
  //     page: '/calculate'),
  MenuPro(title: "history", img: 'assets/imgPro/history.png', page: '/history'),
];

List cardList = [];
List accountList = [];

class PromoneyState extends State<Promoney> {
  int _currentIndex = 0;
  late String accountBay;
  int accountStatus = 0;
  final int _msgstatus = 0;
  bool loadingAccount = true;

  Future<List<AccountModel>> _getAccoutall() async {
    loadingAccount = true;
    await NetworkPro.fetchAccount(
            '{}', widget.param.token, widget.param.cooptoken, context)
        .then(
      (value) => {
        _account(value),
        loadingAccount = false,
      },
    );
    throw Exception('Failed to load fetchAccount on promoney');
  }

  _account(value) {
    cardList = [];
    accountList = value[0].result;
    _saveAccountAll(value[0].result);
    value[0].result!.forEach((account) {
      if (account.mobileFlag == 'Y') {
        setState(() {
          cardList.add(AccountItem(
            title: account.coopAccountName,
            accountDesc: account.coopAccountDesc,
            accountId: account.coopAccountNo,
            remainingAmount: MyClass.checkDouble(account.accountBalance),
            withdrawalAmount: MyClass.checkDouble(account.avaliableBalance),
            fontsizeapps: widget.param.fontsizeapps.toDouble(),
            lgs: widget.param.lgs,
            outstandingBalance: MyClass.checkDouble(account.outstandingBalance),
            withdrawFlag: account.withdrawFlag,
            type: account.coopAccountType,
          ));
        });
      }
    });
  }

  _saveAccountAll(s) async {
    dynamic a;
    a = s;
    s = '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(a).toString();
    await prefs.setString('accountAll', rawJson);
  }

  // _saveAccountBay(s) async {
  //   dynamic a;
  //   a = s;
  //   s = '';
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String rawJson = jsonEncode(a);
  //   await prefs.setString('accountBay', rawJson);
  // }

  hiddenDialog(n) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  // _linkAccount() {
  //   NetworkPro.fetchLinkAccount(
  //           '{}', widget.param.token, widget.param.cooptoken, context)
  //       .then((value) => {
  //             if (value.isEmpty)
  //               {
  //                 accountStatus = 0,
  //                 // _checklinkbank(0),
  //               }
  //             else
  //               {
  //                 _saveAccountBay(value[0].url),
  //                 accountBay = value[0].url.toString(),
  //                 accountStatus = 1,
  //                 // _checklinkbank(1),
  //               }
  //           });
  // }

  // _checklinkbank(s) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('banklink', s);
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    _getAccoutall();
    // _linkAccount();
  }

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
              style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
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
  Widget build(BuildContext context) {
    bool tabletMode = MyClass.tabletMode(context);
    fontsizeapps = widget.param.fontsizeapps;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'prompt'),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarUiMainMenu(
            '${MyClass.hostApp()}/public/member/profile/${widget.param.membershipNo}.jpg',
            widget.param.name,
            widget.param.lgs,
            widget.param.fontsizeapps,
            widget.param.token,
            widget.param.cooptoken,
            accountStatus,
            widget.param,
            _msgstatus,
            widget.bankNo,
            widget.bankAccNo,
            context),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: MyClass.backGround(),
                child: SafeArea(
                  child: loadingAccount
                      ? Container(
                          child: MyClass.loading(),
                        )
                      : Column(
                          children: [
                            Column(
                              children: <Widget>[
                                lineSizedBox(context, -20),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    disableCenter: true,
                                    height: displayHeight(context) * 0.21,
                                    aspectRatio: 12.0,
                                    viewportFraction: 0.9,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                  ),
                                  items: cardList.map((card) {
                                    return Builder(
                                        builder: (BuildContext context) {
                                      return SizedBox(
                                        // height: MediaQuery.of(context).size.height * 0.30,
                                        width: displayWidth(context) * 0.65,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7, bottom: 7),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.6),
                                                      offset:
                                                          Offset.fromDirection(
                                                              0, 2.0),
                                                      blurRadius: 6.0,
                                                      spreadRadius: 1.0)
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: <Color>[
                                                    Color(0xFF47A5FF),
                                                    Color(0xFF66C8FF),
                                                  ],
                                                )),
                                            child: card,
                                          ),
                                        ),
                                      );
                                    });
                                  }).toList(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: MyClassPro.cardMap<Widget>(cardList,
                                      (index, url) {
                                    return Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index
                                            ? const Color(0xFF2192FF)
                                            : Colors.white,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: CustomScrollView(
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Platform.isAndroid ? 100 : 125),
                                      sliver: SliverGrid(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    tabletMode ? 4 : 3),
                                        delegate: SliverChildListDelegate(
                                          List.generate(
                                            menuPros.length,
                                            (index) => Padding(
                                              padding: tabletMode
                                                  ? const EdgeInsets.all(10.0)
                                                  : const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: _colorMenu,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        offset: Offset
                                                            .fromDirection(
                                                                0, 2.0),
                                                        blurRadius: 6.0,
                                                        spreadRadius: 1.0)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  // border: Border.all(
                                                  //     color: _colorMenu,
                                                  //     width: 2)
                                                ),
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: InkWell(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Image.asset(
                                                          menuPros[index].img,
                                                          fit: BoxFit.contain,
                                                          width: tabletMode
                                                              ? 100
                                                              : 70,
                                                          height: tabletMode
                                                              ? 100
                                                              : 70,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        LanguagePro.menuPro(
                                                            menuPros[index]
                                                                .title,
                                                            widget.param.lgs),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor:
                                                            MyClassPro
                                                                .fontSizeApp(
                                                                    fontsizeapps),
                                                        style: TextStyle(
                                                          fontSize: tabletMode
                                                              ? 25
                                                              : 14,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        maxFontSize: tabletMode
                                                            ? 30
                                                            : 20,
                                                      )
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    // if (menuPros[index].page ==
                                                    //     '/tran') {
                                                    //   _saveAccount(MyClass.json(
                                                    //       accountList[
                                                    //           _currentIndex]));
                                                    // }
                                                    // if (menuPros[index].page ==
                                                    //         '/withDrawBank' ||
                                                    //     menuPros[index].page ==
                                                    //         '/tranbank' ||
                                                    //     menuPros[index].page ==
                                                    //         '/drawLoan') {
                                                    //   _showAlert(
                                                    //       'ยังไม่เปิดให้บริการ',
                                                    //       context,
                                                    //       widget.param.lgs);
                                                    // } else {
                                                    Navigator.pushNamed(context,
                                                        menuPros[index].page);
                                                    // }
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
                          ],
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
