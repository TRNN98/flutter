import 'dart:convert';

import 'package:udtscc/FollowMe/models/dividend/div_model.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/dividend/dividend_detail.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Dividend extends StatefulWidget {
  final Param param;

  const Dividend(this.param, {super.key});

  @override
  DividendState createState() => DividendState();
}

class DividendState extends State<Dividend> {
  var objDiv = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.dividendLg('dividendAverageRefund', widget.param.lgs),
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
                  CustomUI.appbarDetailUi('assets/imgs/dividend.png', context),
                  lineSizedBox(context, -15),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _subdatahead()),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddinglist(context, 0),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<DivModel>>(
                        future: Network.fetchDividend(
                            objDiv, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(div: snapshot.data)
                                : MyWidget.nodata(widget.param.lgs, context);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
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

  Widget _detail({div}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 10),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: div.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  var data = [
                    {
                      "year": div[index].accountYear,
                      "dividend": div[index].dividend,
                      "averageReturn": div[index].averageReturn,
                      "dividendRate": div[index].dividendRate,
                      "averageRate": div[index].averageRate,
                      "totalSum": div[index].totalSum,
                    }
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DividendDetail(
                        data: jsonEncode(data),
                        param: widget.param,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        (div[index].accountYear).toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 1, 'Or'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        MyClass.formatNumber(div[index].totalPaid.toString()),
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 1, 'G'),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: iconnext(context, 0),
                      color: MyColor.color('buttonnext'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

  Center _subdatahead() {
    return Center(
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
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.membershipNo,
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
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
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.name,
                            textAlign: TextAlign.end,
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

Container _head(context, lgs) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.clamp,
        colors: <Color>[
          MyColor.color('detailhead1'),
          MyColor.color('detailhead2')
        ],
      ),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('fiscalYear', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('getMoney', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          size: iconnext(context, 0),
          color: Colors.transparent,
        ),
      ],
    ),
  );
}
