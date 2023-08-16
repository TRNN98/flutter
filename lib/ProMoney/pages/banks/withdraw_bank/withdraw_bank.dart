import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/promoney/class/custom_class.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../FollowMe/class/sizes.dart';
import '../../../../FollowMe/pages/auth/pins.dart';
import '../../../class/carditem.dart';
import '../../../class/custom_ui_pro.dart';
import '../../../class/myclasspro.dart';
import '../../../class/mycolorpro.dart';
import '../../../class/textstylepro.dart';
import '../../../models/withdraw_bank/withdraw_bank_check_model.dart';
import '../../../sevices/network_pro.dart';
import '../../checkslip/check.dart';
import '../../promoney.dart';

class WithDrawBank extends StatefulWidget {
  final Param param;
  final String imei;
  final String bankNo;
  final String bankAccNo;

  const WithDrawBank(
      {super.key,
      required this.imei,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  WithDrawBankState createState() => WithDrawBankState();
}

class WithDrawBankState extends State<WithDrawBank> {
  final _formKeywithDrawBank = GlobalKey<FormState>();
  dynamic valueaccountall;
  dynamic valuebank;
  dynamic amountLoan;
  dynamic accountBank;
  dynamic note;
  List cardList = [];
  List cardBankList = [];
  int _currentIndex = 0;
  List gAccountAll = [];
  late Map<String, dynamic> gAccount;
  dynamic paramPro;
  List gAccounts = [];
  List gAccountDeposit = [];

  // _getAccout() {
  //   for (var i = 0; i < 2; i++) {
  //     cardList.add(AccountItemBank(
  //       title: "บัญชี${i}",
  //       accountId: '122345678',
  //       remainingAmount: 12345,
  //       withdrawalAmount: 123456,
  //       fontsizeapps: 1.0,
  //       lgs: 'th',
  //       icon: i == 0 ? 'ktb' : 'ktb',
  //     ));
  //   }
  // }

  _getAccountBank() {
    cardBankList.add(AccountBankItem(
      bankNo: widget.bankNo,
      bankaccount: widget.bankAccNo,
      fontsizeapps: fontsizeapps,
    ));
  }

  _getAccountAll() async {
    cardList = [];
    const accounts = 'accountAll';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gAccountAll = await jsonDecode(prefs.getString(accounts).toString());
    setState(() {
      for (var account in gAccountAll) {
        if (account['mobile_flag'] == 'Y') {
          if (account['coop_account_type'] == 'SAVING') {
            setState(() {
              if (account['withdraw_flag'] == 'Y') {
                cardList.add(AccountItem(
                  title: account['coop_account_name'],
                  accountDesc: account['coop_account_desc'],
                  accountId: account['coop_account_no'],
                  remainingAmount:
                      MyClass.checkDouble(account['account_balance']),
                  withdrawalAmount:
                      MyClass.checkDouble(account['avaliable_balance']),
                  fontsizeapps: widget.param.fontsizeapps,
                  lgs: widget.param.lgs,
                  outstandingBalance:
                      MyClass.checkDouble(account['outstanding_balance']),
                  withdrawFlag: account['withdraw_flag'],
                  type: account['coop_account_type'],
                ));
                gAccountDeposit.add(account);
              }
              if (account['deposit_flag'] == 'Y') {
                gAccounts.add(account);
              }
            });
          }
        }
      }
      gAccountAll = gAccounts;
      if (gAccountAll.isEmpty) {
        MyClassPro.showAlertPro2(
            LanguagePro.other('depositaccountclose', widget.param.lgs),
            context);
      } else {
        _getlinkbank();
      }
    });
  }

  Future<List<WithDrawBankCheckModel>> _getWithDrawBankCheck(
      from, to, amount, type) async {
    await NetworkPro.fetchWithDrawBankCheck(
            '{"to_coop_account_no": "$to","transaction_amount":"$amount","note": "$note"}',
            widget.param.token,
            widget.param.cooptoken,
            context)
        .then((value) => {
              paramPro = ParamPro('ktb', 'icon', type, note, widget.imei),
              _pushcheck(value, type, note)
            });

    throw Exception('Failed to _getTranCheck');
  }

  _pushcheck(value, type, note) {
    MyClassPro.hiddenDialog(0, context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Check(
          data: jsonEncode(value[0].result),
          param: widget.param,
          paramPro: paramPro,
        ),
      ),
    );
  }

  late String accountBay;

  _getAccountBay() async {
    const accounts = 'accountBay';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accountBay = await jsonDecode(prefs.getString(accounts).toString());
  }

  _getlinkbank() {
    if (widget.bankNo.toString() == '00') {
      MyClassPro.showAlertPro2(
          LanguagePro.other('linkbankaccountclose', widget.param.lgs), context);
    } else if (widget.bankAccNo.toString() == '') {
      MyClassPro.showAlertPro2(
          LanguagePro.other('linkbankaccountclose', widget.param.lgs), context);
    }
    // else if (_linkbanks == 1) {
    //   MyClassPro.showAlertPro1(
    //       LanguagePro.other('linkbankaccount', widget.param.lgs),
    //       context,
    //       // widget.token,
    //       // widget.cooptoken,
    //       '',
    //       '',
    //       widget.param.fontsizeapps,
    //       widget.param.lgs);
    // }
    // else if (linkbanks == 1) {
    //   MyClassPro.showAlertPro2(
    //     LanguagePro.other('linkbankaccount', widget.param.lgs),
    //     context,
    //     // widget.token,
    //     // widget.cooptoken,
    //     // '',
    //     // '',
    //     // widget.param.fontsizeapps,
    //     // widget.param.lgs
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    _getAccountAll();
    _getAccountBay();
    _getAccountBank();
    // Future.delayed(Duration.zero, _getlinkbank);
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
            'assets/imgPro/withDrawBank.png',
            'withDrawBank',
            widget.param.fontsizeapps,
            widget.param.lgs,
            context),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              height: displayHeight(context),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      withDraws(tabletMode),
                      // SizedBox(
                      //   height: displayHeight(context) * 0.25,
                      // )
                    ],
                  ),
                ),
              ),
            ),

            // CustomUI.appbarUi(),
          ],
        ),
      ),
    );
  }

  Widget withDraws(tabletMode) {
    return Container(
      color: MyColorPro.color('detailadmin'),
      // padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKeywithDrawBank,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 10),
                  right: paddinglist(context, 10)),
              child: CustomClass.cardhead(widget.param.fontsizeapps,
                  widget.param.lgs, 'withDraw', context),
            ),

            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      disableCenter: true,
                      height: displayHeight(context) * 0.1,
                      aspectRatio: 12,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {},
                    ),
                    items: cardBankList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return SizedBox(
                          width: displayWidth(context) * 0.65,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MyClassPro.cardBorderRadius()),
                            ),
                            color: MyColorPro.color('ktb'),
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.025,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 10),
                      right: paddinglist(context, 10)),
                  child: CustomClass.cardhead(widget.param.fontsizeapps,
                      widget.param.lgs, 'to', context),
                )),
            Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      disableCenter: true,
                      height: displayHeight(context) * 0.20,
                      aspectRatio: 12.0,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return SizedBox(
                          width: displayWidth(context) * 0.65,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 7),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        offset: Offset.fromDirection(0, 2.0),
                                        blurRadius: 6.0,
                                        spreadRadius: 1.0)
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      MyClassPro.cardBorderRadius()),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: <Color>[
                                      MyColorPro.color('gr'),
                                      MyColorPro.color('gr1'),
                                    ],
                                  )),
                              child: card,
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        MyClassPro.cardMap<Widget>(cardList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? const Color(0xFFBA8C26)
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(
            //     top: displayHeight(context) * 0.02,
            //   ),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     // crossAxisAlignment: CrossAxisAlignment.start,
            //     // mainAxisSize: MainAxisSize.max,
            //     children: [
            //       Expanded(
            //         child: Divider(
            //           endIndent: 5,
            //           height: 20,
            //           thickness: 2,
            //           color: MyColorPro.color('card'),
            //         ),
            //         flex: 1,
            //       ),
            //       Text(
            //         LanguagePro.tranPro('to', widget.param.lgs),
            //         textScaleFactor:
            //             MyClassPro.fontSizeApp(widget.param.fontsizeapps),
            //         style: CustomTextStylePro.headTxt(context, 0),
            //       ),
            //       Expanded(
            //         child: Divider(
            //           indent: 5,
            //           height: 20,
            //           thickness: 2,
            //           color: MyColorPro.color('card'),
            //         ),
            //         flex: 5,
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 10),
                  right: paddinglist(context, 10)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguagePro.payPro('amount', widget.param.lgs),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.headTxt(context, 0),
                    ),
                    // Text(
                    //   LanguagePro.payPro('creditBalance', lgs) +
                    //       ' ' +
                    //       MyClass.formatNumber('12345') +
                    //       ' ' +
                    //       LanguagePro.payPro('baht', lgs),
                    //   textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    //   style: CustomTextStylePro.detailTxt(context, 0),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 10),
                  right: paddinglist(context, 10)),
              child: TextFormField(
                inputFormatters: [
                  CurrencyInputFormatter(
                      thousandSeparator: ThousandSeparator.Comma)
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                textAlign: TextAlign.center,
                style: CustomTextStylePro.detailTxt(context, 0),
                decoration: InputDecoration(
                  labelText:
                      LanguagePro.payPro('amountDetail', widget.param.lgs),
                  labelStyle: TextStyle(
                    color: MyColorPro.color('detail'),
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  errorStyle: CustomTextStylePro.showErrorTextField(context),
                ),
                validator: (value) {
                  _validatamount(value);
                  return null;
                },
                onSaved: (value) {
                  amountLoan = MyClassPro.formatNumberRcomma(value).toString();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 10),
                  right: paddinglist(context, 10)),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguagePro.other('note', widget.param.lgs),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.headTxt(context, 0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 10),
                  right: paddinglist(context, 10)),
              child: TextFormField(
                maxLength: 30,
                textAlign: TextAlign.center,
                style: CustomTextStylePro.detailTxt(context, 0),
                decoration: InputDecoration(
                  labelText: LanguagePro.other('note', widget.param.lgs),
                  labelStyle: TextStyle(
                    color: MyColorPro.color('detail'),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  border: const OutlineInputBorder(),
                  errorStyle: CustomTextStylePro.showErrorTextField(context),
                ),
                onSaved: (value) {
                  note = value;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.05,
                  right: displayWidth(context) * 0.05),
              child: Container(
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
                    if (_formKeywithDrawBank.currentState!.validate()) {
                      _formKeywithDrawBank.currentState!.save();
                      // if (valueaccountall == null) {
                      //   MyClassPro.showAlertPro(
                      //       LanguagePro.other('accountcheck', widget.param.lgs),
                      //       context);
                      // } else {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return MyClass.loading();
                        },
                      );
                      _getWithDrawBankCheck(
                          accountBank,
                          MyClass.json(gAccountDeposit[_currentIndex])[
                              'coop_account_no'],
                          amountLoan,
                          'withDrawBankToDep');
                      // }
                    }
                  },
                  child: Center(
                    child: Text(
                      LanguagePro.payPro('next', widget.param.lgs),
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.buttonTxt(context, 0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validatamount(value) {
    if (value.isEmpty) {
      return LanguagePro.adminPro('checkadddetail', widget.param.lgs, '');
    } else if (MyClassPro.isNumericUsingtryParse(value) == false) {
      return LanguagePro.other('tryParse', widget.param.lgs);
    }
  }
}
