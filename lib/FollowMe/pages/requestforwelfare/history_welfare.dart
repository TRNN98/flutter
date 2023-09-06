import 'package:udtscc/FollowMe/models/gain/gain_model.dart';
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

class HistoryWelfare extends StatefulWidget {
  final Param param;

  const HistoryWelfare(this.param, {super.key});

  @override
  HistoryWelfareState createState() => HistoryWelfareState();
}

class HistoryWelfareState extends State<HistoryWelfare> {
  var objHistoryWelfare = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          'ประวัติการทำรายการ', widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddinglist(context, 0),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _detail(),
                      // child: FutureBuilder<List<GainModel>>(
                      //   future: Network.fetchGain(
                      //       objHistoryWelfare, widget.param.token, context),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return snapshot.data!.isNotEmpty
                      //           ? _detail(
                      //               gain: snapshot.data,
                      //             )
                      //           : MyWidget.nodata(widget.param.lgs, context);
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }
                      //     return MyClass.loading();
                      //   },
                      // ),
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

  Widget _detail({gain}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: Colors.white70,
        ),
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "สวัสดิการเพื่อวันเกิด",
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 0),
                          ),
                          Text(
                            "06 มิ.ย. 2566",
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "รอดำเนินการ",
                            textAlign: TextAlign.center,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

Container _head(context, lgs) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.decal,
        colors: <Color>[
          Color(0xFF47A5FF),
          Color(0xFF66C8FF),
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            "รายการ",
            textAlign: TextAlign.left,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "สถานะการเบิก",
            textAlign: TextAlign.right,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 0, 'TxtBlue'),
          ),
        ),
      ],
    ),
  );
}
