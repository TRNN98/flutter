import 'dart:convert';

import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/promoney/class/carditem.dart';
import 'package:mwasc/promoney/class/custom_class.dart';
import 'package:mwasc/promoney/class/custom_ui_pro.dart';
import 'package:mwasc/promoney/class/languagepro.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:mwasc/promoney/class/textstylepro.dart';
import 'package:mwasc/promoney/models/tran_bank/tran_bankcheck_model.dart';
import 'package:mwasc/promoney/sevices/network_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../checkslip/check.dart';
import '../../promoney.dart';

class TranBank extends StatefulWidget {
  final Param param;
  final String imei;
  final String bankNo;
  final String bankAccNo;

  const TranBank(
      {super.key,
      required this.imei,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  TranBankState createState() => TranBankState();
}

class TranBankState extends State<TranBank> {
  var lgs = 'th';
  double fontsizeapps = 1.0;
  String valuebank = '';

  dynamic accountBank;
  dynamic amountBank;
  late List gAccountAll;
  List cardList = [];
  List cardBankList = [];
  int _currentIndex = 0;
  final _formKeyAccoutBank = GlobalKey<FormState>();
  dynamic notebank;

  List gAccounts = [];
  List gAccountWithdraw = [];
  dynamic paramPro;

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
                gAccountWithdraw.add(account);
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

  String? accountBay;

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
    //   MyClassPro.showAlertPro2(
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
    setState(() {});
    super.initState();
    _getAccountAll();
    _getAccountBank();
    _getAccountBay();
    // Future.delayed(Duration.zero, _getlinkbank);
  }

  Future<List<TranBankCheckModel>> _getTranCheck(
      from, to, amount, type, note) async {
    await NetworkPro.fetchTranBankCheck(
            '{"from_coop_account_no": "$from","transaction_amount":"$amount","note": "$note"}',
            widget.param.token,
            widget.param.cooptoken,
            context)
        .then((value) => {
              paramPro = ParamPro('icon', 'ktb', type, note, widget.imei),
              _pushcheck(value, type, note)
              // value != null
              //     ? _pushcheck(value, type, note)
              //     : MyClassPro.hiddenDialog(0, context),
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

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    lgs = widget.param.lgs;
    fontsizeapps = widget.param.fontsizeapps;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarDetailUiPro('assets/imgPro/tranbanks.png',
            'tranbank', widget.param.fontsizeapps, widget.param.lgs, context),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              height: displayHeight(context),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: paddinglist(context, 10),
                            right: paddinglist(context, 10)),
                        child: CustomClass.cardhead(widget.param.fontsizeapps,
                            widget.param.lgs, 'from', context),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: displayHeight(context) * 0.0),
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                disableCenter: true,
                                height: displayHeight(context) * 0.2,
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
                                      padding: const EdgeInsets.only(
                                          top: 7, bottom: 7),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  offset: Offset.fromDirection(
                                                      0, 2.0),
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
                              children: MyClassPro.cardMap<Widget>(cardList,
                                  (index, url) {
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == index
                                          ? const Color(0xFFBA8C26)
                                          : Colors.white),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: paddinglist(context, 10),
                            right: paddinglist(context, 10)),
                        child: CustomClass.cardhead(widget.param.fontsizeapps,
                            widget.param.lgs, 'to', context),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: displayHeight(context) * 0.0),
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                disableCenter: true,
                                height: displayHeight(context) * 0.1,
                                aspectRatio: 12.0,
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
                      _tranaccountbank()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tranaccountbank() {
    return Container(
      color: MyColorPro.color('detailadmin'),
      padding: EdgeInsets.all(displayWidth(context) * 0.05),
      child: Form(
        key: _formKeyAccoutBank,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LanguagePro.tranPro('amount', lgs),
                textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                style: CustomTextStylePro.headTxt(context, 0),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [],
              ),
            ),
            TextFormField(
              inputFormatters: [
                CurrencyInputFormatter(
                    thousandSeparator: ThousandSeparator.Comma)
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              textAlign: TextAlign.center,
              style: CustomTextStylePro.detailTxt(context, 0),
              decoration: InputDecoration(
                labelText: LanguagePro.tranPro('amountDetail', lgs),
                labelStyle: TextStyle(
                  color: MyColorPro.color('detail'),
                ),
                focusedBorder: const OutlineInputBorder(),
                border: const OutlineInputBorder(),
                errorStyle: CustomTextStylePro.showErrorTextField(context),
              ),
              // obscureText: true,
              validator: (value) {
                _validatamount(value);
                return null;
              },
              onSaved: (value) {
                // amountBank = value;
                amountBank = MyClassPro.formatNumberRcomma(value).toString();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 0, right: 0),
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
              padding: const EdgeInsets.only(left: 0, right: 0),
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
                  notebank = value;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
                  if (_formKeyAccoutBank.currentState!.validate()) {
                    _formKeyAccoutBank.currentState!.save();
                    if (double.parse(gAccountWithdraw[_currentIndex]
                                ['avaliable_balance']
                            .toString()) <
                        double.parse(amountBank.toString())) {
                      MyClassPro.showAlertPro(
                          LanguagePro.other(
                              'checkamountover', widget.param.lgs),
                          context);
                    } else {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return MyClass.loading();
                        },
                      );
                      _getTranCheck(
                          MyClass.json(gAccountWithdraw[_currentIndex])[
                              'coop_account_no'],
                          accountBank,
                          amountBank,
                          'tranBank',
                          notebank);
                    }
                  }
                },
                child: Center(
                  child: Text(
                    LanguagePro.tranPro('next', lgs),
                    textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    style: CustomTextStylePro.buttonTxt(context, 0),
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
      return LanguagePro.adminPro('checkadddetail', lgs, '');
    } else if (MyClassPro.isNumericUsingtryParse(value) == false) {
      return LanguagePro.other('tryParse', lgs);
    }
  }

  void getaccount(p) {
    gAccountAll.toList();
    for (final json in gAccountAll) {
      if (json['coop_account_name'] == p) {}
    }
  }
}
