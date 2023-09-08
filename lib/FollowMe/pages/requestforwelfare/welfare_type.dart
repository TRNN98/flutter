import 'package:flutter/material.dart';
import 'package:udtscc/FollowMe/pages/requestforwelfare/welfare.dart';

import '../../class/custom_ui.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';

import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';

double _fontsizeapps = 1.0;

class TypeWelfare extends StatefulWidget {
  final Param param;
  final String title;

  TypeWelfare({required this.title, required this.param, super.key});

  @override
  State<TypeWelfare> createState() => _TypeWelfareState();
}

class _TypeWelfareState extends State<TypeWelfare> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          CustomUI.appbarUi(widget.title, widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    lineSizedBox(context, -15),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: paddinglist(context, 0),
                            right: paddinglist(context, 0)),
                        child: _subdatahead(widget.param.membershipNo,
                            widget.param.name, context, widget.param.lgs)),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: paddinglist(context, 0),
                            left: paddinglist(context, 0),
                            right: paddinglist(context, 0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0051CA),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      20,
                                    ))),
                                icon: Image.asset(
                                    'assets/imgs/icon_condition.png',
                                    width: 20),
                                label: Text(
                                  "เงื่่อนไข",
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHeadDataCTxt(
                                      context, 0, 'w'),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2194FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                    20,
                                  ))),
                              icon: Image.asset('assets/imgs/icon_welfare.png',
                                  width: 20),
                              label: Text(
                                "สวัสดิการที่ได้รับ",
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHeadDataCTxt(
                                    context, 0, 'w'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    lineSizedBox(context, -25),
                    Padding(
                        padding: EdgeInsets.only(
                            left: paddinglist(context, 0),
                            right: paddinglist(context, 0)),
                        child: _detail(widget.param.membershipNo,
                            widget.param.name, context, widget.param.lgs)),

                    Center(
                        child: Text(
                      ".title",
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataBoldBTxt(context, 0),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                          child: Text(
                        "checkSecuritys[int.parse(widget.type)].detail",
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldBTxt(context, 0),
                      )),
                    ),
                    lineSizedBox(context, 0),
                    Center(
                        child: Text(
                      Language.settingLg('youWant', widget.param.lgs) +
                          Language.settingLg('yesOrNo', widget.param.lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataBoldBTxt(context, 0),
                    )),
                    lineSizedBox(context, -15),
                    // _buttom()
                  ],
                ),
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
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset.fromDirection(0, 2.0),
                    blurRadius: 6.0,
                    spreadRadius: 1.0)
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Text(Language.loanLg('member', lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(member,
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
                        child: Text(Language.loanLg('name', lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(name,
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
                        child: Text("อายุการเป็นสมาชิก",
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text("10 ปี 2 เดือน",
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

  Center _detail(member, name, context, lgs) {
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
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    const Text(
                      '*ระยะเวลาขอรับ - ภายใน 60 วัน นับตั้งแต่วันประสบภัย',
                      style: TextStyle(color: Color(0xFFFE820F)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("กรอกข้อมูล",
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleCTxt(
                              context, 3, 'Bl')),
                    ),
                    const Expanded(
                        flex: 4,
                        child: Divider(
                          color: Colors.black,
                          endIndent: 2,
                          height: 5,
                          thickness: 1,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            border: Border.all(
                              color: const Color(0xFFE7E7E7),
                            ),
                            color: const Color(0xFFF8F8F8),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            showCursor: false,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.close),
                                hintText: "รูปภาพ หรือไฟล์ PDF..."),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              color: Color(0xFFE7E7E7),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.file_upload_outlined,
                                    color: Colors.grey[700]))),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Color(0xFFE7E7E7),
                      onPressed: () {
                        // ทำงานเมื่อปุ่มถูกคลิก
                        // คุณสามารถเรียกฟังก์ชันหรือแสดงหน้าต่างเพื่อแนบไฟล์ที่นี่
                      },
                      child: Icon(Icons.file_upload_outlined,
                          color: Colors.grey[700]),
                    ),
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
