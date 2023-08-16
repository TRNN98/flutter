import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:udtscc/FollowMe/class/custom_date_picker.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:flutter/material.dart';

import '../../../FollowMe/class/mycolor.dart';
import '../../../FollowMe/class/sizes.dart';
import '../../../FollowMe/class/textstyle.dart';
import '../../../FollowMe/class/widget.dart';
import '../../../FollowMe/pages/auth/pins.dart';
import '../../class/custom_ui_pro.dart';
import '../../class/languagepro.dart';
import '../../class/myclasspro.dart';
import '../../class/mycolorpro.dart';
import '../../class/textstylepro.dart';
import '../../models/history/history.dart';
import '../../sevices/network_pro.dart';

var lgs = 'th';
double fontsizeapps = 1.0;

class History extends StatefulWidget {
  final Param param;
  final String imei;

  const History({
    super.key,
    required this.imei,
    required this.param,
  });

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  String checkDataHistory = '';
  String dateS = '${DateTime.now().year}-${DateTime.now().month}-1';

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String date = '';

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    date = dateS;
    List obj = [
      {"mode": "2", "date": date}
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: CustomUIPro.appbarDetailUiPro('assets/imgPro/history.png',
          'history', widget.param.fontsizeapps, widget.param.lgs, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, 0),
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
                      child: FutureBuilder<List<HistoryModel>>(
                        future: NetworkPro.fetchHistory(obj, widget.param.token,
                            widget.param.cooptoken, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // print(snapshot.data);
                            return snapshot.data!.isNotEmpty
                                ? _historyDetailNew(htr: snapshot.data!)
                                : MyWidget.nodata(widget.param.lgs, context);
                          } else if (snapshot.hasError) {
                            // return MyClass.loading();
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.025,
                  ),
                  _buttomClick(),
                  SizedBox(
                    height: displayHeight(context) * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: MyColor.color('tabs'),
      //   child: Container(
      //     width: displayWidth(context) * 1,
      //     height: displayHeight(context) * 0.06,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(30.0),
      //       gradient: LinearGradient(
      //         colors: <Color>[
      //           MyColor.color('button'),
      //           MyColor.color('button'),
      //         ],
      //       ),
      //     ),
      //     padding: const EdgeInsets.only(right: 5),
      //     child: InkWell(
      //       onTap: () async {
      //         DateTime? newDateTime = await DatePicker.showPicker(context,
      //             locale: LocaleType.th,
      //             // maxTime: DateTime((DateTime.now().year + 543) + 1),
      //             // minTime: DateTime((DateTime.now().year + 543) - 3),
      //             // currentTime: DateTime(DateTime.now().year + 543),
      //             pickerModel: CustomPicker(currentTime: DateTime.now()));

      //         if (newDateTime != null) {
      //           String date = '';

      //           date = '${newDateTime.year - 543}-${newDateTime.month}-01';

      //           setState(() {
      //             dateS = date;
      //           });
      //         }
      //         // showMonthPicker(
      //         //   context: context,
      //         //   firstDate: DateTime(DateTime.now().year - 1, 12),
      //         //   lastDate: DateTime.now(),
      //         //   initialDate: DateTime.now(),
      //         //   locale: Locale("th"),
      //         // ).then((datetime) {
      //         //   if (datetime != null) {
      //         //     setState(() {
      //         //       widget.dateS = datetime.year.toString() +
      //         //           '-' +
      //         //           datetime.month.toString() +
      //         //           '-1';
      //         //     });
      //         //   }
      //         // });
      //       },
      //       child: Center(
      //         child: Text(
      //           LanguagePro.history('selectMonth', widget.param.lgs),
      //           textScaleFactor:
      //               MyClassPro.fontSizeApp(widget.param.fontsizeapps),
      //           style: CustomTextStyle.buttonTxt(context, 0),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('button'),
            MyColor.color('button'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () async {
          DateTime? newDateTime = await DatePicker.showPicker(context,
              locale: LocaleType.th,
              // maxTime: DateTime((DateTime.now().year + 543) + 1),
              // minTime: DateTime((DateTime.now().year + 543) - 3),
              // currentTime: DateTime(DateTime.now().year + 543),
              pickerModel: CustomPicker(currentTime: DateTime.now()));

          if (newDateTime != null) {
            String date = '';

            date = '${newDateTime.year - 543}-${newDateTime.month}-01';

            setState(() {
              dateS = date;
            });
          }
          // showMonthPicker(
          //   context: context,
          //   firstDate: DateTime(DateTime.now().year - 1, 12),
          //   lastDate: DateTime.now(),
          //   initialDate: DateTime.now(),
          //   locale: Locale("th"),
          // ).then((datetime) {
          //   if (datetime != null) {
          //     setState(() {
          //       widget.dateS = datetime.year.toString() +
          //           '-' +
          //           datetime.month.toString() +
          //           '-1';
          //     });
          //   }
          // });
        },
        child: Center(
          child: Text(
            LanguagePro.history('selectMonth', widget.param.lgs),
            textScaleFactor: MyClassPro.fontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.buttonTxt(context, 0),
          ),
        ),
      ),
    );
  }

  Container _head(context, lgs) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyColor.color('detailhead'),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset.fromDirection(0, 2.0),
              blurRadius: 6.0,
              spreadRadius: 1.0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              LanguagePro.history('historyDetail', lgs),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableTile(htr) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  htr.detail,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.defaultTxt(context, 3),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      MyClassPro.formatDatePro(htr.date),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.defaultTxtLight(context, 3),
                    ),
                    Text(
                      htr.amount,
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.defaultTxtC(
                          context,
                          3,
                          htr.signflag == '-1'
                              ? 'R'
                              : htr.signflag == '1'
                                  ? 'G'
                                  : 'b'),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      children: <Widget>[
        ListTile(
            title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  htr.type == '1'
                      ? 'บัญชี'
                      : htr.type == '8'
                          ? 'บัญชี'
                          : 'จากบัญชี',
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.defaultTxtC(context, 3, 'detail'),
                ),
                Text(
                  htr.accountIdFrom,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.defaultTxtLight(context, 3),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  htr.type == '1'
                      ? 'เลขที่สัญญา'
                      : htr.type == '8'
                          ? 'เลขที่สัญญา'
                          : 'ไปบัญชี',
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.defaultTxtC(context, 3, 'detail'),
                ),
                Text(
                  htr.accountIdTo,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.defaultTxtLight(context, 3),
                )
              ],
            ),
            htr.note != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'หมายเหตุ',
                        textScaleFactor:
                            MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStylePro.defaultTxtC(
                            context, 3, 'detail'),
                      ),
                      Text(
                        htr.note,
                        textScaleFactor:
                            MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStylePro.defaultTxtLight(context, 3),
                      ),
                    ],
                  )
                : Container()
          ],
        ))
      ],
    );
  }

  _historyDetailNew({htr}) => Container(
        // color: MyColorPro.color('detailadmin'),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColorPro.color('w'),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset.fromDirection(0, 2.0),
                blurRadius: 6.0,
                spreadRadius: 1.0)
          ],
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
            height: 0,
          ),
          itemCount: htr.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildExpandableTile(htr[index]);
          },
        ),
      );
}
