import 'dart:convert';

import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class RetireDetail extends StatefulWidget {
  final Param param;
  final String data;

  const RetireDetail({super.key, required this.data, required this.param});

  @override
  RetireDetailState createState() => RetireDetailState();
}

class RetireDetailState extends State<RetireDetail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.retireLg('retireDetail', widget.param.lgs),
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
                                    Language.retireLg(
                                        'retireInformation', widget.param.lgs),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 5, 'Go')),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg('yearReceive',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['year_receive']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg(
                                                'retireDes', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['retire_des']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg('shareStock',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['share_stock']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg(
                                                'buyShare', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['buy_share']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg(
                                                'net', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['net']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg('shareAmount',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['share_amount']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg('termAmount',
                                                widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['term_amount']
                                        .toString(),
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataBoldTxt(
                                        context, 0)),
                              ),
                            ],
                          ),
                          lineSizedBox(context, -25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.retireLg(
                                                'amount', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]
                                            ['amount']
                                        .toString(),
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
                  ],
                ),
              ),
            ),
          ),
        ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
