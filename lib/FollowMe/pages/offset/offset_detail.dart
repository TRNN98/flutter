import 'dart:convert';

import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/models/offset/offset_model_d.dart';
import 'package:udtscc/FollowMe/models/offset/offset_model_h.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OffsetDetail extends StatefulWidget {
  final Param param;
  final String data;

  const OffsetDetail({super.key, required this.data, required this.param});

  @override
  OffsetDetailState createState() => OffsetDetailState();
}

class OffsetDetailState extends State<OffsetDetail> {
  @override
  Widget build(BuildContext context) {
    var objOffset =
        '{"mode": "2","receipt_no":"${jsonDecode(widget.data)[0]['receiptNo']}"}';
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: MyClass.backGround(),
          child: Column(children: [
            tabletMode ? hSizedBox(context, 0) : hSizedBox(context, 0),
            FutureBuilder<List<OffsetModelH>>(
              future: Network.fetchOffsetDetailH(
                  objOffset, widget.param.token, context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: paddinglist(context, 0),
                              right: paddinglist(context, 0)),
                          child: _subdataHeadcolor(offsetH: snapshot.data),
                        )
                      : MyWidget.nodata(widget.param.lgs, context);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return MyClass.loading();
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.05,
                  left: paddinglist(context, 0),
                  right: paddinglist(context, 0)),
              child:
                  _head(context, widget.param.lgs, widget.param.fontsizeapps),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: paddinglist(context, 0),
                    right: paddinglist(context, 0)),
                child: FutureBuilder<List<OffsetModelD>>(
                  future: Network.fetchOffsetDetail(
                      objOffset, widget.param.token, context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return _detail(offsetD: snapshot.data);
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
            _buttomClick(),
            SizedBox(
              height: displayHeight(context) * 0.05,
            ),
          ]),
        ),
        CustomUI.appbarTxtTitleUi(Language.offsetLg('offset', widget.param.lgs),
            widget.param.fontsizeapps, context),
        // CustomUI.appbarUi(),
      ],
    ));
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
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
          _launchURL(
              "${MyClass.hostApp()}/api/v1/kep_clr_print/${jsonDecode(widget.data)[0]['receiptNo']}/${widget.param.token}");
        },
        child: Center(
          child: Text(
            Language.offsetLg('printoffset', widget.param.lgs),
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, -1),
          ),
        ),
      ),
    );
  }

  Widget _detail({offsetD}) => Container(
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
            itemCount: offsetD.length,
            itemBuilder: (BuildContext context, int index) {
              // print(div[index]);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MyClass.checkNull(offsetD[index].description),
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MyClass.formatNumber(
                                offsetD[index].principalAmount),
                            textAlign: TextAlign.center,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MyClass.formatNumber(offsetD[index].interestAmount),
                            textAlign: TextAlign.center,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            MyClass.formatNumber(offsetD[index].itemAmount),
                            textAlign: TextAlign.center,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -2),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

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
              Language.offsetLg('detail', lgs),
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              textAlign: TextAlign.center,
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('principal', lgs),
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              textAlign: TextAlign.center,
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('interest', lgs),
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              textAlign: TextAlign.center,
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.offsetLg('receptAmount1', lgs),
              textScaleFactor: MyClass.blocFontSizeApp(fontsizeapps),
              textAlign: TextAlign.center,
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  Center _subdataHeadcolor({offsetH}) {
    return Center(
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
                Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColor.color('divider'),
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.offsetLg('receiptNumber', widget.param.lgs) +
                              ' : ' +
                              MyClass.formatRef(offsetH[0].receiptNo),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style:
                              CustomTextStyle.dataHeadTitleTxt(context, -2))),
                  Expanded(
                      child: Text(
                          Language.offsetLg('receiptDate', widget.param.lgs) +
                              ' : ' +
                              offsetH[0].thaiReceiptDate,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style:
                              CustomTextStyle.dataHeadTitleTxt(context, -2))),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.offsetLg('CountDetail', widget.param.lgs) +
                              ' : ' +
                              offsetH[0].countSeqno.toString(),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style:
                              CustomTextStyle.dataHeadTitleTxt(context, -2))),
                  Expanded(
                      child: Text(
                          Language.offsetLg('receptAmount', widget.param.lgs) +
                              ' : ' +
                              MyClass.formatNumber(offsetH[0].receptAmount),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style:
                              CustomTextStyle.dataHeadTitleTxt(context, -2))),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Text(
                          Language.offsetLg(
                                  'loanContractNoNew', widget.param.lgs) +
                              ' : ' +
                              MyClass.formatcontactloan(
                                  offsetH[0].loanContractNoNew),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style:
                              CustomTextStyle.dataHeadTitleTxt(context, -2))),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
