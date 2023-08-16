// import 'dart:convert';

// import 'package:udtscc/FollowMe/class/customUI.dart';
// import 'package:udtscc/FollowMe/class/myclass.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../FollowMe/class/sizes.dart';
// import '../../../../FollowMe/pages/auth/Pins.dart';
// import '../../../class/carditem.dart';
// import '../../../class/customClass.dart';
// import '../../../class/customUIPro.dart';
// import '../../../class/languagepro.dart';
// import '../../../class/myclasspro.dart';
// import '../../../class/mycolorpro.dart';
// import '../../../class/textstylepro.dart';
// import '../../../models/pay/PayCheckModel.dart';
// import '../../../sevices/networdPro.dart';
// import '../../checkslip/check.dart';
// import '../../promoney.dart';

// var lgs = 'th';
// double fontsizeapps = 1.0;

// var _tabIndex = 0;

// List cardListPayLoan = [];
// List gAccountAll = [];
// List gAccountpay = [];

// var valueaccountall;

// var amount;
// var amountShare;

// var notepay;
// var noteshare;

// class BuyChare extends StatefulWidget {
//   Param param;
//   String imei;

//   BuyChare({required this.imei, required this.param});

//   @override
//   _BuyChareState createState() => _BuyChareState();
// }

// class _BuyChareState extends State<BuyChare> {
//   int _currentIndex = 0;

//   int _currentIndexBuyshare = 0;
//   final _formKeybuyshare = GlobalKey<FormState>();
//   final myController = TextEditingController();
//   var xx;
//   var paramPro;

//   Future<List<PayCheckModel>> _getBuyShareCheck(from, amounts, type) async {
//     await NetworkPro.fetchBuyShareCheck(
//             '{"from_coop_account_no": "' +
//                 from +
//                 '","transaction_amount":"' +
//                 amounts +
//                 '","note": "' +
//                 noteshare +
//                 '"}',
//             widget.param.token,
//             widget.param.cooptoken,
//             context)
//         .then((value) => {
//               paramPro = ParamPro('pay', 'pay', type, noteshare, widget.imei),
//               checkGetBuyChareCheck(value),
//             });
//     throw Exception('Failed to _getPayCheck');
//   }

//   checkGetBuyChareCheck(value) {
//     MyClassPro.hiddenDialog(0, context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Check(
//           data: jsonEncode(value[0].result),
//           param: widget.param,
//           paramPro: paramPro,
//         ),
//       ),
//     );
//   }

//   late Map<String, dynamic> gAccount;
//   late List cardList;

//   _getAccountAll() async {
//     cardList = [];
//     List gAccounts = [];
//     List gAccountSaveing = [];
//     const accounts = 'accountAll';
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // gAccountAll = await jsonDecode(prefs.getString(accounts));
//     gAccountAll = await jsonDecode(prefs.getString(accounts).toString());
//     setState(() {
//       gAccountAll.forEach((account) {
//         if (account['mobile_flag'] == 'Y') {
//           if (account['coop_account_type'] == 'SAVING') {
//             setState(() {
//               if (account['withdraw_flag'] == 'Y') {
//                 cardList.add(AccountItem(
//                   title: account['coop_account_name'],
//                   accountId: account['coop_account_no'],
//                   remainingAmount:
//                       MyClass.checkDouble(account['account_balance']),
//                   withdrawalAmount:
//                       MyClass.checkDouble(account['avaliable_balance']),
//                   fontsizeapps: widget.param.fontsizeapps,
//                   lgs: widget.param.lgs,
//                   outstanding_balance:
//                       MyClass.checkDouble(account['outstanding_balance']),
//                   withdrawFlag: account['withdraw_flag'],
//                   type: account['coop_account_type'],
//                 ));
//                 gAccountSaveing.add(account);
//               }
//             });
//             if (account['deposit_flag'] == 'Y') {
//               // gAccountSaveing.add(account);
//             }
//           } else {
//             gAccounts.add(account);
//           }
//         }
//       });
//       gAccountAll = gAccounts;
//       gAccountpay = gAccountSaveing;
//     });
//   }

//   @override
//   void initState() {
//     setState(() {
//       _tabIndex = 0;
//     });
//     super.initState();
//     _getAccountAll();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool tabletMode = MediaQuery.of(context).size.width > 600;
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               decoration: MyClass.backGround(),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: tabletMode
//                         ? displayHeight(context) * 0.1
//                         : displayHeight(context) * 0.1,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: paddinglist(context, 10),
//                         right: paddinglist(context, 10)),
//                     child: CustomClass.cardhead(widget.param.fontsizeapps,
//                         widget.param.lgs, 'account', context),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: displayHeight(context) * 0.0),
//                     child: Column(
//                       children: <Widget>[
//                         CarouselSlider(
//                           options: CarouselOptions(
//                             enableInfiniteScroll: false,
//                             disableCenter: true,
//                             height: displayHeight(context) * 0.20,
//                             aspectRatio: 12.0,
//                             viewportFraction: 0.9,
//                             enlargeCenterPage: true,
//                             onPageChanged: (index, reason) {
//                               setState(() {
//                                 _currentIndex = index;
//                               });
//                             },
//                           ),
//                           items: cardList.map((card) {
//                             return Builder(builder: (BuildContext context) {
//                               return Container(
//                                 // height: MediaQuery.of(context).size.height * 0.30,
//                                 width: displayWidth(context) * 0.65,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         MyClassPro.cardBorderRadius()),
//                                   ),
//                                   color: MyColorPro.color('card'),
//                                   child: card,
//                                 ),
//                               );
//                             });
//                           }).toList(),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: MyClassPro.cardMap<Widget>(cardList,
//                               (index, url) {
//                             return Container(
//                               width: 10.0,
//                               height: 10.0,
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 2.0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _currentIndex == index
//                                     ? Colors.orange
//                                     : Colors.blueGrey,
//                               ),
//                             );
//                           }),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               left: paddinglist(context, 10),
//                               right: paddinglist(context, 10)),
//                           child: CustomClass.cardhead(widget.param.fontsizeapps,
//                               widget.param.lgs, 'list', context),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             CustomUIPro.appbarDetailUiPro(
//                 'assets/imgPro/buyshare.png',
//                 'bychare',
//                 widget.param.fontsizeapps,
//                 widget.param.lgs,
//                 context),
//             // Container(
//             //   padding: EdgeInsets.only(
//             //       top: displayHeight(context) * 0.37,
//             //       left: paddinglist(context, 0) + 10,
//             //       right: paddinglist(context, 0)),
//             //   child: Row(
//             //     children: [
//             //       Expanded(
//             //         child: Divider(
//             //           endIndent: 5,
//             //           height: 20,
//             //           thickness: 2,
//             //           color: MyColorPro.color('card'),
//             //         ),
//             //         flex: 1,
//             //       ),
//             //       Text(
//             //         LanguagePro.payPro('list', lgs),
//             //         textScaleFactor: MyClassPro.FontSizeApp(fontsizeapps),
//             //         style: CustomTextStylePro.headTxt(context, 0),
//             //       ),
//             //       Expanded(
//             //         child: Divider(
//             //           indent: 5,
//             //           height: 20,
//             //           thickness: 2,
//             //           color: MyColorPro.color('card'),
//             //         ),
//             //         flex: 5,
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             Container(
//                 padding: EdgeInsets.only(
//                     top: displayHeight(context) * (tabletMode ? 0.45 : 0.43)),
//                 child: SingleChildScrollView(child: buyshare())),
//             CustomUI.appbarUi(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buyshare() {
//     return Container(
//       color: MyColorPro.color('detailadmin'),
//       padding: EdgeInsets.all(0),
//       child: Form(
//         key: _formKeybuyshare,
//         child: Column(
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: displayHeight(context) * 0.05,
//                 aspectRatio: 12.0,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     print(index);
//                     _currentIndexBuyshare = index;
//                   });
//                 },
//               ),
//               items: cardListPayLoan.map((card) {
//                 return Builder(builder: (BuildContext context) {
//                   return Container(
//                     // height: MediaQuery.of(context).size.height * 0.30,
//                     width: displayWidth(context) * 0.65,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             MyClassPro.cardBorderRadius()),
//                       ),
//                       child: card,
//                     ),
//                   );
//                 });
//               }).toList(),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: displayWidth(context) * 0.05,
//                   right: displayWidth(context) * 0.05),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       LanguagePro.payPro('amount', lgs),
//                       textScaleFactor: MyClassPro.FontSizeApp(fontsizeapps),
//                       style: CustomTextStylePro.headTxt(context, 0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: displayWidth(context) * 0.05,
//                   right: displayWidth(context) * 0.05),
//               child: TextFormField(
//                 inputFormatters: [
//                   CurrencyInputFormatter(
//                       thousandSeparator: ThousandSeparator.Comma)
//                 ],
//                 keyboardType: const TextInputType.numberWithOptions(
//                     decimal: true, signed: false),
//                 textAlign: TextAlign.center,
//                 style: CustomTextStylePro.detailTxt(context, 0),
//                 decoration: InputDecoration(
//                   labelText: LanguagePro.payPro('amountDetail', lgs),
//                   labelStyle: TextStyle(
//                     color: MyColorPro.color('detail'),
//                   ),
//                   border: OutlineInputBorder(),
//                   errorStyle: CustomTextStylePro.showErrorTextField(context),
//                 ),
//                 // obscureText: true,
//                 validator: (value) {
//                   _validatchare(value);
//                 },
//                 onSaved: (value) {
//                   amountShare = MyClassPro.formatNumberRcomma(value).toString();
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: displayWidth(context) * 0.05,
//                   right: displayWidth(context) * 0.05),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       LanguagePro.other('note', lgs),
//                       textScaleFactor: MyClassPro.FontSizeApp(fontsizeapps),
//                       style: CustomTextStylePro.headTxt(context, 0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: displayWidth(context) * 0.05,
//                   right: displayWidth(context) * 0.05),
//               child: TextFormField(
//                 maxLength: 30,
//                 textAlign: TextAlign.center,
//                 style: CustomTextStylePro.detailTxt(context, 0),
//                 decoration: InputDecoration(
//                   labelText: LanguagePro.other('note', lgs),
//                   labelStyle: TextStyle(
//                     color: MyColorPro.color('detail'),
//                   ),
//                   focusedBorder: OutlineInputBorder(),
//                   border: OutlineInputBorder(),
//                   errorStyle: CustomTextStylePro.showErrorTextField(context),
//                 ),
//                 onSaved: (value) {
//                   noteshare = value;
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: displayWidth(context) * 0.05,
//                   right: displayWidth(context) * 0.05),
//               child: Container(
//                 // width: displayWidth(context) * 0.4,
//                 height: displayHeight(context) * 0.06,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30.0),
//                   gradient: LinearGradient(
//                     colors: <Color>[
//                       MyColorPro.color('gr'),
//                       MyColorPro.color('gr1'),
//                     ],
//                   ),
//                 ),
//                 padding: const EdgeInsets.only(right: 5),
//                 child: InkWell(
//                   onTap: () {
//                     if (_formKeybuyshare.currentState!.validate()) {
//                       _formKeybuyshare.currentState!.save();
//                       if (double.parse(gAccountpay[_currentIndex]
//                                   ['avaliable_balance']
//                               .toString()) <
//                           double.parse(amountShare.toString())) {
//                         MyClassPro.showAlertPro(
//                             LanguagePro.other(
//                                 'checkamountover', widget.param.lgs),
//                             context);
//                       } else {
//                         showDialog(
//                           barrierDismissible: false,
//                           context: context,
//                           builder: (BuildContext context) {
//                             return MyClass.loading();
//                           },
//                         );
//                         _getBuyShareCheck(
//                             MyClass.json(
//                                 gAccountpay[_currentIndex])['coop_account_no'],
//                             amountShare,
//                             'buyshare');
//                       }
//                     }
//                   },
//                   child: Center(
//                     child: Text(
//                       LanguagePro.payPro('next', lgs),
//                       textScaleFactor: MyClassPro.FontSizeApp(fontsizeapps),
//                       style: CustomTextStylePro.buttonTxt(context, 0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// _validatchare(value) {
//   if (value.isEmpty) {
//     return LanguagePro.adminPro('checkadddetail', lgs, '');
//   } else if (MyClassPro.isNumericUsingtryParse(value) == false) {
//     return LanguagePro.other('tryParse', lgs);
//   }
// }
