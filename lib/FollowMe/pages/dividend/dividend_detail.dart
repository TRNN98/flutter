import 'dart:convert';

import 'package:udtscc/FollowMe/models/dividend/div_detail_model.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

class DividendDetail extends StatefulWidget {
  final Param param;
  final String data;

  const DividendDetail({super.key, required this.data, required this.param});

  @override
  DividendDetailState createState() => DividendDetailState();
}

var s = 0;

class DividendDetailState extends State<DividendDetail> {
  @override
  Widget build(BuildContext context) {
    var objDividend =
        '{"mode": "2","account_year": "${MyClass.adYearFormat(jsonDecode(widget.data)[0]['year']).toString()}"}';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.dividendLg('dividendAverageDetail', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  _subdataHeadcolor(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(
                        context, widget.param.lgs, widget.param.fontsizeapps),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<DivDetailModel>>(
                        future: Network.fetchDividendDetail(
                            objDividend, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return _detail(div: snapshot.data);
                            } else {
                              return MyWidget.nodata(widget.param.lgs, context);
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail({div}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: div.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            div[index].bankName.isEmpty
                                ? div[index].moneyTypeName.isEmpty
                                    ? ''
                                    : div[index].moneyTypeName
                                : div[index].bankName,
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 0),
                          ),
                          Text(
                            div[index].bankAccNo.isEmpty
                                ? div[index].loanContractNo.isEmpty
                                    ? ''
                                    : div[index].loanContractNo
                                : div[index].bankAccNo,
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      MyClass.formatNumber(div[index].itemAmount),
                      textAlign: TextAlign.center,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

  Container _subdataHeadcolor() {
    return Container(
      padding: EdgeInsets.all(paddinglist(context, 0)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                                Language.keptLg('member', widget.param.lgs) +
                                    ' : ' +
                                    widget.param.membershipNo,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 2)))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                                Language.keptLg('name', widget.param.lgs) +
                                    ' : ' +
                                    widget.param.name,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 2)))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                                Language.dividendLg(
                                        'fiscalYear', widget.param.lgs) +
                                    ' : ' +
                                    jsonDecode(widget.data)[0]['year']
                                        .toString(),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 2)))),
                  ],
                ),
                Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColor.color('divider'),
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                          Language.dividendLg('dividend', widget.param.lgs) +
                              ' : ',
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'Bl')),
                      Text(
                          MyClass.formatNumber(
                              jsonDecode(widget.data)[0]['dividend']),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -3, 'Bl')),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                          Language.dividendLg(
                                  'averageRefund', widget.param.lgs) +
                              ' : ',
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'Bl')),
                      Text(
                          MyClass.formatNumber(
                              jsonDecode(widget.data)[0]['averageReturn']),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -3, 'Bl')),
                    ],
                  )),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                          Language.dividendLg(
                                  'dividendRate', widget.param.lgs) +
                              ' : ',
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'Bl')),
                      Text(jsonDecode(widget.data)[0]['dividendRate'],
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -3, 'Bl')),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                          Language.dividendLg('averageRate', widget.param.lgs) +
                              ' : ',
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'Bl')),
                      Text(jsonDecode(widget.data)[0]['averageRate'],
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -3, 'Bl')),
                    ],
                  )),
                ]),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                            Language.dividendLg(
                                    'totalNetReceipts', widget.param.lgs) +
                                ' : ',
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, -2, 'Bl')),
                        Text(
                            MyClass.formatNumber(
                                jsonDecode(widget.data)[0]['totalSum']),
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, -3, 'Bl')),
                      ],
                    )),
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

Container _head(context, lgs, fontsizeapps) {
  return Container(
    padding: const EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('detail', lgs),
            textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
            textAlign: TextAlign.center,
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('amount', lgs),
            textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
            textAlign: TextAlign.center,
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
