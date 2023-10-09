import 'dart:convert';

import 'package:mwasc/FollowMe/models/kept/kept_detail_model.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

double _fontsizeapps = 1.0;

class KeptDetail extends StatefulWidget {
  final Param param;
  final String data;

  const KeptDetail({super.key, required this.data, required this.param});

  @override
  KeptDetailState createState() => KeptDetailState();
}

class KeptDetailState extends State<KeptDetail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    var objKeptDetail =
        '{"mode": "2","receive_year":"${jsonDecode(widget.data)[0]['receiveYear']}","receive_month":"${jsonDecode(widget.data)[0]['receiveMonth']}","seq_no":"${jsonDecode(widget.data)[0]['seq_no']}"}';

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
                  _subdataHeadcolor(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<KeptDetailModel>>(
                        future: Network.fetchKeptDetail(
                            objKeptDetail, widget.param.token, context),
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
                  SizedBox(
                    height: displayHeight(context) * 0.025,
                  ),
                  _buttomClick(),
                  SizedBox(
                    height: displayHeight(context) * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buttomClick() {
    return jsonDecode(widget.data)[0]['postedRun'] == '1'
        ? Container(
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
                jsonDecode(widget.data)[0]['postedRun'] == '1'
                    ? _launchURL(
                        '${MyClass.hostApp()}/api/v1/kep_print/${jsonDecode(widget.data)[0]['receiveYear']}/${jsonDecode(widget.data)[0]['receiveMonth']}/${jsonDecode(widget.data)[0]['seq_no']}/${widget.param.token}')
                    : MyClass.showToast(
                        "ไม่สามารถพิมพ์ใบเสร็จได้\nเนื่องจากสหกรณ์ฯ\nยังไม่ผ่านรายการเรียกเก็บ");
              },
              child: Center(
                child: Text(
                  Language.keptLg('printBilledMonthly', widget.param.lgs),
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.buttonTxt(context, -1),
                ),
              ),
            ),
          )
        : Container();
  }

  Widget _detail({kept}) => Container(
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
              height: 0,
            ),
            itemCount: kept.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(kept[index]);
            },
          ),
        ),
      );

  Widget _buildExpandableTile(kept) {
    return kept.keepingTypeName == 'ค่าหุ้นรายเดือน'
        ? ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            kept.keepingTypeName,
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 1),
                          ),
                          Text(
                            kept.receiveDescription,
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 1),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        MyClass.checkNull(kept.principalOfLoan),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        : ExpansionTile(
            title: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            kept.keepingTypeName,
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 1),
                          ),
                          Text(
                            kept.receiveDescription,
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 1),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        MyClass.checkNull(kept.principalOfLoan),
                        textAlign: TextAlign.end,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
            children: [
                ListTile(
                  title: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            Language.keptLg('principal', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 1),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              MyClass.checkNull(kept.principalOfLoan),
                              textAlign: TextAlign.end,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 1),
                            ),
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              Language.keptLg('interest', widget.param.lgs),
                              textAlign: TextAlign.start,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, 1),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                MyClass.checkNull(kept.interest),
                                textAlign: TextAlign.end,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataTxt(context, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]);
  }

  Container _subdataHeadcolor() {
    return Container(
      padding: EdgeInsets.all(paddinglist(context, 0)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                        child: Text(Language.keptLg('member', widget.param.lgs),
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
                  children: [
                    Expanded(
                        child: Text(Language.keptLg('name', widget.param.lgs),
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
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                                Language.keptLg('month', widget.param.lgs) +
                                    ' ' +
                                    jsonDecode(widget.data)[0]
                                        ['receiveMonthFp'] +
                                    ' ' +
                                    Language.keptLg('year', widget.param.lgs) +
                                    ' ' +
                                    jsonDecode(widget.data)[0]['receiveYearFp'],
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
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
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            Language.keptLg('receiptDate', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(
                      jsonDecode(widget.data)[0]['receiptDate'],
                      // MyClass.convertDate(
                      //     jsonDecode(widget.data)[0]['receiptDate']),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataW300Txt(context, 1),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptLg('receiptNumber', widget.param.lgs),
                          // MyClass.formatRef(
                          //     jsonDecode(widget.data)[0]['receiptNo']),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 1))),
                  Expanded(
                      child: Text(
                    jsonDecode(widget.data)[0]['receiptNo'],
                    // MyClass.formatRef(
                    //     jsonDecode(widget.data)[0]['receiptNo']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataW300Txt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptLg('billedCharge', widget.param.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 1))),
                  Expanded(
                      child: Text(
                    MyClass.checkNull(
                        jsonDecode(widget.data)[0]['moneyAmount']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataW300Txt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.keptLg('totalPaid', widget.param.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 1))),
                  Expanded(
                      child: Text(
                    MyClass.checkNull(
                        jsonDecode(widget.data)[0]['moneyAmount']),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataW300Txt(context, 1),
                    textAlign: TextAlign.end,
                  )),
                ]),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            Language.keptLg('StatusReceipt', widget.param.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(
                      jsonDecode(widget.data)[0]['postRun'] == '0'
                          ? "รอนำส่ง"
                          : "ชำระแล้ว",
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataW300Txt(context, 1),
                      textAlign: TextAlign.end,
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(Language.keptLg('detail', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
        ),
        Expanded(
          flex: 2,
          child: Text(Language.keptLg('amount', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
        ),
        Icon(
          Icons.abc,
          color: Colors.transparent,
        )
      ],
    ),
  );
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
