import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mwasc/FollowMe/pages/requestforwelfare/welfare.dart';

import '../../class/custom_ui.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';

import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';

double _fontsizeapps = 1.0;

// for check if this type is have remark?
bool showremark = true;

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
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Center(
                                              child: Text(
                                                "เงื่อนไข",
                                                style: CustomTextStyle
                                                    .dataHeadTitleCTxt(
                                                        context, 1, 'Bl'),
                                              ),
                                            ),
                                            content: Text(
                                              "1. เป็นสมาชิกสหกรณ์มาแล้วไม่น้อยกว่า 10 ปี\n2. อายุครบ 55 ปีบริบูรณ์\n3. ไม่เคยมีคู่สมรสทั้งโดยนิตินัยและพฤตินัย",
                                              style: CustomTextStyle
                                                  .dataHeadTitleTxt(context, 0),
                                            ),
                                            actions: [
                                              Center(
                                                child: DialogButton(
                                                  onPressed: () => {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop(),
                                                  },
                                                  width: displayWidth(context) *
                                                      0.3,
                                                  color: MyColor.color(
                                                      'LineColor'),
                                                  radius: BorderRadius.all(
                                                      Radius.circular(30)),
                                                  child: Text(
                                                    "รับทราบ",
                                                    style: CustomTextStyle
                                                        .dataBoldTxt1(
                                                            context, -5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ));
                                },
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
                                  "เงื่อนไข",
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHeadDataCTxt(
                                      context, 0, 'w'),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Center(
                                            child: Text(
                                              "สวัสดิการที่ได้รับ",
                                              style: CustomTextStyle
                                                  .dataHeadTitleCTxt(
                                                      context, 1, 'Bl'),
                                            ),
                                          ),
                                          content: Text(
                                            "เจ้าบ้าน ได้รับเงินตามความเสียหายจริง ดังนี้ \n- อัคคีภัย 50,000 บาท\n- ภัยธรรมชาติอื่นๆ 10,000 บาท\n- ผู้อาศัย ได้รับเงินตามความเสียหายจริง ดังนี้\n -อัคคีภัย 30,000 บาท\n- ภัยธรรมชาติอื่นๆ 6,000 บาท",
                                            style: CustomTextStyle
                                                .dataHeadTitleTxt(context, 0),
                                          ),
                                          actions: [
                                            Center(
                                              child: DialogButton(
                                                onPressed: () => {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop(),
                                                },
                                                width:
                                                    displayWidth(context) * 0.3,
                                                color:
                                                    MyColor.color('LineColor'),
                                                radius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                child: Text(
                                                  "รับทราบ",
                                                  style: CustomTextStyle
                                                      .dataBoldTxt1(
                                                          context, -5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));

                                // showAlert(
                                //     'เจ้าบ้าน ได้รับเงินตามความเสียหายจริง ดังนี้ \n- อัคคีภัย 50,000 บาท\n- ภัยธรรมชาติอื่นๆ 10,000 บาท\n- ผู้อาศัย ได้รับเงินตามความเสียหายจริง ดังนี้\n -อัคคีภัย 30,000 บาท\n- ภัยธรรมชาติอื่นๆ 6,000 บาท',
                                //     context);
                              },
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                showremark == true
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _showremark(),
                      )
                    : SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("กรอกข้อมูล",
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, 1, 'Bl')),
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
                            onTap: () {
                              print("object");
                            },
                            // controller: txtDate,
                            readOnly: true,
                            textAlign: TextAlign.start,
                            style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            decoration: const InputDecoration(
                              filled: true,
                              suffixIcon: Icon(Icons.close),
                              hintText: "รูปภาพ หรือไฟล์ PDF...",
                              border: InputBorder.none,
                            ),
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
                    // Row(
                    //   children: [
                    //     FloatingActionButton.small(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(15.0))),
                    //       backgroundColor: Color(0xFFE7E7E7),
                    //       onPressed: () {
                    //         // ทำงานเมื่อปุ่มถูกคลิก
                    //         // คุณสามารถเรียกฟังก์ชันหรือแสดงหน้าต่างเพื่อแนบไฟล์ที่นี่
                    //       },
                    //       child: Icon(Icons.file_upload_outlined,
                    //           color: Colors.grey[700]),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                // SizedBox(
                //   height: displayHeight(context) * 0.5,
                // ),
                SizedBox(
                  height: 16,
                ),
                _buttomClick(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showremark() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: Color(0xFFFFF0D9),
        ),
        child: Center(
          child: Text('*ระยะเวลาขอรับ - ภายใน 60 วัน นับตั้งแต่วันประสบภัย',
              style: CustomTextStyle.noteTxt(context, -3, 'note')),
        ),
      ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.4,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('LineColor'),
            MyColor.color('LineColor'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            'ส่งข้อมูล',
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.loginBoldTxt(context, -8, 'w'),
          ),
        ),
      ),
    );
  }

  static showAlert(msg, context) {
    Alert(
      context: context,
      // type: AlertType.warning,
      style: AlertStyle(
          titleStyle: CustomTextStyle.dataHeadTitleCTxt(context, 1, 'Bl'),
          descStyle: CustomTextStyle.dataHeadTitleTxt(context, 2)),
      title: "สวัสดิการที่ได้รับ",
      desc: msg,
      onWillPopActive: true,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('LineColor'),
          radius: BorderRadius.all(Radius.circular(30)),
          child: Text(
            "รับทราบ",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        ),
      ],
    ).show();
  }
}
