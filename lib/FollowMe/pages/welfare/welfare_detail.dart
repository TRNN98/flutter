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

class WelfareDetail extends StatefulWidget {
  final Param param;
  final String data;

  const WelfareDetail({super.key, required this.data, required this.param});

  @override
  WelfareDetailState createState() => WelfareDetailState();
}

class WelfareDetailState extends State<WelfareDetail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.welfareLg('welfareDetail', widget.param.lgs),
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
                                    Language.welfareLg(
                                        'welfareInformation', widget.param.lgs),
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
                                        Language.welfareLg(
                                                'type', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['welfare_desc'],
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
                                        Language.welfareLg(
                                                'number', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['welfare_no'],
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        Language.welfareLg(
                                                'name', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(jsonDecode(widget.data)[0]['name'],
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
                                        Language.welfareLg(
                                                'belongsTo', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['related_na'],
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
                                        Language.welfareLg(
                                                'paidMoney', widget.param.lgs) +
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
                                        ['principal_balance'],
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
                                        Language.welfareLg(
                                                'status', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['contract_des'],
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
                                        Language.welfareLg(
                                                'detail', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['rec_des'],
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
                                        Language.welfareLg(
                                                'birthday', widget.param.lgs) +
                                            " : ",
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldTxt(
                                            context, 0))),
                              ),
                              Expanded(
                                child: Text(
                                    jsonDecode(widget.data)[0]['birth_date'],
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
                                        Language.welfareLg('applicationDate',
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
                                    jsonDecode(widget.data)[0]['apply_date'],
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
                                        Language.welfareLg('resignationDate',
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
                                    MyClass.checkNull(jsonDecode(widget.data)[0]
                                        ['resign_date']),
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
