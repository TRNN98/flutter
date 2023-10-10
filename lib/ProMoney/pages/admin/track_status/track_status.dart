import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/promoney/class/custom_ui_pro.dart';
import 'package:mwasc/promoney/class/languagepro.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:mwasc/promoney/class/textstylepro.dart';
import 'package:mwasc/promoney/models/admin/bookInOut/admin_io_model.dart';
import 'package:mwasc/promoney/pages/admin/track_status/book_detail.dart';
import 'package:mwasc/promoney/sevices/network_pro.dart';
import 'package:flutter/material.dart';

class TrackStatus extends StatefulWidget {
  final Param param;
  final String imei;

  const TrackStatus({super.key, required this.imei, required this.param});

  @override
  TrackStatusState createState() => TrackStatusState();
}

class TrackStatusState extends State<TrackStatus> {
  var _tabIndex = 0;

  @override
  void initState() {
    setState(() {
      _tabIndex = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.2
                      : displayHeight(context) * 0.2,
                  width: displayWidth(context) * 1,
                ),

                // trackCooperativeBookInStatus(),
                // trackCooperativeBookOutStatus(),
              ],
            ),
          ),
          CustomUIPro.appbarDetailUiPro(
              'assets/imgPro/trackStatus.png',
              'trackStatus',
              widget.param.fontsizeapps,
              widget.param.lgs,
              context),
          Container(
            padding: EdgeInsets.only(
                top: displayHeight(context) * (tabletMode ? 0.13 : 0.17)),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(displayWidth(context) * 0.015),
                    child: TabBar(
                      // unselectedLabelColor: Colors.redAccent,
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
                              LanguagePro.adminPro(
                                  'entranceฺฺBook', widget.param.lgs, ''),
                              textScaleFactor: MyClassPro.fontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStylePro.buttonBarTxt(
                                  context, -1, _tabIndex == 0 ? 's' : 'n'),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              LanguagePro.adminPro(
                                  'bookOut', widget.param.lgs, ''),
                              textScaleFactor: MyClassPro.fontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStylePro.buttonBarTxt(
                                  context, -1, _tabIndex == 1 ? 's' : 'n'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom: displayHeight(context) * 1),
                            child: trackCooperativeBookInStatus(),
                          ),
                        ),
                        Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom: displayHeight(context) * 1),
                            child: trackCooperativeBookOutStatus(),
                          ),
                        ),
                        // Center(
                        //   child: SingleChildScrollView(
                        //       padding: EdgeInsets.only(
                        //           bottom: displayHeight(context) * 0.1),
                        //       child: _tranaccountbank()),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // CustomUI.appbarUi(),
        ],
      ),
    );
  }

  Widget trackCooperativeBookOutStatus() {
    // return Padding(
    //   padding: EdgeInsets.all(10),
    //   child: Column(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.all(8),
    //         color: MyColorPro.color('headdetail'),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               LanguagePro.adminPro('bookOut', widget.param.lgs, ''),
    //               textScaleFactor: MyClassPro.fontSizeApp(widget.param.fontsizeapps),
    //               style: CustomTextStylePro.cardWTxt(context, 0),
    //             ),
    //             IconButton(
    //               icon: Icon(
    //                 // expand_less_sharp
    //                 _istrackCooperativeBookOutStatus2Status == true
    //                     ? Icons.expand_less_sharp
    //                     : Icons.expand_more,
    //                 color: Colors.white,
    //                 size: 36.0,
    //               ),
    //               onPressed: () {
    //                 setState(() {
    //                   _istrackCooperativeBookOutStatus2Status == true
    //                       ? _istrackCooperativeBookOutStatus2Status = false
    //                       : _istrackCooperativeBookOutStatus2Status = true;
    //                 });
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //       _istrackCooperativeBookOutStatus2Status == true
    //           ?
    return Container(
      padding: const EdgeInsets.all(8),
      color: MyColorPro.color('detailadmin'),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('documentNumber', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('date', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('subject', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  LanguagePro.adminPro('detail', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColorPro.color('card'),
                ),
              ),
            ],
          ),
          FutureBuilder<List<AdminIoModel>>(
            future: NetworkPro.fetchAdminIO(
                '{"mode":"4","data1":"","data2":"","data3":""}',
                widget.param.token,
                context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? _rowtrackCooperativeBookOutStatusDetail(
                        data: snapshot.data)
                    : MyWidget.nodata(widget.param.lgs, context);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return MyClass.loading();
            },
          ),
        ],
      ),
    );
  }

  Widget _rowtrackCooperativeBookOutStatusDetail({data}) => ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
      physics: const NeverScrollableScrollPhysics(),
      // physics: AlwaysScrollableScrollPhysics(),
      // new
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                data[index].requestmentNo,
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                // data[index].operateDate,
                MyClassPro.formatDatePro1(data[index].operateDate),
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                data[index].docDesc,
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetail(
                          param: widget.param,
                          requestmentNo: data[index].requestmentNo,
                          type: 'out'),
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.lightBlue,
                  size: 30.0,
                ),
              ),
            ),
          ],
        );
      });

  Widget trackCooperativeBookInStatus() {
    // return Padding(
    //   padding: EdgeInsets.all(10),
    //   child: Column(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.all(8),
    //         color: MyColorPro.color('headdetail'),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               LanguagePro.adminPro('entranceฺฺBook', widget.param.lgs, ''),
    //               textScaleFactor: MyClassPro.fontSizeApp(widget.param.fontsizeapps),
    //               style: CustomTextStylePro.cardWTxt(context, 0),
    //             ),
    //             IconButton(
    //               icon: Icon(
    //                 // expand_less_sharp
    //                 _istrackCooperativeBookInStatus2Status == true
    //                     ? Icons.expand_less_sharp
    //                     : Icons.expand_more,
    //                 color: Colors.white,
    //                 size: 36.0,
    //               ),
    //               onPressed: () {
    //                 setState(() {
    //                   _istrackCooperativeBookInStatus2Status == true
    //                       ? _istrackCooperativeBookInStatus2Status = false
    //                       : _istrackCooperativeBookInStatus2Status = true;
    //                 });
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //       _istrackCooperativeBookInStatus2Status == true
    //           ?
    return Container(
      padding: const EdgeInsets.all(8),
      color: MyColorPro.color('detailadmin'),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('documentNumber', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('date', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  LanguagePro.adminPro('subject', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  LanguagePro.adminPro('detail', widget.param.lgs, ''),
                  textAlign: TextAlign.center,
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.headTxt(context, -5),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColorPro.color('card'),
                ),
              ),
            ],
          ),
          FutureBuilder<List<AdminIoModel>>(
            future: NetworkPro.fetchAdminIO(
                '{"mode":"2","data1":"","data2":"","data3":""}',
                widget.param.token,
                context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? _rowtrackCooperativeBookInStatusDetail(
                        data: snapshot.data)
                    : MyWidget.nodata(widget.param.lgs, context);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return MyClass.loading();
            },
          ),
        ],
      ),
    );
    //           : Container(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _rowtrackCooperativeBookInStatusDetail({data}) => ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
      physics: const NeverScrollableScrollPhysics(),
      // physics: AlwaysScrollableScrollPhysics(),
      // new
      // scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                data[index].requestmentNo,
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                // data[index].operateDate,
                MyClassPro.formatDatePro1(data[index].operateDate),
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                data[index].docDesc,
                textAlign: TextAlign.center,
                textScaleFactor:
                    MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                style: CustomTextStylePro.adminDetailTxt(context, 0),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetail(
                          param: widget.param,
                          requestmentNo: data[index].requestmentNo,
                          type: 'in'),
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.lightBlue,
                  size: 30.0,
                ),
              ),
            ),
          ],
        );
      });
}
