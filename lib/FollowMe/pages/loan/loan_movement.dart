import 'package:mwasc/FollowMe/models/loan/loan_modle_d.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;
bool tabletMode = false;

class LoanMovement extends StatefulWidget {
  final Param param;
  final String loanContractNo;
  final String principalBalance;

  const LoanMovement(
      {super.key,
      required this.loanContractNo,
      required this.principalBalance,
      required this.param});

  @override
  LoanMovementState createState() => LoanMovementState();
}

class LoanMovementState extends State<LoanMovement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    tabletMode = MediaQuery.of(context).size.width > 600;
    var objLoan = '{"mode": "2","contract_no":"${widget.loanContractNo}"}';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.loanLg('loanMovementlist', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: [
          Container(
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
                      child: FutureBuilder<List<LoanModleD>>(
                        future: Network.fetchLoanMovement(
                            objLoan, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(
                                    loanMovement: snapshot.data,
                                  )
                                : MyWidget.nodata(widget.param.lgs, context);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return MyClass.loading();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.01,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.01,
                  ),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
        ],
      ),
    );
  }

  Widget _buildExpandableTile(loanMovement) {
    return ExpansionTile(
        title: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 0, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MyClass.checkNull(loanMovement.loanPaymentDate),
                        // MyClass.convertDate(MyClass.checkNull(
                        //     loanMovement[index].loanPaymentDate)),
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 0),
                      ),
                      Text(
                        MyClass.checkNull(loanMovement.itemTypeDescription),
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataTxt(context, 0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        MyClass.checkNull(loanMovement.period.toString()),
                        // MyClass.formatNumber(loanMovement[index].period),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldBTxt(context, -2),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    MyClass.formatNumber(loanMovement.principalbalance),
                    textAlign: TextAlign.end,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0, 'R'),
                  ),
                ),
              ],
            ),
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        Language.loanLg('principal', 'th'),
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            MyClass.formatNumber(loanMovement.paymentAmount),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Text(
                      Language.loanLg('interest', 'th'),
                      textAlign: TextAlign.left,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  MyClass.formatNumber(
                                      loanMovement.interestAmount),
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'Bl'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ]);
  }

  Widget _detail({loanMovement}) => Container(
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
              height: 0,
            ),
            itemCount: loanMovement.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(loanMovement[index]);
            },
          ),
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
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: MyColor.color('datatitle')),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(Language.loanLg('member', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.membershipNo,
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(Language.loanLg('name', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.param.name,
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg(
                                'loanContractNumber', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(widget.loanContractNo,
                            textAlign: TextAlign.end,
                            // MyClass.formatcontactloan(widget.loanContractNo),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Text(
                            Language.loanLg('balance', widget.param.lgs),
                            textAlign: TextAlign.start,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 1))),
                    Expanded(
                        flex: 1,
                        child: Text(
                            MyClass.formatNumber(widget.principalBalance),
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataW300Txt(context, 1))),
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
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.clamp,
          colors: <Color>[
            MyColor.color('detailhead1'),
            MyColor.color('detailhead2')
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset.fromDirection(0, 2.0),
              blurRadius: 6.0,
              spreadRadius: 1.0)
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    padding: const EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(Language.loanLg('date', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
        ),
        Expanded(
          flex: 3,
          child: Text(Language.loanLg('period1', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
        ),
        Expanded(
          flex: 3,
          child: Text(Language.loanLg('balance', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.dataHeadTitleCTxt(context, -1, 'TxtBlue')),
        ),
        const Expanded(
          flex: 1,
          child: Text(''),
        ),
      ],
    ),
  );
}
