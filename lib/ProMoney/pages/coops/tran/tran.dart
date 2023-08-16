import 'dart:convert';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/carditem.dart';
import 'package:udtscc/promoney/class/custom_class.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/models/tran/tran_check_model.dart';
import 'package:udtscc/promoney/pages/checkslip/check.dart';
import 'package:udtscc/promoney/pages/promoney.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List cardList = [];

class TranAccount extends StatefulWidget {
  final Param param;
  final String imei;

  const TranAccount({super.key, required this.imei, required this.param});

  @override
  TranAccountState createState() => TranAccountState();
}

class TranAccountState extends State<TranAccount> {
  var lgs = 'th';
  double fontsizeapps = 1.0;
  var _tabIndex = 0;

  String? valueaccountall;
  String? amountaccount;
  String? amountaccounttoaccount;
  String? destinationAccount;
  List gAccountAll = [];
  int _currentIndex = 0;
  final _formKeyAccoutUser = GlobalKey<FormState>();
  final _formKeyAccout = GlobalKey<FormState>();
  String? notetran;
  String? noteacc;
  late ParamPro paramPro;

  Future<List<TranCheckModel>> _getTranCheck(
      from, to, amount, type, note) async {
    if (type == 'tran' || type == 'tranAccount') {
      await NetworkPro.fetchTranCheck(
              '{"from_coop_account_no": "$from","to_coop_account_no": "$to","transaction_amount":"$amount","note": "$note"}',
              widget.param.token,
              widget.param.cooptoken,
              context)
          .then((value) => {
                paramPro = ParamPro('icon', 'icon', type, note, widget.imei),
                checkGetPayCheck(value),
              });
    }
    throw Exception('Failed to load _getTranCheck');
  }

  checkGetPayCheck(value) {
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

  List gAccounts = [];
  List gAccountWithdraw = [];

  _getAccountAll() async {
    cardList = [];
    const accounts = 'accountAll';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gAccountAll = await jsonDecode(prefs.getString(accounts).toString());
    setState(() {
      for (dynamic account in gAccountAll) {
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
      }
    });
  }

  // void checkgAccountAll(a) {
  //   List account = [];
  //   gAccountAll = [];
  //   gAccounts.forEach((value) {
  //     if (value['coop_account_no'].trim() != a) {
  //       print(a);
  //       account.add(value);
  //     }
  //   });
  //   setState(() {
  //     gAccountAll = account;
  //   });
  // }

  @override
  void initState() {
    setState(() {
      _tabIndex = 0;
    });
    super.initState();
    // _getAccount1();
    // _getAccount();
    _getAccountAll();
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
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomUIPro.appbarDetailUiPro('assets/imgPro/tran.png', 'tran',
            widget.param.fontsizeapps, widget.param.lgs, context),
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: SafeArea(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: paddinglist(context, 10),
                    //       right: paddinglist(context, 10)),
                    //   child: CustomClass.cardhead(widget.param.fontsizeapps,
                    //       widget.param.lgs, 'from', context),
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * (tabletMode ? 0.44 : 0.42)),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(displayWidth(context) * 0.055),
                      child: TabBar(
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
                                LanguagePro.tranPro('ownAccount', lgs),
                                textScaleFactor:
                                    MyClassPro.fontSizeApp(fontsizeapps),
                                style: CustomTextStylePro.buttonBarTxt(
                                    context, 2, _tabIndex == 0 ? 's' : 'n'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                LanguagePro.tranPro('transferAccounts', lgs),
                                textScaleFactor:
                                    MyClassPro.fontSizeApp(fontsizeapps),
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
                          Center(
                            child: SingleChildScrollView(
                                child: _tranaccountuser(tabletMode)),
                          ),
                          Center(
                            child: SingleChildScrollView(
                                child: _tranaccountaccount()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tranaccountaccount() {
    return Container(
      color: MyColorPro.color('detailadmin'),
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Form(
        key: _formKeyAccout,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LanguagePro.tranPro('accountid', lgs),
                textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                style: CustomTextStylePro.headTxt(context, 0),
              ),
            ),
            TextFormField(
              textAlign: TextAlign.center,
              maxLength: 9,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              style: CustomTextStylePro.detailTxt(context, 0),
              decoration: InputDecoration(
                labelText: LanguagePro.tranPro('accountDetail', lgs),
                labelStyle: TextStyle(
                  color: MyColorPro.color('detail'),
                ),
                border: const OutlineInputBorder(),
                errorStyle: CustomTextStylePro.showErrorTextField(context),
              ),
              // obscureText: true,
              validator: (value) {
                _validataccount(value);
                return null;
              },
              onSaved: (value) {
                destinationAccount = value;
              },
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguagePro.tranPro('amount', lgs),
                    textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    style: CustomTextStylePro.headTxt(context, 0),
                  ),
                ],
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
              //keyboardType: TextInputType.number,
              style: CustomTextStylePro.detailTxt(context, 0),
              decoration: InputDecoration(
                labelText: LanguagePro.tranPro('amountDetail', lgs),
                labelStyle: TextStyle(
                  color: MyColorPro.color('detail'),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                errorStyle: CustomTextStylePro.showErrorTextField(context),
              ),
              // obscureText: true,
              validator: (value) {
                _validatamount(value);
                return null;
              },
              onSaved: (value) {
                amountaccounttoaccount =
                    MyClassPro.formatNumberRcomma(value).toString();
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
                  noteacc = value;
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
                  if (_formKeyAccout.currentState!.validate()) {
                    _formKeyAccout.currentState!.save();
                    if (MyClass.cutSpaceString(
                            MyClass.json(gAccountWithdraw[_currentIndex])[
                                'coop_account_no']) !=
                        destinationAccount) {
                      if (double.parse(gAccountWithdraw[_currentIndex]
                                  ['avaliable_balance']
                              .toString()) <
                          double.parse(amountaccounttoaccount.toString())) {
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
                            destinationAccount,
                            amountaccounttoaccount,
                            'tranAccount',
                            noteacc);
                      }
                    } else {
                      MyClassPro.showAlertPro(
                          LanguagePro.other('checkaccount', widget.param.lgs),
                          context);
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

  Widget _tranaccountuser(tabletMode) {
    return Container(
      color: MyColorPro.color('detailadmin'),
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Form(
        key: _formKeyAccoutUser,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LanguagePro.tranPro('accountid', lgs),
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
                    LanguagePro.tranPro('userAccount', lgs),
                    textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    style: CustomTextStylePro.detailTxt(context, 0),
                  ),
                  items: gAccountAll.map((item) {
                    return DropdownMenuItem(
                      enabled: true,
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
                            style: CustomTextStylePro.detailTxt(context, -2),
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
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LanguagePro.tranPro('amount', lgs),
                    textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                    style: CustomTextStylePro.headTxt(context, 0),
                  ),
                ],
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
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
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
                  notetran = value;
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
                  if (_formKeyAccoutUser.currentState!.validate()) {
                    _formKeyAccoutUser.currentState!.save();
                    if (MyClass.json(gAccountWithdraw[_currentIndex])[
                            'coop_account_no'] !=
                        valueaccountall) {
                      if (double.parse(gAccountWithdraw[_currentIndex]
                                  ['avaliable_balance']
                              .toString()) <
                          double.parse(amountaccount.toString())) {
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
                          _getTranCheck(
                              MyClass.json(gAccountWithdraw[_currentIndex])[
                                  'coop_account_no'],
                              valueaccountall,
                              amountaccount,
                              'tran',
                              notetran);
                        }
                      }
                    } else {
                      MyClassPro.showAlertPro(
                          LanguagePro.other('checkaccount', widget.param.lgs),
                          context);
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

  _validataccount(value) {
    if (value.isEmpty) {
      return LanguagePro.other('destinationAccount', lgs);
    }
  }

  void getaccount(p) {
    gAccountAll.toList();
    for (final json in gAccountAll) {
      if (json['coop_account_name'] == p) {}
    }
  }
}
