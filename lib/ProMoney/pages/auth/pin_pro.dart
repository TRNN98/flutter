import 'dart:async';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/locals/db_pin.dart';
import 'package:udtscc/FollowMe/models/sql/pin_db.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/pages/lock/lockpin.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/models/tran/tran_con_model.dart';
import 'package:udtscc/promoney/pages/checkslip/slip.dart';
import 'package:udtscc/promoney/pages/promoney.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:flutter/material.dart';

import '../../models/tran_bank/tran_bankcon_model.dart';
import '../../models/withdraw_bank/withdraw_bank_con_model.dart';
import '../../models/withdraw_loan/withdraw_loan_con_model.dart';

class PinPro extends StatefulWidget {
  final Param param;
  final ParamPro paramPro;
  final dynamic data;

  const PinPro({
    super.key,
    required this.param,
    required this.paramPro,
    required this.data,
  });

  @override
  PinProState createState() => PinProState();
}

class PinProState extends State<PinPro> {
  PinDb pin = PinDb();
  String numberPin = '';
  String title = '';

  late DBPin dBPin;

  hiddenDialog(n) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  Future<List<WithDrawLoanConModel>> _getConfirmLoanToBank(from, to, amount) {
    if (widget.paramPro.type == 'withDrawLoanToBank') {
      NetworkPro.fetchWithDrawLoanConfirm(
              '{"from_coop_account_no": "$from","to_bay_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}"}',
              widget.param.token,
              widget.param.cooptoken,
              context)
          .then((value) => {
                _nextpage(jsonDecode(jsonEncode(value[0])), 6),
              });
    }
    throw Exception('error _getConfirm');
  }

  Future<List<WithDrawBankConModel>> _getConfirmBank(from, to, amount) {
    if (widget.paramPro.type == 'withDrawBankToDep') {
      if (widget.paramPro.img == 'ktb') {
        NetworkPro.fetchWithDrawConfirm(
                '{"from_bay_account_no": "$from","to_coop_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}"}',
                widget.param.token,
                widget.param.cooptoken,
                context)
            .then((value) => {_nextpage(jsonDecode(jsonEncode(value[0])), 7)});
      }
    }
    throw Exception('error _getConfirm');
  }

  Future<List<TranBankConModel>> _getTranBankConfirm(from, to, amount) async {
    if (widget.paramPro.type == 'tranBank') {
      if (widget.paramPro.img1 == 'ktb') {
        await NetworkPro.fetchTranBankConfirm(
                '{"from_coop_account_no": "$from","to_bay_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}","transactionDateTime":"${widget.data['transactionDateTime']}","tokenizerId":"${widget.data['tokenizerId']}"}',
                widget.param.token,
                widget.param.cooptoken,
                context)
            .then((value) => {
                  _nextpage(jsonDecode(jsonEncode(value[0])), 5),
                });
      }
    }
    throw Exception('error _getConfirm');
  }

  Future<List<WithDrawBankConModel>> _getConfirmLoanPayment(from, to, amount) {
    if (widget.paramPro.type == 'loanpayment') {
      if (widget.paramPro.img == 'ktb') {
        NetworkPro.fetchLoanPaymentConfirm(
                '{"from_bay_account_no": "$from","to_coop_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}"}',
                widget.param.token,
                widget.param.cooptoken,
                context)
            .then((value) => {_nextpage(jsonDecode(jsonEncode(value[0])), 8)});
      }
    }
    throw Exception('error _getConfirmLoanPayment');
  }

  Future<List<TranConModel>> _getConfirm(from, to, amount) async {
    if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      NetworkPro.fetchTranConfirm(
              '{"from_coop_account_no": "$from","to_coop_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}"}',
              widget.param.token,
              widget.param.cooptoken,
              context)
          .then((value) => {
                _nextpage(jsonDecode(jsonEncode(value[0])),
                    widget.paramPro.type == 'tran' ? 3 : 4)
              });
    }

    if (widget.paramPro.type == 'pay') {
      await NetworkPro.fetchPayConfirm(
              '{"from_coop_account_no": "$from","to_coop_account_no": "$to","transaction_amount":"$amount","note": "${widget.paramPro.note}","transaction_id":"${widget.data['transaction_id']}"}',
              widget.param.token,
              widget.param.cooptoken,
              context)
          .then((value) => {_nextpage(jsonDecode(jsonEncode(value[0])), 1)});
    }

    // if (widget.paramPro.type == 'buyshare') {
    //   NetworkPro.fetchBuyShareConfirm(
    //           '{"from_coop_account_no": "' +
    //               from +
    //               '","transaction_amount":"' +
    //               amount +
    //               '","note": "' +
    //               widget.paramPro.note +
    //               '","transaction_id":"' +
    //               widget.data['transaction_id'] +
    //               '"}',
    //           widget.param.token,
    //           widget.param.cooptoken,
    //           context)
    //       .then((value) => {
    //             value != null
    //                 ? _nextpage(jsonDecode(jsonEncode(value[0])), 2)
    //                 : null,
    //           });
    // }
    setState(() {});
    throw Exception('error _getConfirm');
  }

  @override
  void initState() {
    dBPin = DBPin();
    super.initState();
    title = LanguagePro.pinPro('pinCode', widget.param.lgs);
  }

  @override
  void dispose() {
    dBPin.close();
    super.dispose();
  }

  var counts = 0;
  bool isAlertPin = false;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUIPro.appbarUi1(),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGroundAuth(),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.03
                      : displayHeight(context) * 0.05,
                ),
                CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.0275
                      : displayHeight(context) * 0.0275,
                ),
                Text(MyClass.company('th'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.dataHeadTitleCTxt(context, 3, 'Go')),
                Text(MyClass.company('en'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    textAlign: TextAlign.center,
                    style:
                        CustomTextStyle.dataHeadTitleCTxt(context, -2, 'Go')),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    title ==
                            LanguagePro.pinPro(
                                'pleaseTryAgain', widget.param.lgs)
                        ? '$title ($counts/3)'
                        : title,
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataHeadTitleCTxt(
                        context,
                        2,
                        title ==
                                LanguagePro.pinPro(
                                    'pleaseTryAgain', widget.param.lgs)
                            ? 'R'
                            : 'Go')),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    numberPin.isNotEmpty
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 2
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 3
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 4
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 5
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                    numberPin.length >= 6
                        ? _joinCodePanel(1)
                        : _joinCodePanel(0),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: tabletMode ? 2.8 : 1.8,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      _buttompin('1'),
                      _buttompin('2'),
                      _buttompin('3'),
                      _buttompin('4'),
                      _buttompin('5'),
                      _buttompin('6'),
                      _buttompin('7'),
                      _buttompin('8'),
                      _buttompin('9'),
                      _buttompin(''),
                      _buttompin('0'),
                      _buttompin(
                          LanguagePro.pinPro('delete', widget.param.lgs)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttompin(n) {
    return InkResponse(
      onTap: () {
        _onCodeClick(n);
      },
      child: n == ''
          ? Container()
          : Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: MyColor.color('button'),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, -2),
                    ),
                    BoxShadow(
                      color: MyColor.color('button'),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: Center(
                child: Text(
                  n.toString(),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataHeadTitleTxt(context, 10),
                ),
              ),
            ),
    );
  }

  _onCodeClick(n) {
    setState(() {
      numberPin += n;
      if (n == LanguagePro.pinPro('delete', widget.param.lgs)) {
        numberPin = '';
      }
    });
    if (numberPin.length >= 6) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );
      if (title == LanguagePro.pinPro('pinCode', widget.param.lgs) ||
          title == LanguagePro.pinPro('pleaseTryAgain', widget.param.lgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onCheckPin(MyClass.json(value)[0]['pinnumber']),
                    },
                  )
            });
      }
    }
  }

  Future _insertHistory(obj) async {
    await NetworkPro.fetchInsertHistory(
        obj, widget.param.token, widget.param.cooptoken, context);
  }

  _history(data, checktype) {
    List obj = [];
    if (widget.paramPro.type == 'pay') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": data['result']['from_account_name'],
          "account_id_from": data['result']['from_coop_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_coop_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "coop",
          "note": widget.paramPro.note
        }
      ];
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   obj = [
    //     {
    //       "mode": "1",
    //       "type": checktype,
    //       "account_name_from": data['result']['from_account_name'],
    //       "account_id_from": data['result']['from_coop_account_no'],
    //       "account_name_to": data['result']['to_account_name'],
    //       "account_id_to": data['result']['to_coop_account_no'],
    //       "amount": data['result']['transaction_amount'],
    //       "date": data['result']['transaction_date'],
    //       "fee": data['result']['transaction_fee'],
    //       "imei": widget.paramPro.imei,
    //       "bank": "coop",
    //       "note": widget.paramPro.note
    //     }
    //   ];
    // }
    else if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": data['result']['from_account_name'],
          "account_id_from": data['result']['from_coop_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_coop_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "coop",
          "note": widget.paramPro.note
        }
      ];
    } else if (widget.paramPro.type == 'tranBank') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": data['result']['from_account_name'],
          "account_id_from": data['result']['from_coop_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_bay_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "ktb",
          "note": widget.paramPro.note
        }
      ];
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": data['result']['from_account_name'],
          "account_id_from": data['result']['from_coop_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_bay_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "ktb",
          "note": widget.paramPro.note
        }
      ];
    } else if (widget.paramPro.type == 'withDrawBankToDep') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": '',
          "account_id_from": data['result']['from_bay_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_coop_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "ktb",
          "note": widget.paramPro.note
        }
      ];
    } else if (widget.paramPro.type == 'loanpayment') {
      obj = [
        {
          "mode": "1",
          "type": checktype,
          "account_name_from": '',
          "account_id_from": data['result']['from_bay_account_no'],
          "account_name_to": data['result']['to_account_name'],
          "account_id_to": data['result']['to_coop_account_no'],
          "amount": data['result']['transaction_amount'],
          "date": data['result']['transaction_date'],
          "fee": data['result']['transaction_fee'],
          "imei": widget.paramPro.imei,
          "bank": "ktb",
          "note": widget.paramPro.note
        }
      ];
    }
    _insertHistory(obj);
  }

  _nextpage(data, checktype) {
    hiddenDialog(0);
    _history(data, checktype);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Slip(
          data: data['result'],
          param: widget.param,
          paramPro: widget.paramPro,
        ),
      ),
    );
  }

  _onCheckPin(p) {
    if (numberPin == p) {
      var objAuth = '';
      objAuth =
          '{"pass":"","mode": "4","membership_no":"${widget.param.membershipNo}"}';
      Network.fetchAuthCount(objAuth).then((value) => {});
      numberPin = '';
      checkType();
    } else {
      var objAuth = '';
      hiddenDialog(1);
      objAuth =
          '{"pass":"","mode": "3","membership_no":"${widget.param.membershipNo}"}';
      Network.fetchAuthCount(objAuth).then((value) => {
            title = LanguagePro.pinPro('pleaseTryAgain', widget.param.lgs),
            numberPin = '',
            _setcounts(value),
          });
    }
  }

  _alertPin() {
    if (isAlertPin) {
      Alert(
        context: context,
        closeIcon: const Text(''),
        useRootNavigator: false,
        style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleTxt(context, 2),
          titleStyle: CustomTextStyle.dataHeadTitleTxt(context, 6),
          alertBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
        ),
        title: "คำเตือน",
        desc:
            "หากกรอก Pin ผิดเกิน 3 ครั้ง\nระบบจะทำการล็อคจากแอปพลิเคชั่น\nเป็นเวลา 24 ชม.",
        onWillPopActive: true,
        buttons: [
          DialogButton(
            radius: const BorderRadius.all(Radius.circular(20)),
            width: displayWidth(context) * 0.5,
            onPressed: () => {Navigator.pop(context)},
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('buttongra'),
                MyColor.color('buttongra1'),
              ],
            ),
            child: Text(
              "ยืนยัน",
              style: CustomTextStyle.dataBoldTxt1(context, -5),
            ),
          ),
        ],
      ).show();
    }
  }

  _setcounts(v) {
    counts = MyClass.json(v)[0]["count"];
    _checkAuthLock();
    if (counts == 2) {
      setState(() {
        isAlertPin = true;
      });
    } else {
      setState(() {
        isAlertPin = false;
      });
    }
    _alertPin();
  }

  _checkAuthLock() async {
    var objAuth = '';
    objAuth =
        '{"pass":"","mode": "5","membership_no":"${widget.param.membershipNo} "}';

    Network.fetchAuthCount(objAuth).then((v) => {
          if (MyClass.json(v)[0]["status"].toString() == '1')
            {
              Navigator.of(context, rootNavigator: true).pop(),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LockPin(user: widget.param.membershipNo),
                ),
              ),
            }
        });
  }

  // _onCheckPin(p) {
  //   if (numberPin == p) {
  //     numberPin = '';
  //     checkType();
  //   } else {
  //     title = LanguagePro.pinPro('pleaseTryAgain', widget.param.lgs);
  //     hiddenDialog(1);
  //     numberPin = '';
  //     setState(() {});
  //   }
  // }

  Widget _joinCodePanel(n) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: _codePanel(n),
    );
  }

  _codePanel(n) {
    if (n == 1) {
      return SizedBox(
          width: 22,
          height: 22,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFBA8C26), width: 2.0),
                color: const Color(0xFFBA8C26)),
          ));
    } else {
      return SizedBox(
        width: 22,
        height: 22,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE4E4E4), width: 2.0),
              color: const Color(0xFFE4E4E4)),
        ),
      );
    }
  }

  checkType() {
    if (widget.paramPro.type == 'withDrawBankToDep') {
      _getConfirmBank(
        widget.data['from_bay_account_no'],
        widget.data['to_coop_account_no'],
        widget.data['transaction_amount'],
      );
    } else if (widget.paramPro.type == 'loanpayment') {
      _getConfirmLoanPayment(
        widget.data['from_bay_account_no'],
        widget.data['to_coop_account_no'],
        widget.data['transaction_amount'],
      );
    } else if (widget.paramPro.type == 'pay') {
      _getConfirm(
        widget.data['from_coop_account_no'],
        widget.data['to_coop_account_no'],
        widget.data['transaction_amount'],
      );
    }
    // else if (widget.paramPro.type == 'buyshare') {
    //   _getConfirm(
    //     widget.data['from_coop_account_no'],
    //     '',
    //     widget.data['transaction_amount'],
    //   );
    // }
    else if (widget.paramPro.type == 'tran' ||
        widget.paramPro.type == 'tranAccount') {
      _getConfirm(
        widget.data['from_coop_account_no'],
        widget.data['to_coop_account_no'],
        widget.data['transaction_amount'],
      );
    } else if (widget.paramPro.type == 'withDrawLoanToBank') {
      _getConfirmLoanToBank(
        widget.data['from_coop_account_no'],
        widget.data['to_bay_account_no'],
        widget.data['transaction_amount'],
      );
    } else if (widget.paramPro.type == 'tranBank') {
      _getTranBankConfirm(
        widget.data['from_coop_account_no'],
        widget.data['to_bay_account_no'],
        widget.data['transaction_amount'],
      );
    }
  }
}
