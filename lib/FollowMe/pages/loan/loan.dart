import 'dart:convert';
import 'package:udtscc/FollowMe/models/loan/loan_model.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/loan/loan_detail.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Loan extends StatefulWidget {
  final Param param;

  const Loan(this.param, {super.key});

  @override
  LoanState createState() => LoanState();
}

class LoanState extends State<Loan> {
  var objLoan = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.loanLg('loan', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: <Widget>[
          CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  CustomUI.appbarDetailUi('assets/imgs/loan.png', context),
                  lineSizedBox(context, -15),
                  Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _subdatahead(widget.param.membershipNo,
                          widget.param.name, context, widget.param.lgs)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddinglist(context, 0),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<LoanModel>>(
                        future: Network.fetchLoan(
                            objLoan, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(loan: snapshot.data)
                                : MyWidget.nodata(widget.param.lgs, context);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail({loan}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset.fromDirection(0, 2.0),
                blurRadius: 6.0,
                spreadRadius: 1.0)
          ],
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: loan.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanDetail(
                          data: '[${jsonEncode(loan[index])}]',
                          param: widget.param),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              loan[index].loanContractNo,
                              // MyClass.formatcontactloan(
                              //     loan[index].loanContractNo),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 1, 'B'),
                            ),
                            Text(
                              MyClass.checkNull(
                                Language.loanLg(
                                        'contractStartDate', widget.param.lgs) +
                                    " " +
                                    loan[index].beginingOfContract,
                                // MyClass.convertDate(
                                //     loan[index].beginingOfContract)
                              ),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
                            ),
                            Text(
                              MyClass.checkNull(Language.loanLg(
                                      'paymentInInstallments',
                                      widget.param.lgs) +
                                  " " +
                                  MyClass.formatNumber(
                                      loan[index].periodPaymentAmount) +
                                  " บาท"),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
                            ),
                            Text(
                              MyClass.checkNull(Language.loanLg(
                                          'period', widget.param.lgs) +
                                      " " +
                                      loan[index].lastPeriod.toString()) +
                                  '/' +
                                  MyClass.checkNull(loan[index]
                                      .loanInstallmentAmount
                                      .toString()),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
                            ),
                            Text(
                              MyClass.checkNull(
                                  loan[index].loanPaymentTypeCode.toString()),
                              textAlign: TextAlign.left,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataTxt(context, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Text(
                              MyClass.formatNumber(
                                  loan[index].principalBalance.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 0, 'R'),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: iconnext(context, 0),
                            color: MyColor.color('buttonnext'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}

Center _subdatahead(member, name, context, lgs) {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset.fromDirection(0, 2.0),
                  blurRadius: 6.0,
                  spreadRadius: 1.0)
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: MyColor.color('datatitle'),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(Language.loanLg('member', lgs) + ' : ',
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 0))),
                  Expanded(
                      child: Text(member,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadDataTxt(context, 0))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(Language.loanLg('name', lgs) + ' : ',
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadTitleTxt(context, 0))),
                  Expanded(
                      child: Text(name,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataHeadDataTxt(context, 0))),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container _head(context, lgs) {
  return Container(
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
    padding: const EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(''),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('amountLoan', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
