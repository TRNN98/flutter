import 'dart:convert';
import 'package:mwasc/FollowMe/models/share/share_model_d.dart';
import 'package:mwasc/FollowMe/models/share/share_model_h.dart';
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

class Share extends StatefulWidget {
  final Param param;

  const Share(this.param, {super.key});

  @override
  ShareState createState() => ShareState();
}

class ShareState extends State<Share> {
  var objHeadShare = '{"mode": "1"}';
  var objShare = '{"mode": "2"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.shareLg('share', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  lineSizedBox(context, -15),
                  CustomUI.appbarDetailUi('assets/imgs/share.png', context),
                  lineSizedBox(context, -15),
                  FutureBuilder<List<ShareModelH>>(
                    future: Network.fetchHeadShare(
                        objHeadShare, widget.param.token, context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: paddinglist(context, 0),
                                    right: paddinglist(context, 0)),
                                child: _subdatahead(
                                    jsonDecode(jsonEncode(snapshot.data))[0]
                                        ['share_stock'],
                                    jsonDecode(jsonEncode(snapshot.data))[0]
                                        ['share_amount'],
                                    jsonDecode(jsonEncode(snapshot.data))[0]
                                        ['period_recrieve'],
                                    context),
                              )
                            : MyWidget.nodata(widget.param.lgs, context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return MyClass.loading();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<ShareModelD>>(
                        future: Network.fetchShare(
                            objShare, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(
                                    share: snapshot.data,
                                  )
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
                    height: displayHeight(context) * 0.01,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableTile(share) {
    return ExpansionTile(
      title: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MyClass.checkNull(share.operateDate),
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                      Text(
                        MyClass.checkNull(share.itemTypeDescription),
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataTxt(context, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      share.period.toString(),
                      textAlign: TextAlign.center,
                      textScaleFactor:
                          MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.formatNumber(share.shareValue.toString()),
                        textAlign: TextAlign.left,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      children: <Widget>[
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  Language.shareLg('amountM', 'th'),
                  textAlign: TextAlign.left,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                child: Text(
                  share.shareStock,
                  textAlign: TextAlign.right,
                  textScaleFactor:
                      MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _detail({share}) => Container(
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
              height: 0,
              color: MyColor.color('linelist'),
            ),
            itemCount: share.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(share[index]);
            },
          ),
        ),
      );

  Center _subdatahead(amount, stock, period, context) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                          Language.shareLg(
                              'shareContractInformation', widget.param.lgs),
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
                    ),
                  ],
                ),
                lineSizedBox(context, -20),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('member', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(widget.param.membershipNo,
                            textAlign: TextAlign.end,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.shareLg('name', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(widget.param.name,
                            textAlign: TextAlign.end,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.shareLg('share', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(MyClass.formatNumber(amount),
                            textAlign: TextAlign.end,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('period', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(period,
                            textAlign: TextAlign.end,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.shareLg('monthlyShare', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        child: Text(stock,
                            textAlign: TextAlign.end,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
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
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(Language.shareLg('date', lgs),
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                style:
                    CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
          ),
          Expanded(
            flex: 1,
            child: Text(Language.shareLg('period1', lgs),
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                style:
                    CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
          ),
          Expanded(
            flex: 1,
            child: Text(Language.shareLg('amount', lgs),
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                style:
                    CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
          ),
        ],
      ),
    );
  }
}
