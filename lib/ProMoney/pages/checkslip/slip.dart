import 'dart:io';

import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/pages/promoney.dart';
import 'package:udtscc/root/tabs.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

class Slip extends StatefulWidget {
  final Param param;
  final ParamPro paramPro;
  final dynamic data;

  const Slip({
    super.key,
    required this.param,
    required this.paramPro,
    required this.data,
  });

  @override
  SlipState createState() => SlipState();
}

class SlipState extends State<Slip> {
  ScreenshotController screenshotController = ScreenshotController();
  var checkSave = 0;

  _save(date) async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 350))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        // await Share.shareFiles([imagePath.path]);
        _saveimg(image, date);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _save(DateTime.now().year.toString() +
        DateTime.now().month.toString() +
        DateTime.now().day.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().minute.toString() +
        DateTime.now().second.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            height: displayHeight(context),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.1
                          : displayHeight(context) * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.05),
                      child: Screenshot(
                        controller: screenshotController,
                        child: Card(
                          color: MyColorPro.color('w'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 8,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/imgPro/iconOpacity1.png"),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    LanguagePro.tranPro(
                                        'approveIV', widget.param.lgs),
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style:
                                        CustomTextStylePro.titleTxt(context, 0),
                                  ),
                                  _checkref(
                                      widget.paramPro.type,
                                      widget.data['transaction_date'],
                                      widget.data['receipt_no'],
                                      widget.data['vourcher_no']),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                            widget.paramPro.img == 'icon'
                                                ? 'assets/imgs/icon.png'
                                                : 'assets/imgPro/ktb.png',
                                            width:
                                                displayWidth(context) * 0.15),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              checkAccountNameFrom(),
                                              textAlign: TextAlign.end,
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style: CustomTextStylePro
                                                  .detailTxtLight(context, 1),
                                            ),
                                            Text(
                                              checkAccountNoFrom(),
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style:
                                                  CustomTextStylePro.detailTxt(
                                                      context, 5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Divider(
                                          indent: 15,
                                          endIndent: 5,
                                          height: 20,
                                          thickness: 4,
                                          color: MyColorPro.color('b'),
                                        ),
                                      ),
                                      Image.asset('assets/imgPro/load.png',
                                          width: displayWidth(context) * 0.1),
                                      Expanded(
                                        flex: 1,
                                        child: Divider(
                                          indent: 5,
                                          endIndent: 15,
                                          height: 20,
                                          thickness: 4,
                                          color: MyColorPro.color('b'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                            widget.paramPro.img1 == 'icon'
                                                ? 'assets/imgs/icon.png'
                                                : 'assets/imgPro/ktb.png',
                                            width:
                                                displayWidth(context) * 0.15),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              checkAccountNameTo(),
                                              textAlign: TextAlign.end,
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style: CustomTextStylePro
                                                  .detailTxtLight(context, 1),
                                            ),
                                            Text(
                                              checkAccountNoTo(),
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style:
                                                  CustomTextStylePro.detailTxt(
                                                      context, 5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LanguagePro.tranPro(
                                              'amount', widget.param.lgs),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Text(
                                          MyClass.formatNumber(widget
                                                  .data['transaction_amount']) +
                                              MyClassPro.currency(),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style:
                                              CustomTextStylePro.detailTxtLight(
                                                  context, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LanguagePro.tranPro(
                                              'fee', widget.param.lgs),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Text(
                                          MyClass.formatNumber(widget
                                                  .data['transaction_fee']) +
                                              MyClassPro.currency(),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style:
                                              CustomTextStylePro.detailTxtLight(
                                                  context, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  widget.paramPro.type == 'pay'
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguagePro.payPro(
                                                    'principalAmount',
                                                    widget.param.lgs),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxt(context, 3),
                                              ),
                                              Text(
                                                MyClass.formatNumber(widget
                                                            .data[
                                                        'principal_amount']) +
                                                    MyClassPro.currency(),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxtLight(context, 3),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  widget.paramPro.type == 'loanpayment'
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguagePro.payPro(
                                                    'principalAmount',
                                                    widget.param.lgs),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxt(context, 3),
                                              ),
                                              Text(
                                                MyClass.formatNumber(widget
                                                            .data[
                                                        'principal_amount']) +
                                                    MyClassPro.currency(),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxtLight(context, 3),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  widget.paramPro.type == 'pay'
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguagePro.payPro(
                                                    'interestAmount',
                                                    widget.param.lgs),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxt(context, 3),
                                              ),
                                              Text(
                                                MyClass.formatNumber(widget
                                                            .data[
                                                        'interest_amount']) +
                                                    MyClassPro.currency(),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxtLight(context, 3),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  widget.paramPro.type == 'loanpayment'
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguagePro.payPro(
                                                    'interestAmount',
                                                    widget.param.lgs),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxt(context, 3),
                                              ),
                                              Text(
                                                MyClass.formatNumber(widget
                                                            .data[
                                                        'interest_amount']) +
                                                    MyClassPro.currency(),
                                                textScaleFactor:
                                                    MyClassPro.fontSizeApp(
                                                        widget.param
                                                            .fontsizeapps),
                                                style: CustomTextStylePro
                                                    .detailTxtLight(context, 3),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LanguagePro.tranPro(
                                              'date', widget.param.lgs),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Text(
                                          MyClassPro.formatDatePro(
                                              widget.data['transaction_date']),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style:
                                              CustomTextStylePro.detailTxtLight(
                                                  context, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LanguagePro.other(
                                                  'note', widget.param.lgs) +
                                              "  ",
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.paramPro.note,
                                            textAlign: TextAlign.right,
                                            textScaleFactor:
                                                MyClassPro.fontSizeApp(
                                                    widget.param.fontsizeapps),
                                            style: CustomTextStylePro
                                                .detailTxtLight(context, 3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) * 0.025,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.1,
                          right: displayWidth(context) * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      _save(DateTime.now().year.toString() +
                                          DateTime.now().month.toString() +
                                          DateTime.now().day.toString() +
                                          DateTime.now().hour.toString() +
                                          DateTime.now().minute.toString() +
                                          DateTime.now().second.toString());
                                    },
                                    backgroundColor: MyColorPro.color('w'),
                                    // tooltip: 'Increment Counter',
                                    child: Icon(
                                      Icons.download_outlined,
                                      color: MyColorPro.color('detail'),
                                      size: displayWidth(context) * 0.08,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                LanguagePro.tranPro('save', widget.param.lgs),
                                textScaleFactor: MyClassPro.fontSizeApp(
                                    widget.param.fontsizeapps),
                                style:
                                    CustomTextStylePro.titleTxt(context, -10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.03,
                    ),
                    // _save(),
                    checkSave == 1
                        ? Container(
                            width: displayWidth(context) * 0.8,
                            height: displayHeight(context) * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  MyColorPro.color('gr'),
                                  MyColorPro.color('gr1'),
                                ],
                              ),
                            ),
                            // padding: const EdgeInsets.only(top: displayHeight(context) * 0.06,),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Tabs(widget.param)),
                                    (Route<dynamic> route) => false);
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Tabs(widget.param),
                                //   ),
                                // );
                              },
                              child: Center(
                                child: Text(
                                  LanguagePro.tranPro(
                                      'completed', widget.param.lgs),
                                  textScaleFactor: MyClassPro.fontSizeApp(
                                      widget.param.fontsizeapps),
                                  style:
                                      CustomTextStylePro.buttonTxt(context, 0),
                                ),
                              ),
                            ),
                          )
                        : const Text(""),
                    lineSizedBox(context, 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkref(type, transactionDate, receipt, vourcher) {
    var receiptNo = MyClassPro.checkNull(receipt);
    var vourcherNo = MyClassPro.checkNull(vourcher);
    if (receiptNo != '') {
      receiptNo = 'R($receiptNo)';
    }
    if (vourcherNo != '') {
      vourcherNo = 'V($vourcherNo)';
    }
    return Text(
      'รหัสอ้างอิง : $transactionDate\n$vourcherNo',
      textScaleFactor: MyClassPro.fontSizeApp(widget.param.fontsizeapps),
      textAlign: TextAlign.center,
      style: CustomTextStylePro.detailTxt(context, -3),
    );
  }

  checkAccountNameFrom() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(widget.data['from_account_name']);

      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkNull(widget.data['result']['from_account_name']);
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkNull(widget.datacheck['receiverName']);
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(widget.data['from_account_name']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(widget.data['from_account_name']);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(widget.data['to_account_name']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(widget.data['from_account_name']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(widget.data['from_account_name']);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }

  checkAccountNoFrom() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkFormatAccountClose(
          MyClassPro.checkNull(widget.data['from_coop_account_no']), 'tran');
      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(widget.data['result']['to_bay_account_no']),
      //       'withDrawBankToDep');
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(widget.data['result']['from_coop_account_no']),
      //       'pay');
      // } else if (widget.paramPro.type == 'tran' || widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(widget.data['result']['from_coop_account_no']),
      //       'tran');
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(widget.data['result']['from_coop_account_no']),
      //       'tranAccount');
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(widget.data['result']['from_coop_account_no']),
      //       'tranBank');
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(widget.data['result']['from_coop_account_no']),
      //       'tranBank');
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkFormatAccountClose(
          MyClassPro.checkNull(widget.data['from_coop_account_no']),
          widget.paramPro.type);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkFormatAccountClose(
          MyClassPro.checkNull(widget.data['from_coop_account_no']),
          widget.paramPro.type);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkFormatAccountCloseKTB(
          MyClassPro.checkNull(widget.data['from_bay_account_no']),
          widget.paramPro.type);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(widget.data['from_coop_account_no']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkFormatAccountCloseKTB(
          MyClassPro.checkNull(widget.data['from_bay_account_no']),
          widget.paramPro.type);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkFormatAccountClose(
    //       MyClassPro.checkNull(widget.data['from_coop_account_no']),
    //       'buyshare');
    // }
  }

  checkAccountNameTo() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(widget.data['to_account_name']);

      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkNull(widget.data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkNull(widget.data['result']['from_account_name']);
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkNull(widget.datacheck['receiverName']);
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(widget.data['to_account_name']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(widget.data['from_account_name']);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(widget.data['to_account_name']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(widget.data['to_account_name']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(widget.data['to_account_name']);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }

  checkAccountNoTo() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkFormatAccountClose1(
          widget.data['to_coop_account_no'], widget.paramPro.type);

      //   if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       widget.data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       widget.data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       widget.data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       widget.data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(widget.data['result']['to_bay_account_no']),
      //       'tranBank');
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(widget.img.split(',')[1]), 'tranBank');
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkFormatAccountClose1(
          widget.data['to_coop_account_no'], widget.paramPro.type);
    } else if (widget.paramPro.type == 'tranBank') {
      if (widget.paramPro.img1 == 'ktb') {
        return MyClassPro.checkFormatAccountCloseKTB(
            widget.data['to_bay_account_no'], widget.paramPro.type);
      }

      // return MyClassPro.checkFormatBankClose1(
      //     MyClassPro.checkNull(widget.data['result']['to_bay_account_no']),
      //     'tranBank');
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkFormatAccountClose1(
          widget.data['to_coop_account_no'], widget.paramPro.type);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkFormatAccountCloseKTB(
          widget.data['to_bay_account_no'], widget.paramPro.type);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkFormatAccountClose1(
          widget.data['to_coop_account_no'], widget.paramPro.type);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }

  _saveimg(image, date) async {
    if (Platform.isAndroid) {
      if (await Permission.contacts.request().isGranted) {
      } else {}
    }
    await ImageGallerySaver.saveImage(
      Uint8List.fromList(image),
      quality: 60,
      name: date,
    );
    await MyClass.showToast('บันทึกสลิปสำเร็จ');
    setState(() {
      checkSave = 1;
    });
  }

  Future<File> writeCounter(counter) async {
    final file = await counter;

    // Write the file
    return file;
  }

// _saveimg(File image, date, context) async {
//   await ImageGallerySaver.saveImage(
//     image.readAsBytesSync(),
//     quality: 60,
//     name: date,
//   );
//   await MyClass.showToast('บันทึกสลิปสำเร็จ');
//   setState(() {
//     checkSave = 1;
//   });
// }
}
