import 'dart:convert';

import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/deposit/deposit_movement.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class DepositDetail extends StatefulWidget {
  final Param param;
  final String data;

  const DepositDetail({super.key, required this.data, required this.param});

  @override
  DepositDetailState createState() => DepositDetailState();
}

class DepositDetailState extends State<DepositDetail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.deposit('depositAccountDetails', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: SingleChildScrollView(
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
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0)),
                        color: MyColor.color('datatitle'),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                    Language.deposit(
                                        'depositContractInformation',
                                        widget.param.lgs),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 5, 'Go')),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('accountType',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    jsonDecode(widget.data)[0]
                                        ['deposit_type_name'],
                                    // MyClass.formatcontactaccoutn(
                                    //     jsonDecode(widget.data)[0]
                                    //         ['deposit_account_no']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('accountNumber',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    jsonDecode(widget.data)[0]
                                        ['deposit_account_no'],
                                    // MyClass.formatcontactaccoutn(
                                    //     jsonDecode(widget.data)[0]
                                    //         ['deposit_account_no']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('accountName',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    jsonDecode(widget.data)[0]
                                        ['deposit_account_name'],
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('accountOpeningDate',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    jsonDecode(widget.data)[0]
                                        ['deposit_opened_date'],
                                    // MyClass.convertDate(jsonDecode(widget.data)[0]
                                    //     ['deposit_opened_date']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('remainingAmount',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    MyClass.formatNumber(
                                        jsonDecode(widget.data)[0]
                                            ['deposit_balance']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('amountWithdrawn',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    MyClass.formatNumber(
                                        jsonDecode(widget.data)[0]
                                            ['withdrawable_amount']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.deposit('currentInterestRate',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    MyClass.formatNumber(
                                        jsonDecode(widget.data)[0]
                                            ['accumulate_interest']),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.15,
                    ),
                    _buttomClick(),
                  ],
                ),
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
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DepositMovement(
                  depositBalance: jsonDecode(widget.data)[0]['deposit_balance'],
                  depositAccountNo: jsonDecode(widget.data)[0]
                      ['deposit_account_no'],
                  param: widget.param),
            ),
          );
        },
        child: Center(
          child: Text(
            Language.deposit('seeMovements', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, 0),
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
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.loanLg('member', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.membershipNo,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.loanLg('name', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.name,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
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
