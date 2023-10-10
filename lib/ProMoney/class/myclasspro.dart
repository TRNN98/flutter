import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mwasc/root/tabs.dart';

class MyClassPro {
  static fontSizeApp(s) {
    return s;
  }

  static checkFormatAccountClose1(data, t) {
    int n = 0;
    if (data.toString().trim().isNotEmpty) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'tran' ||
            t == 'tranBank' ||
            t == 'tranAccount' ||
            t == 'withDrawBankToDep') {
          if (i == 0 || i == 2) {
            x = '${x}X-';
          } else {
            x = '${x}X';
          }
          d = '${data.toString().trim().substring(n, n + 3)}-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }

      if (t == 'tran' ||
          t == 'tranBank' ||
          t == 'tranAccount' ||
          t == 'withDrawBankToDep') {
        return x + d + d1;
      } else {
        return checkFormatAccountLoan(data);
      }
    } else {
      return data;
    }
  }

  static checkFormatAccountLoan(data) {
    // var d1 = '';
    // var d2 = '';
    // var d3 = '';
    // if (data.toString().trim().length > 0) {
    //   if (data.toString().trim().length == 8) {
    //     d1 = data.toString().trim().substring(0, 1);
    //     d2 = data.toString().trim().substring(1, 6);
    //     d3 = data.toString().trim().substring(6, 8);
    //     return d1 + '-' + d2 + '/' + d3;
    //   } else if (data.toString().trim().length == 9) {
    //     d1 = data.toString().trim().substring(0, 2);
    //     d2 = data.toString().trim().substring(2, 7);
    //     d3 = data.toString().trim().substring(7, 9);
    //     return d1 + '-' + d2 + '/' + d3;
    //   } else {
    //     return data;
    //   }
    // } else {
    //   return data;
    // }
    return data;
  }

  static checkFormatAccountClose(data, t) {
    int n = 0;
    if (data.toString().trim().isNotEmpty) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' || t == 'tran' || t == 'tranBank'
            // || t == 'buyshare'
            ) {
          if (i == 0 || i == 2) {
            x = '${x}X-';
          } else {
            x = '${x}X';
          }
          d = '${data.toString().trim().substring(n, n + 3)}-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' || t == 'tran' || t == 'tranBank'
          // || t == 'buyshare'
          ) {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
  }

  static checkFormatAccountCloseSCB(data, t) {
    int n = 0;
    if (data.toString().trim().isNotEmpty) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' ||
                t == 'tran' ||
                t == 'tranBank' ||
                t == 'withDrawBankToDep' ||
                t == 'withDrawLoanToBank'
            // || t == 'buyshare'
            ) {
          if (i == 2) {
            x = '${x}X-';
          } else {
            x = '${x}X';
          }
          d = '${data.toString().trim().substring(n, n + 3)}-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' ||
              t == 'tran' ||
              t == 'tranBank' ||
              t == 'withDrawBankToDep' ||
              t == 'withDrawLoanToBank'
          // || t == 'buyshare'
          ) {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
  }

  static checkFormatAccountCloseKTB(data, t) {
    int n = 0;
    if (data.toString().trim().isNotEmpty) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' ||
                t == 'tran' ||
                t == 'tranBank' ||
                t == 'withDrawBankToDep' ||
                t == 'withDrawLoanToBank' ||
                t == 'loanpayment'
            // || t == 'buyshare'
            ) {
          if (i == 2 || i == 3) {
            x = '${x}X-';
          } else {
            x = '${x}X';
          }
          d = '${data.toString().trim().substring(n, n + 3)}-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' ||
              t == 'tran' ||
              t == 'tranBank' ||
              t == 'withDrawBankToDep' ||
              t == 'withDrawLoanToBank' ||
              t == 'loanpayment'
          // || t == 'buyshare'
          ) {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
  }

  static checkFormatAccountCloseKTB1(data, t) {
    int n = 0;
    if (data.toString().trim().isNotEmpty) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' ||
                t == 'tran' ||
                t == 'tranBank' ||
                t == 'withDrawBankToDep' ||
                t == 'withDrawLoanToBank'
            // || t == 'buyshare'
            ) {
          if (i == 2 || i == 3) {
            x = '${x}x-';
          } else {
            x = '${x}x';
          }
          d = '${data.toString().trim().substring(n, n + 3)}-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' ||
              t == 'tran' ||
              t == 'tranBank' ||
              t == 'withDrawBankToDep' ||
              t == 'withDrawLoanToBank'
          // || t == 'buyshare'
          ) {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
  }

  static cardBorderRadius() {
    double n = 20.00;
    return n;
  }

  static checkNull(data) {
    return data.toString() == "null" ? '' : data.toString();
  }

  static currency() {
    return ' ฿';
  }

  static hiddenDialog(n, context) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  static List<T> cardMap<T>(List list, Function handler) {
    // return  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  static formatDatePro(s) {
    String s1;
    String t;
    s = s.toString().replaceAll('T', ' ');
    s = s.toString().replaceAll('.', ' ');
    s1 = s.split(' ')[0].toString();

    String d = s1.split('-')[2].toString();
    String m = s1.split('-')[1].toString();
    String y = (int.parse(s1.split('-')[0]) + 543).toString();
    t = '${s.split(' ')[1].toString().split(':')[0]}:${s.split(' ')[1].toString().split(':')[1]}';
    return '$d/$m/$y $t';
  }

  static formatDatePro1(s) {
    try {
      // String s1 = s.split(' ')[0].toString();
      String d = s.split('-')[2].toString();
      String m = s.split('-')[1].toString();
      String y = (int.parse(s.split('-')[0]) + 543).toString();

      return '$d/$m/$y';
    } catch (de) {
      return '';
    }
  }

  static getDatePro() {
    List dateList = [];
    var y = DateTime.now().year;
    var m = DateTime.now().month;
    var j = 0;
    int mm;
    int yy = y;
    String date;
    String dateNo;
    for (int i = 0; i < 12; i++) {
      if (m - j == 0) {
        m = 12;
        mm = m;
        yy = y - 1;
        j = 0;
      } else {
        mm = m - j;
      }
      j++;
      date = "$mm/${yy + 543}";
      dateNo = "$yy-$mm";
      dateList.addAll([
        {"date": date, "dateNo": dateNo}
      ]);
    }
    return dateList;
    // print(dateList);
  }

  static showToastPro(msg, context) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3);
  }

  static showAlertPro(msg, context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 5)),
      title: "",
      desc: msg,
      onWillPopActive: true,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        ),
      ],
    ).show();
  }

  static showAlertProApprove1(msg, context) {
    Alert(
      context: context,
      type: AlertType.success,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 5)),
      title: "",
      desc: msg,
      onWillPopActive: true,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      // closeFunction: ,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        ),
      ],
    ).show();
  }

  static showAlertPro1(msg, context, t, c, f, l) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.warning,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 5)),
      title: "",
      desc: msg,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      onWillPopActive: true,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
        ),
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => LinkAccount(
            //             fontsizeapps: f,
            //             lgs: l,
            //             token: t,
            //             cooptoken: c,
            //             accountStatusBay: 1,
            //           )),
            // ),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "เชื่อมต่อบัญชี",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        )
      ],
    ).show();
  }

  static showAlertProApprove(msg, context) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.success,
      title: "",
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      desc: msg,
      style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleCTxt(context, 3, 'Bl')),
      onWillPopActive: true,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ).show();
  }

  static showAlertProUnlink(msg, param, context) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.success,
      title: "",
      desc: msg,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleCTxt(context, 2, 'Bl')),
      onWillPopActive: true,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Tabs(param)),
                (Route<dynamic> route) => false)
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ).show();
  }

  static showAlertPro2(msg, context) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: msg,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      style: AlertStyle(
          descStyle: CustomTextStyle.dataHeadTitleCTxt(context, 3, 'Bl')),
      onWillPopActive: true,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('bt_bl1'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.buttonCTxt(context, 0, 'w'),
          ),
        ),
      ],
    ).show();
  }

  static showAlertProPinPro(msg, context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 5)),
      title: "",
      desc: msg,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      onWillPopActive: true,
      // closeFunction: ,
      buttons: [
        DialogButton(
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColorPro.color('buttonBar'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.dataBoldTxt1(context, -5),
          ),
        ),
      ],
    ).show();
  }

  static txtPro() {
    return 'ยังไม่มีดาต้าในการทดสอบ อยู่ระหว่างการพัฒนาระบบ  การทำงานของโปรแกรมหน้านี้จะเหมือนกับเมนู โอนเงินตนเอง';
  }

  static bankName() {
    List itemsaccountbank = [];
    itemsaccountbank = [
      {"value": 'ktb', "text": 'กรุงไทย\n', "img": 'assets/imgPro/ktb.png'},
      // {"value": 'scb', "text": 'ไทยพาณิชย์\n', "img": 'assets/imgPro/scb.png'},
      // {"value": 'kbank', "text": 'กสิกร\n', "img": 'assets/imgPro/kbank.png'},
    ];
    return itemsaccountbank;
  }

  static checkAmount10(amount) {
    int c = int.parse(amount) % 10;
    if (c == 0) {
      return 't';
    } else {
      return 'f';
    }
  }

  static isNumericUsingtryParse(s) {
    var string = formatNumberRcomma(s);
    if (string.toString().isEmpty) {
      return false;
    }
    final number = num.tryParse(string.toString());
    if (number == null) {
      return false;
    }
    return true;
  }

  static setformatNumber(value) {
    var price = double.parse(value);
    var comma = NumberFormat('###,###,###,###');
    return comma.format(price).replaceAll(' ', '');
  }

  static formatNumberRcomma(data) {
    double x = double.parse(data.replaceAll(',', '').toString());
    // toStringAsFixed(2)
    return x.toStringAsFixed(2);
  }

  static setDot() {
    // return   NumberFormat.simpleCurrency(name: 'EURO').format(123456); // EURO123,456.00
    return RegExp("(\\d+[,.]?[\\d{2}]*)");
  }

  static formatScbAccount(data) {
    var l = data.toString().length;
    var d = '';
    if (data.toString().isNotEmpty) {
      if (l == 10) {
        for (var i = 0; i <= 9; i++) {
          if (i == 2) {
            d += '${data.split('')[i]}-';
          } else if (i == 8) {
            d += '${data.split('')[i]}-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }

  static formatKBankAccount(data) {
    var l = data.toString().length;
    var d = '';
    if (data.toString().isNotEmpty) {
      if (l == 10) {
        for (var i = 0; i <= 9; i++) {
          if (i == 2) {
            d += '${data.split('')[i]}-';
          } else if (i == 3) {
            d += '${data.split('')[i]}-';
          } else if (i == 8) {
            d += '${data.split('')[i]}-';
          } else {
            d += data.split('')[i].toString();
          }
        }
      }
    } else {
      d = '';
    }
    return d;
    // return data.toString() == null ? '' : data.toString();
  }
}
