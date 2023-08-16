import 'package:udtscc/FollowMe/models/cremation/cremation_model.dart';
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

class Cremation extends StatefulWidget {
  final Param param;

  const Cremation(this.param, {super.key});

  @override
  CremationState createState() => CremationState();

  static fromJson(i) {}
}

class CremationState extends State<Cremation> {
  var objDep = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.cremationLg('cremation', widget.param.lgs),
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
                  CustomUI.appbarDetailUi('assets/imgs/cremation.png', context),
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
                      child: FutureBuilder<List<CremationModel>>(
                        future: Network.fetchCremation(
                            objDep, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _detail(cre: snapshot.data)
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

  _buildExpandableTile(cre) {
    return ExpansionTile(
      title: Row(
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
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    MyClass.checkNull(cre.ssId.toString()),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0,
                        cre.statusId.toString() == '2' ? 'R' : 'BlH'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    MyClass.checkNull(cre.name.toString()),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0,
                        cre.statusId.toString() == '2' ? 'R' : 'BlH'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    MyClass.checkNull(cre.relatedDescription.toString()),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 0,
                        cre.statusId.toString() == '2' ? 'R' : 'BlH'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  Language.cremationLg('status', 'th'),
                  textAlign: TextAlign.left,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
              Expanded(
                child: Text(
                  cre.statusDescription,
                  textAlign: TextAlign.right,
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.dataHTxt(context, 0, 'BlH'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _detail({cre}) => Container(
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
            itemCount: cre.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableTile(cre[index]);
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
            Language.cremationLg('ss_id', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            Language.cremationLg('name', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.cremationLg('relation', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -2),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(''),
        ),
      ],
    ),
  );
}
