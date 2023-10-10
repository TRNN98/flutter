import 'package:flutter/material.dart';

import '../../class/custom_ui.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../class/widget.dart';
import '../../services/network.dart';
import '../auth/pins.dart';

double _fontsizeapps = 1.0;
int checkpage = 0;
int textSelect = 0;

class MemberSeminar extends StatefulWidget {
  Param param;
  MemberSeminar(this.param, {super.key});

  @override
  State<MemberSeminar> createState() => _MemberSeminarState();
}

class _MemberSeminarState extends State<MemberSeminar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.memberSeminar('memberSeminar', widget.param.lgs),
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
                  lineSizedBox(context, -15),
                  Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0),
                          bottom: paddinglist(context, 0)),
                      child: _subdatahead(widget.param.membershipNo,
                          widget.param.name, context, widget.param.lgs)),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: _ButtonInterest(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddinglist(context, 0),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: Column(
                      children: [
                        _head(context, widget.param.lgs),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _detail(),
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

  Center _subdatahead(member, name, context, lgs) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
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

  Widget _detail({gain}) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: Colors.white70,
        ),
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.only(top: 5),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "10/มี.ค./2566",
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 0),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "แคนทารี โฮเทล จ.ปราจีนบุรี ",
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Container _head(context, lgs) {
    return Container(
      padding: const EdgeInsets.all(15),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              'วันที่สัมมนา',
              textAlign: TextAlign.left,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'รายการสัมมนา',
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ButtonInterest() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: tabletMode
          ? const EdgeInsets.only(left: 55, right: 55)
          : EdgeInsets.fromLTRB(16, 0, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                textSelect = 0;
                checkpage = 0;
              });
            },
            child: Center(
              child: textSelect == 0
                  ? Container(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            MyColor.color('TxtBl'),
                            MyColor.color('TxtBl'),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'สัมมนาสมาชิก',
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'w'),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.06,
                      child: Center(
                        child: Text(
                          'สัมมนาสมาชิก',
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'TxtBl'),
                        ),
                      ),
                    ),
            ),
          ),
          const Expanded(child: Text('')),
          InkWell(
            onTap: () {
              setState(() {
                textSelect = 1;
                checkpage = 1;
              });
            },
            child: Center(
              child: textSelect == 0
                  ? SizedBox(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.06,
                      child: Center(
                        child: Text(
                          'ประวัติการสัมมนาสมาชิก',
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'TxtBl'),
                        ),
                      ),
                    )
                  : Container(
                      width: displayWidth(context) * 0.4,
                      height: displayHeight(context) * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            MyColor.color('TxtBl'),
                            MyColor.color('TxtBl'),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ประวัติการสัมมนาสมาชิก',
                          textScaleFactor: MyClass.fontSizeApp(),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, -2, 'w'),
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
