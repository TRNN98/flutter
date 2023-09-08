import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter/material.dart';
import 'package:udtscc/FollowMe/pages/requestforwelfare/welfare.dart';

import '../../class/custom_ui.dart';
import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../auth/pins.dart';
import 'history_welfare.dart';

double _fontsizeapps = 1.0;

class RequestWelfare extends StatefulWidget {
  final Param param;

  const RequestWelfare(this.param, {super.key});

  @override
  State<RequestWelfare> createState() => _RequestWelfareState();
}

class _RequestWelfareState extends State<RequestWelfare>
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
      appBar:
          CustomUI.appbarUi("สวัสดิการ", widget.param.fontsizeapps, context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  lineSizedBox(context, -15),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Welfare(widget.param),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0051CA),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                        20,
                                      ))),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "ขอทุนสวัสดิการ",
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHeadDataCTxt(
                                        context, 0, 'w'),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HistoryWelfare(widget.param),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2194FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                        20,
                                      ))),
                                  icon: const Icon(
                                    Icons.history,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "ประวัติทำรายการ",
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHeadDataCTxt(
                                        context, 0, 'w'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("สวัสดิการที่ได้รับ",
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    textAlign: TextAlign.start,
                                    style: CustomTextStyle.dataHeadTitleCTxt(
                                        context, 5, 'Bl')),
                                lineSizedBox(context, -30),
                                Stack(
                                  children: [
                                    _welfare(context, widget.param),
                                  ],
                                ),
                              ],
                            )
                          ]),
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

  Column _welfare(context, Param param) {
    return Column(
      children: [
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/imgs/w1.png',
                        fit: BoxFit.fitHeight,
                      )),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สวัสดิการการสมาชิกเจ็บป่วย',
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataHeadTitleCTxt(
                                context, 2, 'BlH'),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            "\t\t06 มิ.ย. 2566",
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(
                                widget.param.fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 3),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'จ่ายครั้งละ 2,000 บาท ปีละไม่เกิน 2 ครั้งหากป่วยเกิน 3 วัน ได้รับอีกวันละ 300 บาท แต่ไม่เกิน 5 วัน',
                              textAlign: TextAlign.start,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 2, 'Bl'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
