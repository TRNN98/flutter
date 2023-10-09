import 'dart:convert';

import 'package:mwasc/FollowMe/models/kept/kept_model.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/pages/kept/kept_detail.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Kept extends StatefulWidget {
  final Param param;

  const Kept(this.param, {super.key});

  @override
  KeptState createState() => KeptState();
}

class KeptState extends State<Kept> {
  var objKept = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.keptLg('kept', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  CustomUI.appbarDetailUi('assets/imgs/kept.png', context),
                  lineSizedBox(context, -15),
                  Padding(
                      padding: EdgeInsets.only(
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
                      child: FutureBuilder<List<KeptModel>>(
                        future: Network.fetchKept(
                            objKept, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(kept: snapshot.data)
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

  Widget _detail({kept}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset.fromDirection(0, 2.0),
                blurRadius: 6.0,
                spreadRadius: 1.0)
          ],
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: kept.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  var data = [
                    {
                      "receiveYear": kept[index].receiveYear.toString(),
                      "receiveMonth": kept[index].receiveMonth.toString(),
                      "receiveMonthFp": MyClass.monthNameTH(
                          kept[index].receiveMonth.toString(), 'full'),
                      "receiveYearFp": (int.parse(
                                  MyClass.checkNull(kept[index].receiveYear)) +
                              543)
                          .toString(),
                      "receiptNo": kept[index].receiptNo,
                      "receiptDate": kept[index].receiptDate,
                      "kepMethodAmount": kept[index].moneyamountreal.toString(),
                      "status": '1',
                      "seq_no": kept[index].seqNo.toString(),
                      "moneyAmountNot": kept[index].moneyAmountNot.toString(),
                      "moneyAmount": kept[index].moneyAmount.toString(),
                      "addMoneyAmount": kept[index].addMoneyAmount.toString(),
                      "countSeqno": kept[index].countSeqno.toString(),
                      "postedRun": kept[index].postedRun.toString(),
                      "deduteamountreal": MyClass.checkNull0(
                          kept[index].deduteamountreal.toString())
                    }
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KeptDetail(
                          data: jsonEncode(data), param: widget.param),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              MyClass.monthNameTH(
                                      kept[index].receiveMonth.toString(),
                                      'full') +
                                  ' ' +
                                  (int.parse(MyClass.checkNull(
                                              kept[index].receiveYear)) +
                                          543)
                                      .toString(),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 0, 'B'),
                            ),
                            Text(
                              MyClass.checkNull(
                                  'วันที่ใบเสร็จรับเงิน ${kept[index].receiptDate}'),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Text(
                              MyClass.formatNumber(
                                  kept[index].moneyAmount.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 0, 'R'),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: iconnext(context, 0),
                            color: MyColor.color('buttonnext'),
                          ),
                        ],
                      ),
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
                        flex: 2,
                        child: Text(Language.loanLg('name', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 4,
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

Container _head(context, lgs) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.decal,
        colors: <Color>[
          MyColor.color('detailhead1'),
          MyColor.color('detailhead2')
        ],
      ),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.keptLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.keptLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
          ),
        ),
      ],
    ),
  );
}
