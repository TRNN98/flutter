import 'package:flutter/cupertino.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:flutter/material.dart';
import 'package:udtscc/root/tabs.dart';

import 'package:url_launcher/url_launcher_string.dart';

double _fontsizeapps = 1.0;

class LinkAccount extends StatefulWidget {
  final int accountStatusBay;
  final Param param;
  final String bankNo;
  final String bankAccNo;

  const LinkAccount(
      {super.key,
      required this.accountStatusBay,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  LinkAccountState createState() => LinkAccountState();
}

class LinkAccountState extends State<LinkAccount> {
  late String uriRedirect;
  late String uriUnlink;
  late int accountStatusbank;

  bool loading = true;

  // Future<List<AccountBayModel>> _linkAccount() {
  //   NetworkPro.fetchLinkAccountBay(
  //           '{}', widget.token, widget.cooptoken, context)
  //       .then((value) => {
  //         print(value),
  //             uriRedirect = value[0].result.url,
  //           });
  // }

  _checkFinish() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Tabs(widget.param)),
        (Route<dynamic> route) => false);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => AccountFinish(param: widget.param)));
  }

  _linkAccount() {
    NetworkPro.fetchLinkAccount(
            '{}', widget.param.token, widget.param.cooptoken, context)
        .then((value) => {
              if (value.isNotEmpty)
                {
                  uriRedirect = value[0].url!,
                  accountStatusbank = 0,
                }
              else
                {
                  accountStatusbank = 1,
                }
            })
        .then(
          (value) => setState(() {
            loading = false;
          }),
        );
  }

  _unlinkAccount() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyClass.loading();
      },
    );
    NetworkPro.fetchUnlinkAccount(
            '{}', widget.param.token, widget.param.cooptoken, context)
        .then((value) => {
              Navigator.of(context, rootNavigator: true).pop(),
              _launchURL(value[0].url!),
            });
  }

  Future<bool> _onCanclePressed() async {
    // return showDialog<void>(context: context);
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ยกเลิกการเชื่อมบัญชี',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการยกเลิกการเชื่อมบัญชีหรือไม่',
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
                  Navigator.pop(context);
                  _unlinkAccount();
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _linkAccount();
    // _unlinkAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarUi2(),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: loading
                  ? Container(child: MyClass.loading())
                  : SafeArea(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomUI.appbarDetailUi(
                              // widget.bankNo == '06'
                              widget.bankAccNo != ''
                                  ? 'assets/imgPro/linked.png'
                                  : 'assets/imgPro/unlinked.png',
                              context),
                          lineSizedBox(context, 0),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                                // widget.bankNo == '06'
                                widget.bankAccNo != ''
                                    ? 'เชื่อมต่อแล้ว'
                                    : 'ยังไม่ได้เชื่อมต่อ',
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 4)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: paddinglist(context, 0),
                                right: paddinglist(context, 0)),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset.fromDirection(0, 2.0),
                                      blurRadius: 6.0,
                                      spreadRadius: 1.0)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: MyColor.color('datatitle'),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 12.0, 15.0, 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      LanguagePro.linkbankLg(
                                          'name', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadTitleTxt(
                                          context, 0),
                                    ),
                                    Text(
                                      widget.param.name,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadDataTxt(
                                          context, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          lineSizedBox(context, -25),
                          Padding(
                            padding: EdgeInsets.only(
                                left: paddinglist(context, 0),
                                right: paddinglist(context, 0)),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset.fromDirection(0, 2.0),
                                      blurRadius: 6.0,
                                      spreadRadius: 1.0)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: MyColor.color('datatitle'),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 12.0, 15.0, 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      LanguagePro.linkbankLg(
                                          'bank', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadTitleTxt(
                                          context, 0),
                                    ),
                                    Text(
                                      // widget.bankNo == '06'
                                      widget.bankAccNo != ''
                                          ? 'กรุงไทย'
                                          : '*ยังไม่ได้เชื่อมต่อบัญชี',
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadDataCTxt(
                                          context, 0, 'Gr'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          lineSizedBox(context, -25),
                          Padding(
                            padding: EdgeInsets.only(
                                left: paddinglist(context, 0),
                                right: paddinglist(context, 0)),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset.fromDirection(0, 2.0),
                                      blurRadius: 6.0,
                                      spreadRadius: 1.0)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: MyColor.color('datatitle'),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 12.0, 15.0, 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      LanguagePro.linkbankLg(
                                          'bankAccNo', widget.param.lgs),
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadTitleTxt(
                                          context, 0),
                                    ),
                                    Text(
                                      // widget.bankNo == '06'
                                      widget.bankAccNo != ''
                                          ? MyClassPro
                                              .checkFormatAccountCloseKTB1(
                                                  widget.bankAccNo, 'tran')
                                          : '*ยังไม่ได้เชื่อมต่อบัญชี',
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataHeadDataCTxt(
                                          context, 0, 'Gr'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          lineSizedBox(context, 0),
                          _onSubmit(),
                        ],
                      ),
                    ),
            ),
          ],
        ));
  }

// _launchURL(String url)  {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//        builder: (context) => WebViewContainer(url)));
//  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
      await _checkFinish();
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _onSubmit() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Text(''),
        ),
        Container(
            width: displayWidth(context) * 0.375,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[MyColor.color('w'), MyColor.color('w')],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'ย้อนกลับ',
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonCTxt(context, 0, 'Bl'),
                ),
              ),
            )),
        const Expanded(
          child: Text(''),
        ),
        // widget.bankNo == '06'
        widget.bankAccNo != ''
            ? Container(
                width: displayWidth(context) * 0.375,
                height: displayHeight(context) * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      MyColor.color('button1'),
                      MyColor.color('button1'),
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    _onCanclePressed();
                  },
                  child: Center(
                    child: Text(
                      'ยกเลิกการเชื่อมต่อ',
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.defaultTxt1(context, -1, 'w'),
                    ),
                  ),
                ),
              )
            : Container(
                width: displayWidth(context) * 0.375,
                height: displayHeight(context) * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      MyColor.color('G'),
                      MyColor.color('G'),
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    _launchURL(uriRedirect);
                  },
                  child: Center(
                    child: Text(
                      'เชื่อมต่อบัญชี',
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.defaultTxt1(context, -1, 'w'),
                    ),
                  ),
                ),
              ),
        const Expanded(
          flex: 2,
          child: Text(''),
        ),
      ],
    );
  }
}
