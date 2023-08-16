import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/models/admin/Share/statement_share_detail_model.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

var _tabIndex = 0;

// class ChareValue {
//   String updownchare;
//   String amountchare;
//
//   ChareValue(
//     this.amountchare,
//     this.updownchare,
//   );
//
// ChareValue() {
//   this.updownchare = '';
//   this.amountchare = '';
// }
//
// }

// ChareValue chareValue = ChareValue;

final _formKeyShareRequest = GlobalKey<FormState>();

class DiluteShares extends StatefulWidget {
  final Param param;
  final String imei;

  const DiluteShares({super.key, required this.imei, required this.param});

  @override
  DiluteSharesState createState() => DiluteSharesState();
}

String _chare = '0';

class DiluteSharesState extends State<DiluteShares> {
  String updownchare = '';
  String amountchare = '';
  String _shareValue = '0';
  String checkShareMsg = '';

  bool isChecked = true;
  bool isChecked2 = false;

  List<StatementShareDetailModel> shareDetail = [];

  _getChare() {
    NetworkPro.fetchAdminShare('{"mode":"1","data1":"","data2":"","data3":""}',
            widget.param.token, context)
        .then((value) {
      setState(() {
        _chare = value[0]['share_amount'];
        _shareValue = value[0]['share_stock'];
      });
    });
  }

  _saveCheckChangShare(dropstatus, amount) {
    if (isChecked == true) {
      _saveChangShare(amountchare, 2, 'บันทึกเปลี่ยนแปลงค่าหุ้นสำเร็จ');
      // _saveChangShare(
      //     amountchare, 2, value.split('#')[1])
    }
    // }
    // });
  }

  _saveChangShare(amount, status, msg) {
    NetworkPro.fetchChangShare(
            '{"new_share_amount": "$amount","drop_status":"$status"}',
            widget.param.token,
            context)
        .then((value) => {
              if (MyClass.json(value)[0]['rc_code'] == '1')
                {
                  MyClassPro.showAlertProApprove(
                      MyClass.json(value)[0]['message'], context)
                }
              else
                MyClassPro.showAlertPro(
                    MyClass.json(value)[0]['message'], context)
            });
  }

  @override
  void initState() {
    setState(() {
      _tabIndex = 0;
    });
    _getChare();
    _getShareDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarDetailUiPro(
            'assets/imgPro/DiluteShares.png',
            'diluteShares',
            widget.param.fontsizeapps,
            widget.param.lgs,
            context),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.1
                          : displayHeight(context) * 0.1,
                      width: displayWidth(context) * 1,
                    ),

                    // saveMonthlyShareRequest(),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * (tabletMode ? 0.13 : 0.17)),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(displayWidth(context) * 0.015),
                      child: TabBar(
                        // unselectedLabelColor: Colors.redAccent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: MyColorPro.color('buttonBar'),
                        ),
                        onTap: (index) {
                          setState(() {
                            _tabIndex = index;
                          });
                        },
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                LanguagePro.adminPro(
                                    'monthlyStock', widget.param.lgs, ''),
                                textScaleFactor: MyClassPro.fontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStylePro.buttonBarTxt(
                                    context, 2, _tabIndex == 0 ? 's' : 'n'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'ประวัติการเปลี่ยนแปลง\nค่าหุ้น',
                                textAlign: TextAlign.center,
                                // LanguagePro.tranPro(
                                //     'transferAccounts', widget.param.lgs),
                                textScaleFactor: MyClassPro.fontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStylePro.buttonBarTxt(
                                    context, 2, _tabIndex == 1 ? 's' : 'n'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          SingleChildScrollView(
                              // padding: EdgeInsets.only(
                              //     bottom: displayHeight(context) * 0.5),
                              child: saveMonthlyShareRequest()),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: paddinglist(context, 0),
                                    right: paddinglist(context, 0)),
                                child: _head(context, widget.param.lgs),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       left: paddinglist(context, 0),
                              //       right: paddinglist(context, 0)),
                              //   child: FutureBuilder<
                              //       List<StatementShareDetailModel>>(
                              //     future: NetworkPro.fetchStatementShare(
                              //         '{"mode":"6","data1":"","data2":"","data3":""}',
                              //         widget.param.token,
                              //         context),
                              //     builder: (context, snapshot) {
                              //       if (snapshot.hasData) {
                              //         return snapshot.data!.isNotEmpty
                              //             ? _detail(statement: snapshot.data)
                              //             : MyWidget.nodata(
                              //                 widget.param.lgs, context);
                              //       } else if (snapshot.hasError) {
                              //         return Text("${snapshot.error}");
                              //       }
                              //       return MyClass.loading();
                              //     },
                              //   ),
                              // ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: paddinglist(context, 0),
                                      right: paddinglist(context, 0)),
                                  child: shareDetail.isNotEmpty
                                      ? _detail(statement: shareDetail)
                                      : MyWidget.nodata(
                                          widget.param.lgs, context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // CustomUI.appbarUi(),
          ],
        ),
      ),
    );
  }

  Future<List<StatementShareDetailModel>> _getShareDetail() async {
    await NetworkPro.fetchStatementShare(
            '{"mode":"6","data1":"","data2":"","data3":""}',
            widget.param.token,
            context)
        .then((value) => {
              setState(() {
                shareDetail = value;
              })
            });
    throw Exception('Failed to load share detail');
  }

  Widget _detail({statement}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: ListView.separated(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
          shrinkWrap: true,
          itemCount: statement.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text(
                        MyClassPro.formatDatePro1(
                            statement[index].dateCompomise),
                        textAlign: TextAlign.center,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        MyClass.formatNumber(statement[index].oldShareAmount),
                        textAlign: TextAlign.center,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -3),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          MyClass.formatNumber(statement[index].newShareAmount),
                          textAlign: TextAlign.right,
                          textScaleFactor: MyClass.blocFontSizeApp(
                              widget.param.fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, -3),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        statement[index].cancelStatus.split('#')[0],
                        textAlign: TextAlign.right,
                        textScaleFactor:
                            MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                        style: CustomTextStylePro.defaultTxtCS(context, -4,
                            statement[index].cancelStatus.split('#')[1]),
                      )),
                ],
              ),
            );
          },
        ),
      );

//   Widget statementMonthlyShareRequest(){
// return   Padding(
//   padding: EdgeInsets.only(
//       left: paddinglist(context, 0),
//       right: paddinglist(context, 0)),
//   child: _head(context, widget.param.lgs),
// ),
//   }

  Widget saveMonthlyShareRequest() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.all(8),
          //   color: MyColorPro.color('headdetail'),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         LanguagePro.adminPro('monthlyStock', widget.param.lgs, ''),
          //         textScaleFactor: MyClassPro.FontSizeApp(widget.param.fontsizeapps),
          //         style: CustomTextStylePro.cardWTxt(context, 0),
          //       ),
          //       IconButton(
          //         icon: Icon(
          //           // expand_less_sharp
          //           _isSaveMonthlyShareRequestStatus == true
          //               ? Icons.expand_less_sharp
          //               : Icons.expand_more,
          //           color: Colors.white,
          //           size: 36.0,
          //         ),
          //         onPressed: () {
          //           setState(() {
          //             _isSaveMonthlyShareRequestStatus == true
          //                 ? _isSaveMonthlyShareRequestStatus = false
          //                 : _isSaveMonthlyShareRequestStatus = true;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // _isSaveMonthlyShareRequestStatus == true
          //     ?
          Container(
            padding: const EdgeInsets.all(8),
            color: MyColorPro.color('detailadmin'),
            child: Column(
              children: [
                _rowSaveMonthlyShareRequest(),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Divider(
                        endIndent: 5,
                        height: 20,
                        thickness: 2,
                        color: MyColorPro.color('b'),
                      ),
                    ),
                    Text(
                      LanguagePro.adminPro(
                          'monthlyShareRequest', widget.param.lgs, ''),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.headTxt(context, -1),
                    ),
                    Expanded(
                      flex: 5,
                      child: Divider(
                        indent: 5,
                        height: 20,
                        thickness: 2,
                        color: MyColorPro.color('b'),
                      ),
                    ),
                  ],
                ),
                _rowSaveMonthlyShareRequestData(),
              ],
            ),
          ),
          // : Container(),
          const SizedBox(
            height: 20,
          ),
          Container(
            // width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColorPro.color('gr'),
                  MyColorPro.color('gr1'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                if (_formKeyShareRequest.currentState!.validate()) {
                  _formKeyShareRequest.currentState!.save();

                  if (isChecked == true) {
                    _saveCheckChangShare("2", amountchare);
                  } else {
                    _saveChangShare('-', 1, 'งดส่งหุ้นรายเดือนสำเร็จ');
                  }
                }
              },
              child: Center(
                child: Text(
                  LanguagePro.adminPro(
                      isChecked ? 'saveShareValues' : 'saveShareNotSend',
                      widget.param.lgs,
                      ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.buttonTxt(context, -2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowSaveMonthlyShareRequest() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguagePro.adminPro('membership', widget.param.lgs, ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
                Text(
                  widget.param.membershipNo,
                  // MyClass.json(chare)[0]['membershipNo'],
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguagePro.adminPro('name', widget.param.lgs, ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
                Text(
                  widget.param.name,
                  // MyClass.json(chare)[0]['name'],
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguagePro.adminPro('unit', widget.param.lgs, ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
                Text(
                  MyClass.formatNumber(_shareValue) + ' บาท',
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguagePro.adminPro('shareValue', widget.param.lgs, ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
                Text(
                  MyClass.formatNumber(_chare) + ' บาท',
                  // MyClass.formatNumber(
                  //     MyClass.json(chare)[0]['share_amount']),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.adminDetailTxt(context, 2),
                ),
              ],
            ),
          ],
        ));
  }

  Container _head(context, lgs) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: MyColor.color('settings'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'วันที่',
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'เดิม',
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'ใหม่',
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'สถานะ',
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowSaveMonthlyShareRequestData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKeyShareRequest,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: MyColor.color('button'),
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                          isChecked2 == true
                              ? isChecked2 = false
                              : isChecked = true;
                        });
                      },
                    ),
                    Text(
                      'เปลี่ยนแปลงการส่ง\nค่าหุ้นรายเดือน',
                      // LanguagePro.adminPro('select', lgs,''),
                      textAlign: TextAlign.center,
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.detailTxt(context, -1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: MyColor.color('button'),
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked2,
                      onChanged: (value) {
                        setState(() {
                          isChecked2 = value!;
                          isChecked == true
                              ? isChecked = false
                              : isChecked2 = true;
                        });
                      },
                    ),
                    Text(
                      'งดส่งค่าหุ้นรายเดือน',
                      // LanguagePro.adminPro('select', lgs,''),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.detailTxt(context, -1),
                    )
                  ],
                ),
              ],
            ),
            isChecked2 == true
                ? Row(children: const [Text('')])
                : Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.05,
                              right: displayWidth(context) * 0.05),
                          child: TextFormField(
                            // keyboardType: TextInputType.number,
                            inputFormatters: [
                              CurrencyInputFormatter(
                                  thousandSeparator: ThousandSeparator.Comma)
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            textAlign: TextAlign.center,
                            style: CustomTextStylePro.detailTxt(context, 0),
                            decoration: InputDecoration(
                              labelText: LanguagePro.adminPro(
                                  'stockValues', widget.param.lgs, ''),
                              labelStyle: TextStyle(
                                color: MyColorPro.color('detail'),
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   // borderSide: BorderSide(
                              //   //   color: Colors.green,
                              //   //   width: 2.0,
                              //   // ),
                              // ),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                            ),

                            validator: (value) {
                              _validatChare(value);
                              return null;
                            },
                            onSaved: (value) {
                              amountchare = MyClassPro.formatNumberRcomma(value)
                                  .toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'รายการเปลี่ยนแปลงค่าหุ้นรายเดือนจะสมบูรณ์ ก็ต่อเมื่อทางสหกรณ์ \n ได้ทำการตรวจสอบและบันทึกเข้าระบบ',
              // LanguagePro.adminPro('select', lgs,''),
              textAlign: TextAlign.center,
              textScaleFactor:
                  MyClassPro.fontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStylePro.detail1Txt(context, 0),
            )
          ],
        ),
      ),
    );
  }

  _validatChare(value) {
    if (value.isEmpty) {
      return LanguagePro.adminPro('noDetail', widget.param.lgs, '');
    }
  }
}
