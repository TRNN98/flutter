import 'dart:convert';

import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/pages/loan/loan_guarantee.dart';
import 'package:mwasc/FollowMe/pages/loan/loan_movement.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class LoanDetail extends StatefulWidget {
  final Param param;
  final String data;

  const LoanDetail({super.key, required this.data, required this.param});

  @override
  LoanDetailState createState() => LoanDetailState();
}

class LoanDetailState extends State<LoanDetail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.loanLg('listOfLoanAgreements', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  _subdataHeadcolor(),
                  Container(
                    margin: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    padding: EdgeInsets.all(paddinglist(context, 0)),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset.fromDirection(0, 2.0),
                            blurRadius: 6.0,
                            spreadRadius: 1.0)
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: MyColor.color('datatitle'),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                    Language.loanLg('loanContractInformation',
                                        widget.param.lgs),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 5, 'Bl'))),
                          ],
                        ),
                        lineSizedBox(context, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  Language.loanLg(
                                      'loanContractNumber', widget.param.lgs),
                                  textAlign: TextAlign.start,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataBoldTxt(context, 1)),
                            ),
                            Expanded(
                              child: Text(
                                  jsonDecode(widget.data)[0]
                                      ['loan_contract_no'],
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('collateralDescription',
                                          widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                  MyClass.checkNull(jsonDecode(widget.data)[0]
                                      ['loan_type_description']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('contractStartDate',
                                          widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.checkNull(jsonDecode(widget.data)[0]
                                      ['begining_of_contract']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'approvalLimit', widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.formatNumber(
                                      jsonDecode(widget.data)[0]
                                          ['loan_approve_amount']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'periodAll', widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.checkNull(jsonDecode(widget.data)[0]
                                      ['loan_installment_amount']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg('paymentInInstallments',
                                          widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.formatNumber(
                                      jsonDecode(widget.data)[0]
                                          ['period_payment_amount']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'balance', widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.formatNumber(
                                      jsonDecode(widget.data)[0]
                                          ['principal_balance']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'period', widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.checkNull(jsonDecode(widget.data)[0]
                                      ['last_period']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                        lineSizedBox(context, -25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                      Language.loanLg(
                                          'payment', widget.param.lgs),
                                      textAlign: TextAlign.start,
                                      textScaleFactor: MyClass.blocFontSizeApp(
                                          _fontsizeapps),
                                      style: CustomTextStyle.dataBoldTxt(
                                          context, 1))),
                            ),
                            Expanded(
                              child: Text(
                                  MyClass.checkNull(jsonDecode(widget.data)[0]
                                      ['loan_payment_type_code']),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.dataW300Txt(context, 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.09,
                  ),
                  _buttomClick(),
                  SizedBox(
                    height: displayHeight(context) * 0.03,
                  ),
                  _buttomClick1(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('bl1'),
            MyColor.color('bl3'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoanGuarantee(
                  loanContractNo: jsonDecode(widget.data)[0]
                      ['loan_contract_no'],
                  principalBalance: jsonDecode(widget.data)[0]
                      ['principal_balance'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.loanLg('showGuarantees', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.loginBoldTxt(context, -8, 'TxtBt'),
          ),
        ),
      ),
    );
  }

  Container _buttomClick1() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('bl1'),
            MyColor.color('bl3'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoanMovement(
                  loanContractNo: jsonDecode(widget.data)[0]
                      ['loan_contract_no'],
                  principalBalance: jsonDecode(widget.data)[0]
                      ['principal_balance'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.loanLg('showMovementlist', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.loginBoldTxt(context, -8, 'TxtBt'),
          ),
        ),
      ),
    );
  }

  Container _subdataHeadcolor() {
    return Container(
      padding: EdgeInsets.all(paddinglist(context, 0)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset.fromDirection(0, 2.0),
                    blurRadius: 6.0,
                    spreadRadius: 1.0)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.loanLg('member', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(widget.param.membershipNo,
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.loanLg('name', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(widget.param.name,
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
