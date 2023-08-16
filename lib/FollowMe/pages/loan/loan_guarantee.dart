import 'package:udtscc/FollowMe/models/loan/loan_model_g.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class LoanGuarantee extends StatefulWidget {
  final Param param;
  final String loanContractNo;
  final String principalBalance;

  const LoanGuarantee(
      {super.key,
      required this.loanContractNo,
      required this.principalBalance,
      required this.param});

  @override
  LoanGuaranteeState createState() => LoanGuaranteeState();
}

class LoanGuaranteeState extends State<LoanGuarantee> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    var objLoan = '{"mode": "3","contract_no":"${widget.loanContractNo}"}';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.loanLg('collateralForLoanAgreement', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  _subdataHeadcolor(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<LoanModelG>>(
                        future: Network.fetchLoanGuarantee(
                            objLoan, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(
                                    loanGuarantee: snapshot.data,
                                    tabletMode: tabletMode)
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

  Widget _detail({loanGuarantee, tabletMode}) => Container(
        decoration: BoxDecoration(
          color: MyColor.color('datatitle'),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset.fromDirection(0, 2.0),
                blurRadius: 6.0,
                spreadRadius: 1.0)
          ],
        ),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 0),
          separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
          itemCount: loanGuarantee.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
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
                            MyClass.checkNull(loanGuarantee[index].name),
                            textAlign: TextAlign.left,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldBTxt(context, -2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            loanGuarantee[index].collateralDescription,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

  Container _subdataHeadcolor() {
    return Container(
      padding: EdgeInsets.all(paddinglist(context, 0)),
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
                        flex: 1,
                        child: Text(
                            Language.loanLg('member', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.membershipNo,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg('name', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.name,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg(
                                    'loanContractNumber', widget.param.lgs) +
                                ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.loanContractNo,
                            // MyClass.formatcontactloan(widget.loanContractNo),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg('balance', widget.param.lgs) +
                                ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(
                            MyClass.formatNumber(widget.principalBalance),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 1))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('detail', lgs),
            textAlign: TextAlign.start,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('collateralDescription', lgs),
            textAlign: TextAlign.end,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
