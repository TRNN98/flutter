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
import 'package:mwasc/promoney/models/loan_payment/loan_payment_check_model.dart';
import 'package:mwasc/promoney/pages/checkslip/check.dart';
import 'package:mwasc/promoney/pages/promoney.dart';
import 'package:mwasc/promoney/sevices/network_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

double fontsizeapps = 1.0;

class LoanPayment extends StatefulWidget {
  final Param param;
  final String imei;
  final String bankNo;
  final String bankAccNo;

  const LoanPayment(
      {super.key,
      required this.imei,
      required this.param,
      required this.bankNo,
      required this.bankAccNo});

  @override
  LoanPaymentState createState() => LoanPaymentState();
}

class LoanPaymentState extends State<LoanPayment> {
  int currentIndex = 0;
  List cardListPayLoan = [];
  List cardBankList = [];
  List gAccountAll = [];
  List gAccountpay = [];
  String? valueaccountall;
  String amount = '';
  String notepay = '';

  final _formKeypayloan = GlobalKey<FormState>();
  final myController = TextEditingController();

  dynamic paramPro;

  Future<List<LoanPaymentCheckModel>> _getLoanPaymentCheck(
      from, to, amount, type) async {
    await NetworkPro.fetchLoanPaymentCheck(
            '{"to_coop_account_no": "$to","transaction_amount":"$amount","note": "$notepay"}',
            widget.param.token,
            widget.param.cooptoken,
            context)
        .then((value) => {
              paramPro = ParamPro('ktb', 'icon', type, notepay, widget.imei),
              checkLoanPaymentCheck(value),
            });
    throw Exception('Failed to _getLoanPaymentCheck');
  }

  checkLoanPaymentCheck(value) {
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

  late Map<String, dynamic> gAccount;
  late List cardList;

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
    List gAccountSaveing = [];
    const accounts = 'accountAll';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString(accounts)
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
                gAccountSaveing.add(account);
              }
            });
            if (account['deposit_flag'] == 'Y') {
              // gAccountSaveing.add(account);
            }
          } else {
            gAccounts.add(account);
          }
        }
      }
      gAccountAll = gAccounts;
      gAccountpay = gAccountSaveing;
    });
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
    setState(() {});
    super.initState();
    _getAccountAll();
    _getAccountBank();
    Future.delayed(Duration.zero, _getlinkbank);
  }

  @override
  Widget build(BuildContext context) {
    fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MyClass.tabletMode(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarDetailUiPro(
            'assets/imgPro/withDrawBank.png',
            'loanpayment',
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
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       left: paddinglist(context, 10),
                      //       right: paddinglist(context, 10)),
                      //   child: CustomClass.cardhead(widget.param.fontsizeapps,
                      //       widget.param.lgs, 'account', context),
                      // ),
                      lineSizedBox(context, -15),
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
                              widget.param.lgs, 'list', context),
                        ),
                      ),
                      payloanNew(tabletMode)
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

  Widget payloanNew(tabletMode) {
    return Container(
      color: MyColorPro.color('detailadmin'),
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKeypayloan,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LanguagePro.tranPro('contractnumber', widget.param.lgs),
                textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                style: CustomTextStylePro.headTxt(context, 0),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: MyColorPro.color('detail'),
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius:
                      BorderRadius.circular(MyClassPro.cardBorderRadius()),
                  isExpanded: true,
                  menuMaxHeight: displayHeight(context) * 0.9,
                  hint: Text(
                    LanguagePro.tranPro('userLoan', widget.param.lgs),
                    textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    style: CustomTextStylePro.detailTxt(context, 0),
                  ),
                  items: gAccountAll.map((item) {
                    // print(item["coop_account_name"].toString());
                    return DropdownMenuItem(
                      value: item["coop_account_no"],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["coop_account_name"].toString().trim(),
                            textScaleFactor:
                                MyClassPro.fontSizeApp(fontsizeapps),
                            style: CustomTextStylePro.detailTxt(context, 0),
                          ),
                          Text(
                            item["coop_account_no"].toString().trim(),
                            textScaleFactor:
                                MyClassPro.fontSizeApp(fontsizeapps),
                            style: CustomTextStylePro.detailTxt(context, -1),
                          ),
                          Divider(
                            indent: 0,
                            height: 2,
                            thickness: 0.2,
                            color: MyColorPro.color('line'),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      valueaccountall = value as String?;
                    });
                  },
                  value: valueaccountall,
                ),
              ),
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
                      LanguagePro.payPro('amount', widget.param.lgs),
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.headTxt(context, 0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                inputFormatters: [
                  CurrencyInputFormatter(
                    thousandSeparator: ThousandSeparator.Comma,
                  )
                ],
                textAlign: TextAlign.center,
                style: CustomTextStylePro.detailTxt(context, 0),
                decoration: InputDecoration(
                  labelText:
                      LanguagePro.payPro('amountDetail', widget.param.lgs),
                  labelStyle: TextStyle(
                    color: MyColorPro.color('detail'),
                  ),
                  focusedBorder: const OutlineInputBorder(),
                  border: const OutlineInputBorder(),
                  errorStyle: CustomTextStylePro.showErrorTextField(context),
                ),
                validator: (value) {
                  _validatamount(value);
                  return null;
                },
                onSaved: (value) {
                  amount = MyClassPro.formatNumberRcomma(value).toString();
                },
              ),
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
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
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
                  notepay = value!;
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
                    if (_formKeypayloan.currentState!.validate()) {
                      _formKeypayloan.currentState!.save();
                      if (double.parse(gAccountpay[currentIndex]
                                  ['avaliable_balance']
                              .toString()) <
                          double.parse(amount.toString())) {
                        MyClassPro.showAlertPro(
                            LanguagePro.other(
                                'checkamountover', widget.param.lgs),
                            context);
                      } else {
                        if (valueaccountall == null) {
                          MyClassPro.showAlertPro(
                              LanguagePro.other(
                                  'accountcheck', widget.param.lgs),
                              context);
                        } else {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return MyClass.loading();
                            },
                          );
                          _getLoanPaymentCheck(widget.bankAccNo,
                              valueaccountall, amount, 'loanpayment');
                        }
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      LanguagePro.payPro('next', widget.param.lgs),
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
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

  _validatamount(String? value) {
    if (value!.isEmpty) {
      return LanguagePro.adminPro('checkadddetail', widget.param.lgs, '');
    } else if (MyClassPro.isNumericUsingtryParse(value) == false) {
      return LanguagePro.other('tryParse', widget.param.lgs);
    }
  }
}
