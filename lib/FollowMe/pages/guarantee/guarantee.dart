import 'package:udtscc/FollowMe/models/guarantee/guarantee_model.dart';
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

class Guarantee extends StatefulWidget {
  final Param param;

  const Guarantee(this.param, {super.key});

  @override
  GuaranteeState createState() => GuaranteeState();
}

bool tabletMode = false;

int checkpage = 0;

class GuaranteeState extends State<Guarantee> {
  var objGuarantee = '{"mode": "1"}';
  var objGuarantee1 = '{"mode": "2"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.guaranteeLg('guaranteeLoanAgreement', widget.param.lgs),
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
                  CustomUI.appbarDetailUi('assets/imgs/guarantee.png', context),
                  lineSizedBox(context, -15),
                  Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _subdatahead()),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddinglist(context, 0),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: checkpage == 0
                        ? _head(context, widget.param.lgs, tabletMode)
                        : _head1(context, widget.param.lgs, tabletMode),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<GuaranteeModel>>(
                        future: Network.fetchGuarantee(
                            objGuarantee, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(
                                    guarantee: snapshot.data,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail({guarantee}) => Container(
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
            itemCount: guarantee.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
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
                                guarantee[index].loanContractNo,
                                textAlign: TextAlign.left,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataBoldTxt(context, -1),
                              ),
                              Text(
                                MyClass.checkNull(guarantee[index].loanName),
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
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                MyClass.formatNumber(
                                    guarantee[index].principalBalance),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHTxt(
                                    context, tabletMode ? -1 : 0, 'R'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );

  Center _subdatahead() {
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
                        child: Text(
                            Language.loanLg('member', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.membershipNo,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.loanLg('name', widget.param.lgs) + ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(widget.param.name,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadDataTxt(context, 0))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _head(context, lgs, tabletMode) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              Language.guaranteeLg('detail', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style:
                  CustomTextStyle.headTitleTxt(context, tabletMode ? -3 : -2),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.guaranteeLg('debt', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style:
                  CustomTextStyle.headTitleTxt(context, tabletMode ? -3 : -2),
            ),
          ),
        ],
      ),
    );
  }

  Container _head1(context, lgs, tabletMode) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: MyColor.color('detailhead'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              Language.guaranteeLg('detail', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style:
                  CustomTextStyle.headTitleTxt(context, tabletMode ? -3 : -2),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 1,
            child: Text(
              Language.guaranteeLg('LoanApprove', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style:
                  CustomTextStyle.headTitleTxt(context, tabletMode ? -3 : -2),
            ),
          ),
        ],
      ),
    );
  }
}
