import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/custom_ui_pro.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/promoney/models/admin/bookInOut/admin_io_model.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final Param param;
  final String requestmentNo;
  final String type;

  const BookDetail(
      {super.key,
      required this.param,
      required this.requestmentNo,
      required this.type});

  @override
  BookDetailState createState() => BookDetailState();
}

class BookDetailState extends State<BookDetail> {
  late String obj;
  late String objin;
  late String objout;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    objin = "3";
    objout = "5";
    widget.type == 'in' ? obj = objin : obj = objout;
    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: MyClass.backGround(),
            child: Column(
              children: [
                tabletMode
                    ? SizedBox(
                        height: displayHeight(context) * 0.20,
                      )
                    : SizedBox(
                        height: displayHeight(context) * 0.20,
                      ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                  child: _head(
                      context, widget.param.fontsizeapps, widget.param.lgs),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                    child: FutureBuilder<List<AdminIoDetailModel>>(
                      future: NetworkPro.fetchAdminIODetail(
                          '{"mode":  "$obj","data1":"${widget.requestmentNo}","data2":"","data3":""}',
                          widget.param.token,
                          context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _detail(detail: snapshot.data)
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
          // CustomUI.appbarUi(),
          CustomUIPro.appbarDetailUiPro(
              'assets/imgPro/trackStatus.png',
              'trackStatus',
              widget.param.fontsizeapps,
              widget.param.lgs,
              context),
        ],
      ),
    );
  }

  Widget _detail({detail}) => ListView.separated(
        padding: const EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: detail.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              color: MyColorPro.color('detailadmin'),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            detail[index].detail,
                            // 'สัญญาเงินกู้ : ' + detail[index].loanContractNo,
                            textAlign: TextAlign.center,
                            textScaleFactor: MyClassPro.fontSizeApp(
                                widget.param.fontsizeapps),
                            style:
                                CustomTextStylePro.adminDetailTxt(context, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          detail[index].docStatusDesc,
                          textAlign: TextAlign.center,
                          textScaleFactor:
                              MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                          style: CustomTextStylePro.adminDetailTxt(context, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

Container _head(context, fontsizeapps, lgs) {
  return Container(
    padding: const EdgeInsets.all(12),
    // color: MyColorPro.color('headtxt'),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            LanguagePro.adminPro('detail', lgs, ''),
            textAlign: TextAlign.center,
            textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
            style: CustomTextStylePro.headTitleTxt(context, -2),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            LanguagePro.adminPro('status', lgs, ''),
            textAlign: TextAlign.center,
            textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
            style: CustomTextStylePro.headTitleTxt(context, -2),
          ),
        ),
      ],
    ),
  );
}
