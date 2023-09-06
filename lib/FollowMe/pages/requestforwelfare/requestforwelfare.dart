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
                  // lineSizedBox(context, -15),
                  // CustomUI.appbarDetailUi(
                  //     'assets/imgs/RequestWelfare.png', context),
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
                            Column(
                              children: [
                                Text("สวัสดิการที่ได้รับ",
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 5, 'Bl')),
                                lineSizedBox(context, -30),
                                Stack(
                                  children: [
                                    _about(context, widget.param),
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

  InkWell _about(context, Param param) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welfare(param),
          ),
        );
      },
      child: Container(
        // padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
        height: MediaQuery.of(context).size.height * 0.11,
        child: Card(
          elevation: 5,
          color: MyColor.color('SettingBackground'),
          child: ClipPath(
            clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/imgs/w1.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'สวัสดิการการสมาชิกเจ็บป่วย',
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHeadDataCTxt(context, 2, 'Bl'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
            ),
          ),
        ),
      ),
    );
  }
}
