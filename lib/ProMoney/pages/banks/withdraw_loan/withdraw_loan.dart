import 'dart:convert';

import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../FollowMe/class/sizes.dart';
import '../../../../FollowMe/pages/auth/pins.dart';
import '../../../class/carditem.dart';
import '../../../class/custom_class.dart';
import '../../../class/custom_ui_pro.dart';
import '../../../class/languagepro.dart';
import '../../../class/myclasspro.dart';
import '../../../class/mycolorpro.dart';
import '../../../class/textstylepro.dart';
import '../../../models/withdraw_loan/withdraw_loan_check_model.dart';
import '../../../sevices/network_pro.dart';
import '../../checkslip/check.dart';
import '../../promoney.dart';

class DrawLoan extends StatefulWidget {
  final Param param;
  final String imei;
  final String bankNo;
  final String bankAccNo;

  const DrawLoan(
      {super.key,
      required this.imei,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  DrawLoanState createState() => DrawLoanState();
}

class DrawLoanState extends State<DrawLoan> {
  final _formKeyDrawLoan = GlobalKey<FormState>();

  List cardList = [];
  List cardBankList = [];
  List gAccountAll = [];
  int _currentIndex = 0;

  Object? valuebank;
  String amountaccount = '';
  String accountBank = '';
  String note = '';
  late ParamPro paramPro;

  Future<List<WithDrawLoanCheckModel>> _getWithDrawLoanCheck(
      from, to, amount, type) {
    NetworkPro.fetchWithDrawLoanCheck(
            '{"from_coop_account_no": "$from","transaction_amount":"$amount","note": "$note"}',
            widget.param.token,
            widget.param.cooptoken,
            context)
        .then((value) => {
              paramPro = ParamPro('icon', 'ktb', type, note, widget.imei),
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

  _getAccountBank() {
    cardBankList.add(AccountBankItem(
      bankNo: widget.bankNo,
      bankaccount: widget.bankAccNo,
      fontsizeapps: fontsizeapps,
    ));
  }

  _getAccountAll() async {
    cardList = [];
    List gAccounts = [];
    const accounts = 'accountAll';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gAccountAll = await jsonDecode(prefs.getString(accounts).toString());
    setState(() {
      for (var account in gAccountAll) {
        if (account['mobile_flag'] == 'Y') {
          if (account['coop_account_type'] == 'LOAN') {
            setState(() {
              if (account['withdraw_flag'] == 'Y' &&
                  account['modify_status'] == '0') {
                cardList.add(AccountItem(
                  title: account['coop_account_name'],
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
                gAccounts.add(account);
              }
            });
          }
        }
      }
      gAccountAll = gAccounts;
      if (gAccountAll.isEmpty) {
        MyClassPro.showAlertPro2(
            LanguagePro.other('loancontractwarning', widget.param.lgs),
            context);
      } else {
        _getlinkbank();
      }
    });
  }

  late String accountBay;

  _getAccountBay() async {
    const accounts = 'accountBay';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accountBay = await jsonDecode(prefs.getString(accounts).toString());
  }

  _getlinkbank() async {
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
    setState(() {});
    super.initState();
    _getAccountAll();
    _getAccountBank();
    _getAccountBay();
    // Future.delayed(Duration.zero, _getlinkbank);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarDetailUiPro('assets/imgPro/drawLoan.png',
            'drawLoan', widget.param.fontsizeapps, widget.param.lgs, context),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              height: displayHeight(context),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: paddinglist(context, 10),
                            right: paddinglist(context, 10)),
                        child: CustomClass.cardhead(widget.param.fontsizeapps,
                            widget.param.lgs, 'draw', context),
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
                                height: displayHeight(context) * 0.20,
                                aspectRatio: 12.0,
                                viewportFraction: 0.9,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                    // print(MyClass.json(accountList[_currentIndex]));
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
                                        : Colors.white,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 1,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: paddinglist(context, 10),
                                  right: paddinglist(context, 10)),
                              child: CustomClass.cardhead(
                                  widget.param.fontsizeapps,
                                  widget.param.lgs,
                                  'to',
                                  context),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.0),
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
                                      return Builder(
                                          builder: (BuildContext context) {
                                        return SizedBox(
                                          width: displayWidth(context) * 0.65,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MyClassPro
                                                          .cardBorderRadius()),
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
                            _drawLoan()
                          ],
                        ),
                      ),
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

  Widget _drawLoan() {
    return Container(
      color: MyColorPro.color('detailadmin'),
      padding: EdgeInsets.all(displayWidth(context) * 0.05),
      child: Form(
        key: _formKeyDrawLoan,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LanguagePro.tranPro('amount', widget.param.lgs),
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.headTxt(context, 0),
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
                labelText:
                    LanguagePro.tranPro('amountDetail', widget.param.lgs),
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
                amountaccount = MyClassPro.formatNumberRcomma(value).toString();
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
                  note = value!;
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
                  if (_formKeyDrawLoan.currentState!.validate()) {
                    _formKeyDrawLoan.currentState!.save();
                    if (double.parse(gAccountAll[_currentIndex]
                                ['avaliable_balance']
                            .toString()) <
                        double.parse(amountaccount.toString())) {
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
                      _getWithDrawLoanCheck(
                          MyClass.json(
                              gAccountAll[_currentIndex]['coop_account_no']),
                          accountBank,
                          amountaccount,
                          'withDrawLoanToBank');
                    }
                  }
                },
                child: Center(
                  child: Text(
                    LanguagePro.tranPro('next', widget.param.lgs),
                    textScaleFactor:
                        MyClassPro.fontSizeApp(widget.param.fontsizeapps),
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
      return LanguagePro.adminPro('checkadddetail', widget.param.lgs, '');
    } else if (MyClassPro.isNumericUsingtryParse(value) == false) {
      return LanguagePro.other('tryParse', widget.param.lgs);
    }
  }
}
