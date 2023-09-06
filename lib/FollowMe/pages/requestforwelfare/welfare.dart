import 'dart:convert';
import 'package:udtscc/FollowMe/models/welfare/welfare_model.dart';
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
          type: 0),
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
                        style: CustomTextStyle.dataHTxt(context, 5, 'Bl')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.09,
                    ),
                    child: _genmemu(
                        image: h_welfare,
                        welfare: h_welfare,
                        tabletMode: tabletMode),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //  Stack(
      //   children: <Widget>[
      //     Container(
      //       decoration: MyClass.backGround(),
      //       child: SafeArea(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Padding(
      //                 padding: EdgeInsets.only(
      //                     top: paddinglist(context, 0),
      //                     left: paddinglist(context, 0),
      //                     right: paddinglist(context, 0)),
      //                 child: Text(
      //                   "ขอทุนสวัสดิการ",
      //                   textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
      //                   style:
      //                       CustomTextStyle.dataHeadDataCTxt(context, 10, 'Bl'),
      //                 )),

      //             // Expanded(
      //             //   child: Padding(
      //             //     padding: EdgeInsets.only(
      //             //         left: paddinglist(context, 0),
      //             //         right: paddinglist(context, 0)),
      //             //     child: FutureBuilder<List<WelfareModel>>(
      //             //       future: Network.fetchWelfare(
      //             //           objDep, widget.param.token, context),
      //             //       builder: (context, snapshot) {
      //             //         if (snapshot.hasData) {
      //             //           return snapshot.data!.isNotEmpty
      //             //               ? _detail(wel: snapshot.data)
      //             //               : MyWidget.nodata(widget.param.lgs, context);
      //             //         } else if (snapshot.hasError) {
      //             //           return Text("${snapshot.error}");
      //             //         }
      //             //         return MyClass.loading();
      //             //       },
      //             //     ),
      //             //   ),
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  // Widget _detail({wel}) => Container(
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
  //         color: MyColor.color('datatitle'),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.grey.withOpacity(0.3),
  //               offset: Offset.fromDirection(0, 2.0),
  //               blurRadius: 6.0,
  //               spreadRadius: 1.0)
  //         ],
  //       ),
  //       child: Scrollbar(
  //         child: ListView.separated(
  //           padding: const EdgeInsets.only(top: 10),
  //           separatorBuilder: (context, index) => Divider(
  //             color: MyColor.color('linelist'),
  //           ),
  //           itemCount: wel.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return InkWell(
  //               onTap: () {
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => WelfareDetail(
  //                 //         data: '[${jsonEncode(wel[index])}]',
  //                 //         param: widget.param),
  //                 //   ),
  //                 // );
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Expanded(
  //                     flex: 2,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 0),
  //                           child: Text(
  //                             MyClass.checkNull(
  //                                 wel[index].welfareDesc.toString()),
  //                             textScaleFactor:
  //                                 MyClass.blocFontSizeApp(_fontsizeapps),
  //                             style: CustomTextStyle.dataHTxt(
  //                                 context,
  //                                 0,
  //                                 wel[index].contractStatus == '0'
  //                                     ? 'BlH'
  //                                     : 'R'),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 2,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: <Widget>[
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 15),
  //                           child: Text(
  //                             MyClass.checkNull(
  //                                 wel[index].welfareNo.toString()),
  //                             textScaleFactor:
  //                                 MyClass.blocFontSizeApp(_fontsizeapps),
  //                             style: CustomTextStyle.dataHTxt(
  //                                 context,
  //                                 0,
  //                                 wel[index].contractStatus == '0'
  //                                     ? 'BlH'
  //                                     : 'R'),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     flex: 5,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: <Widget>[
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 0),
  //                           child: Text(
  //                             MyClass.checkNull(wel[index].name.toString()),
  //                             textScaleFactor:
  //                                 MyClass.blocFontSizeApp(_fontsizeapps),
  //                             style: CustomTextStyle.dataHTxt(
  //                                 context,
  //                                 0,
  //                                 wel[index].contractStatus == '0'
  //                                     ? 'BlH'
  //                                     : 'R'),
  //                           ),
  //                         ),
  //                         Icon(
  //                           Icons.keyboard_arrow_right,
  //                           size: iconnext(context, 0),
  //                           color: MyColor.color('buttonnext'),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     );

  ListView _genmemu({image, welfare, tabletMode, page}) => ListView.builder(
        itemCount: welfare.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 10, right: 10, bottom: 5),
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Card(
                    elevation: 0,
                    color: Color(0x00FFFFFF),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: MyColor.color('w'),
                        ),
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
