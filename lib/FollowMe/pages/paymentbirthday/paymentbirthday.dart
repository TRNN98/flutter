import 'package:udtscc/FollowMe/models/paymentbirthday/paymentbirthday_model.dart';
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

class PaymentBirthday extends StatefulWidget {
  final Param param;

  const PaymentBirthday(this.param, {super.key});

  @override
  PaymentBirthdayState createState() => PaymentBirthdayState();

  static fromJson(i) {}
}

class PaymentBirthdayState extends State<PaymentBirthday> {
  var objDep = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.paymentBirthdayLg('paymentBirthday', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  lineSizedBox(context, -15),
                  CustomUI.appbarDetailUi(
                      'assets/imgs/paymentbirthday.png', context),
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
                      child: FutureBuilder<List<PaymentBirthdayModel>>(
                        future: Network.fetchPaymentBirthday(
                            objDep, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(pay: snapshot.data)
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

  Widget _detail({pay}) => Container(
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
            padding: const EdgeInsets.only(top: 10),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: pay.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              MyClass.checkNull(pay[index].paidYear.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style:
                                  CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              MyClass.checkNull(pay[index].paidDate.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style:
                                  CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              MyClass.checkNull(
                                  pay[index].paidAmount.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              MyClass.checkNull(pay[index].paidId.toString()),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style:
                                  CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                            ),
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
}

Container _head(context, lgs) {
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
            Language.paymentBirthdayLg('paidYear', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -1),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.paymentBirthdayLg('paidDate', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -1),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.paymentBirthdayLg('paidAmount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -1),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.paymentBirthdayLg('paidId', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -1),
          ),
        ),
      ],
    ),
  );
}
