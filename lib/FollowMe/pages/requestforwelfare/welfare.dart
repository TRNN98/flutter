import 'dart:convert';
import 'package:mwasc/FollowMe/models/welfare/welfare_model.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/pages/requestforwelfare/welfare_type.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

import '../settings/security/checksecurity.dart';

double _fontsizeapps = 1.0;

class Welfare extends StatefulWidget {
  final Param param;

  const Welfare(this.param, {super.key});

  @override
  WelfareState createState() => WelfareState();

  static fromJson(i) {}
}

class Welfares {
  String? images;
  String? title;
  int? type;

  Welfares({this.images, this.title, this.type});
}

class WelfareState extends State<Welfare> {
  var objDep = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<Welfares> h_welfare = <Welfares>[
      Welfares(
        images: 'assets/imgs/w1.png',
        title: 'สวัสดิการสงเคราะห์สมาชิกประสบอัคคีภัย และภัยธรรมชาติอื่นๆ',
        type: 0,
      ),
      Welfares(
          images: 'assets/imgs/w2.png',
          title: "สวัสดิการการสมาชิกเจ็บป่วย",
          type: 1),
      Welfares(
          images: 'assets/imgs/w3.png',
          title:
              "สวัสดิการสหกรณ์เกี่ยวกับบุคคลในครอบครัวของสมาชิกถึงแก่กรรมค่าพวงหรีดสมาชิกถึงแก่กรรม",
          type: 2),
      Welfares(
          images: 'assets/imgs/w4.png',
          title: "สวัสดิการสงเคราะห์สมาชิกถึงแก่กรรม",
          type: 1),
      Welfares(
          images: 'assets/imgs/w5.png',
          title:
              "สวัสดิการสงเคราะห์สมาชิกถึงแก่กรรมและค่ารักษาพยาบาลของผู้เกษียณ",
          type: 1),
      Welfares(
          images: 'assets/imgs/w6.png',
          title: "สวัสดิการบำเหน็จเกษียณอายุ",
          type: 1),
      Welfares(
          images: 'assets/imgs/w7.png',
          title: "สวัสดิการให้ทุนศึกษาแก่บุตรสมาชิก",
          type: 1),
      Welfares(
          images: 'assets/imgs/w8.png',
          title: "สวัสดิการสมาชิกอาวุโส",
          type: 1),
      Welfares(
          images: 'assets/imgs/w9.png',
          title: "สวัสดิการเพื่อวันเกิด",
          type: 1),
      Welfares(
          images: 'assets/imgs/w10.png',
          title: "สวัสดิการมงคลสมรสสมาชิก",
          type: 1),
      Welfares(
          images: 'assets/imgs/w11.png',
          title: "สวัสดิการสมาชิกที่เป็นโสด",
          type: 1),
      Welfares(
          images: 'assets/imgs/w12.png',
          title: "สวัสดิการรับขวัญบุตรสมาชิก",
          type: 1),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          'ขอทุนสวัสดิการ', widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.03,
                      left: 10,
                      right: 10,
                    ),
                    child: Text("เลือกรายการ",
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHeadTitleCTxt(
                            context, 5, 'Bl')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.09,
                    ),
                    child: _genmemu(
                      image: h_welfare,
                      welfare: h_welfare,
                      tabletMode: tabletMode,
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

  ListView _genmemu({image, welfare, tabletMode}) => ListView.builder(
        itemCount: welfare.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TypeWelfare(
                      // type: welfare[index].type.toString(),
                      param: widget.param,
                      title: welfare[index].title),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: paddinglist(context, 0),
                    right: paddinglist(context, 0),
                    bottom: paddinglist(context, 0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 5),
                    height: MediaQuery.of(context).size.height * 0.09,
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
                    child: ClipPath(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  welfare[index].images,
                                  fit: BoxFit.fitWidth,
                                ),
                              )),
                          Expanded(
                            flex: 5,
                            child: Text(
                              welfare[index].title,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataCTxt(
                                  context, 2, 'Bl'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: iconnext(context, 0),
                              color: MyColor.color('buttonnext'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}

Container _head(context, lgs) {
  return Container(
    child: Text(
      "ขอทุนสวัสดิการ",
      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
      style: CustomTextStyle.dataHeadDataCTxt(context, 0, 'w'),
    ),
  );
}
