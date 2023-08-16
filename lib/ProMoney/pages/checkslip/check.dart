import 'dart:convert';

import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/pages/auth/pin_pro.dart';
import 'package:udtscc/promoney/pages/promoney.dart';
import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  final Param param;
  final ParamPro paramPro;
  final dynamic data;

  const Check({
    super.key,
    required this.param,
    required this.paramPro,
    required this.data,
  });

  @override
  CheckState createState() => CheckState();
}

class CheckState extends State<Check> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    data = jsonDecode(widget.data);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUIPro.appbarUi(),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: displayHeight(context) * 0.075),
                  Padding(
                    padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05),
                    child: Card(
                      color: MyColorPro.color('bill'),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      elevation: 8,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              LanguagePro.tranPro(
                                  'checkInformation', widget.param.lgs),
                              textScaleFactor: MyClassPro.fontSizeApp(
                                  widget.param.fontsizeapps),
                              style:
                                  CustomTextStylePro.headTitleTxt(context, 0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                      widget.paramPro.img == 'icon'
                                          ? 'assets/imgs/icon.png'
                                          : 'assets/imgPro/ktb.png',
                                      width: displayWidth(context) * 0.15),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        checkAccountNameFrom(),
                                        textAlign: TextAlign.end,
                                        textScaleFactor: MyClassPro.fontSizeApp(
                                            widget.param.fontsizeapps),
                                        style:
                                            CustomTextStylePro.detailTxtLight(
                                                context, 1),
                                      ),
                                      Text(
                                        checkAccountNoFrom(),
                                        textScaleFactor: MyClassPro.fontSizeApp(
                                            widget.param.fontsizeapps),
                                        style: CustomTextStylePro.detailTxt(
                                            context, 7),
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
                                    thickness: 2,
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
                                    thickness: 2,
                                    color: MyColorPro.color('b'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                      widget.paramPro.img1 == 'icon'
                                          ? 'assets/imgs/icon.png'
                                          : 'assets/imgPro/ktb.png',
                                      width: displayWidth(context) * 0.15),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        checkAccountNameTo(),
                                        textAlign: TextAlign.end,
                                        textScaleFactor: MyClassPro.fontSizeApp(
                                            widget.param.fontsizeapps),
                                        style:
                                            CustomTextStylePro.detailTxtLight(
                                                context, 1),
                                      ),
                                      Text(
                                        checkAccountNoTo(),
                                        textScaleFactor: MyClassPro.fontSizeApp(
                                            widget.param.fontsizeapps),
                                        style: CustomTextStylePro.detailTxt(
                                            context, 7),
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
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStylePro.detailTxt(
                                        context, 3),
                                  ),
                                  Text(
                                    MyClass.formatNumber(
                                            data['transaction_amount']) +
                                        MyClassPro.currency(),
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStylePro.detailTxtLight(
                                        context, 3),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguagePro.tranPro(
                                        'fee', widget.param.lgs),
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStylePro.detailTxt(
                                        context, 3),
                                  ),
                                  Text(
                                    MyClass.formatNumber(
                                            data['transaction_fee']) +
                                        MyClassPro.currency(),
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStylePro.detailTxtLight(
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
                                          LanguagePro.payPro('principalAmount',
                                              widget.param.lgs),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Text(
                                          MyClass.formatNumber(
                                                  data['principal_amount']) +
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
                                  )
                                : widget.paramPro.type == 'loanpayment'
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
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style:
                                                  CustomTextStylePro.detailTxt(
                                                      context, 3),
                                            ),
                                            Text(
                                              MyClass.formatNumber(data[
                                                      'principal_amount']) +
                                                  MyClassPro.currency(),
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
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
                                          LanguagePro.payPro('interestAmount',
                                              widget.param.lgs),
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style: CustomTextStylePro.detailTxt(
                                              context, 3),
                                        ),
                                        Text(
                                          MyClass.formatNumber(
                                                  data['interest_amount']) +
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
                                  )
                                : widget.paramPro.type == 'loanpayment'
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
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style:
                                                  CustomTextStylePro.detailTxt(
                                                      context, 3),
                                            ),
                                            Text(
                                              MyClass.formatNumber(
                                                      data['interest_amount']) +
                                                  MyClassPro.currency(),
                                              textScaleFactor:
                                                  MyClassPro.fontSizeApp(widget
                                                      .param.fontsizeapps),
                                              style: CustomTextStylePro
                                                  .detailTxtLight(context, 3),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                            data['transaction_fee'] == 'ROLLBACK'
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
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
                                          'xxxxxxxx',
                                          textScaleFactor:
                                              MyClassPro.fontSizeApp(
                                                  widget.param.fontsizeapps),
                                          style:
                                              CustomTextStylePro.detailTxtLight(
                                                  context, 3),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguagePro.other(
                                            'note', widget.param.lgs) +
                                        "  ",
                                    textScaleFactor: MyClassPro.fontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStylePro.detailTxt(
                                        context, 3),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      widget.paramPro.note,
                                      textAlign: TextAlign.right,
                                      textScaleFactor: MyClassPro.fontSizeApp(
                                          widget.param.fontsizeapps),
                                      style: CustomTextStylePro.detailTxtLight(
                                          context, 3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.06,
                  ),
                  Container(
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PinPro(
                              data: data,
                              param: widget.param,
                              paramPro: widget.paramPro,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          LanguagePro.tranPro('approve', widget.param.lgs),
                          textScaleFactor:
                              MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                          style: CustomTextStylePro.buttonTxt(context, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkAccountNameFrom() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(data['from_account_name']);

      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkNull(data['result']['from_account_name']);
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkNull(datacheck['receiverName']);
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(data['from_account_name']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(data['from_account_name']);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(data['to_account_name']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(data['from_account_name']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(data['from_account_name']);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }

  checkAccountNoFrom() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(data['from_coop_account_no']);
      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(data['result']['to_bay_account_no']),
      //       'withDrawBankToDep');
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(data['result']['from_coop_account_no']),
      //       'pay');
      // } else if (widget.paramPro.type == 'tran' || widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(data['result']['from_coop_account_no']),
      //       'tran');
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(data['result']['from_coop_account_no']),
      //       'tranAccount');
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(data['result']['from_coop_account_no']),
      //       'tranBank');
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkFormatAccountClose(
      //       MyClassPro.checkNull(data['result']['from_coop_account_no']),
      //       'tranBank');
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(data['from_coop_account_no']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(data['from_coop_account_no']);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(data['to_bay_account_no']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(data['from_coop_account_no']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(data['from_bay_account_no']);
    }

    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkFormatAccountClose(
    //       MyClassPro.checkNull(data['from_coop_account_no']),
    //       'buyshare');
    // }
  }

  checkAccountNameTo() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(data['to_account_name']);

      // if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkNull(data['result']['to_account_name']);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkNull(data['result']['from_account_name']);
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkNull(datacheck['receiverName']);
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(data['to_account_name']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(data['from_account_name']);
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(data['to_account_name']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(data['to_account_name']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(data['to_account_name']);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }

  checkAccountNoTo() {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      return MyClassPro.checkNull(data['to_coop_account_no']);

      //   if (widget.paramPro.type == 'withDrawBankToDep') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'pay') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tran') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tranAccount') {
      //   return MyClassPro.checkFormatAccountClose1(
      //       data['result']['to_coop_account_no'], widget.paramPro.type);
      // } else if (widget.paramPro.type == 'tranBank') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(data['result']['to_bay_account_no']),
      //       'tranBank');
      // } else if (widget.paramPro.type == 'withdrawDepToOther') {
      //   return MyClassPro.checkFormatBankClose1(
      //       MyClassPro.checkNull(widget.img.split(',')[1]), 'tranBank');
      // }
    } else if (widget.paramPro.type == 'pay') {
      return MyClassPro.checkNull(data['to_coop_account_no']);
    } else if (widget.paramPro.type == 'tranBank') {
      return MyClassPro.checkNull(data['to_bay_account_no']);
      // return MyClassPro.checkFormatBankClose1(
      //     MyClassPro.checkNull(data['result']['to_bay_account_no']),
      //     'tranBank');
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      return MyClassPro.checkNull(data['to_coop_account_no']);
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      return MyClassPro.checkNull(data['to_bay_account_no']);
    } else if (widget.paramPro.type == 'loanpayment') {
      return MyClassPro.checkNull(data['to_coop_account_no']);
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   return MyClassPro.checkNull('');
    // }
  }
}
