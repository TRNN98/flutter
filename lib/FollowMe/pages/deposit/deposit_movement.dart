import 'package:udtscc/FollowMe/models/deposit/dep_detail_model.dart';
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

class DepositMovement extends StatefulWidget {
  final Param param;
  final String depositBalance;
  final String depositAccountNo;

  const DepositMovement(
      {super.key,
      required this.depositBalance,
      required this.depositAccountNo,
      required this.param});

  @override
  DepositMovementState createState() => DepositMovementState();
}

class DepositMovementState extends State<DepositMovement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    var objDepMovement =
        '{"mode": "2","deposit_account_no":"${widget.depositAccountNo}"}';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.deposit('accountMovements', widget.param.lgs),
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
                  _subdataHeadcolor(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: _head(context, widget.param.lgs),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: FutureBuilder<List<DepiDetailModel>>(
                        future: Network.fetchDepMovement(
                            objDepMovement, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(dep: snapshot.data)
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
        ],
      ),
    );
  }

  Widget _buildExpandableTile(dep) {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MyClass.checkNull(dep.operatedate),
                        // MyClass.convertDate(
                        //     MyClass.checkNull(dep[index].operatedate)),
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                      ),
                      Text(
                        MyClass.checkNull(dep.deposititemdescription),
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataTxt(context, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    dep.depositbalance,
                    textAlign: TextAlign.right,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(
                        context, 0, dep.signFlag < 0 ? 'R' : 'G'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  Language.deposit('balance', 'th'),
                  textAlign: TextAlign.left,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                child: Text(
                  dep.totalbalance,
                  textAlign: TextAlign.right,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'G'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _detail({dep}) => Container(
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
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
              height: 0,
            ),
            itemCount: dep.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(dep[index]);
            },
          ),
        ),
      );

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              Language.deposit('date', lgs),
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
            flex: 2,
            child: Text(
              Language.deposit('amount', lgs),
              textAlign: TextAlign.center,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.headTitleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

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
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            Language.deposit('balanceH', widget.param.lgs) +
                                ' : ',
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    Expanded(
                        child: Text(MyClass.formatNumber(widget.depositBalance),
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
