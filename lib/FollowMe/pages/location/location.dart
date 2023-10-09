import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/models/location/address_json.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../class/mycolor.dart';

class Location extends StatefulWidget {
  final Param param;

  const Location(this.param, {super.key});
  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<Location> {
  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
              style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  'ยกเลิก',
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ตกลง',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                ),
                onPressed: () {
                  Platform.isIOS
                      ? FlutterExitApp.exitApp(iosForceExit: true)
                      : FlutterExitApp.exitApp();
                },
              ),
            ],
          );
        });
  }

  Future _callNumber(n) async {
    var number = n.toString();
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _getaddress({List<AddressModel>? address}) {
    return Column(
      children: [
        _address(address),
        _callnumber(address),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: MyClass.backGround(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.0275
                          : displayHeight(context) * 0.03,
                    ),
                    CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.0275
                          : displayHeight(context) * 0.0275,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Text(
                                MyClass.company('th'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, 7, "bl2", 2),
                              ),
                              Text(MyClass.company('th'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, 7, 'bl')),
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                MyClass.company('en'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, -2, "bl2", 2),
                              ),
                              Text(MyClass.company('en'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, -2, 'bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: tabletMode ? 70 : 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: MyColor.color('mainBG'),
                        ),
                        child: FutureBuilder<List<AddressModel>>(
                          future: Network.fetchAddress('{"mode": "1"}'),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _getaddress(address: snapshot.data);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return MyClass.loading();
                          },
                        ),
                        // child: Column(
                        //   children: [
                        //     address == null
                        //         ? const SizedBox(height: 1)
                        //         : _address(address),
                        //     address == null
                        //         ? const SizedBox(height: 1)
                        //         : _callnumber(),
                        //   ],
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _address(address) {
    return Center(
      child: Column(
        children: [
          Text(
            "ที่อยู่",
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 4, 'TxtBlue'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    address[0].address,
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        MyClass.blocFontSizeApp(widget.param.fontsizeapps),
                    style: CustomTextStyle.dataHTxt(context, 3, 'TxtBlue'),
                  ),
                ),
              ],
            ),
          ),
          hSizedBoxButton(context, -5),
        ],
      ),
    );
  }

  Widget _callnumber(List<AddressModel>? address) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ติดต่อเรา',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHeadTitleCTxt(context, 5, 'TxtBlue'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _phonenumber(address![0].numberPhone1, address[0].txtPhone1),
              _phonenumber(address[0].numberPhone2, address[0].txtPhone2),
              _phonenumber(address[0].numberPhone3, address[0].txtPhone3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _facebook(address[0].facebook),
              _maps(address[0].map),
              _line(address[0].line),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: _link(address[0].website),
          ),
        ],
      ),
    );
  }

  Widget _maps(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 50 : 0,
        right: tabletMode ? 50 : 0,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/map.png'),
            iconSize: tabletMode ? 110 : 80,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _email(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 50 : 0,
        right: tabletMode ? 50 : 0,
      ),
      child: Column(
        children: [
          Text(
            'Email',
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 3, 'TxtBlue'),
          ),
          Text(
            url,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 1, 'TxtBlue'),
          ),
        ],
      ),
    );
  }

  Widget _facebook(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 50 : 0,
        right: tabletMode ? 50 : 0,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/facebook.png'),
            iconSize: tabletMode ? 110 : 80,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _line(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode ? 50 : 0,
        right: tabletMode ? 50 : 0,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/line.png'),
            iconSize: tabletMode ? 110 : 80,
            onPressed: () {
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  Widget _link(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      height: displayHeight(context) * 0.045,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('TxtBl'),
            MyColor.color('TxtBl'),
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: Center(
          child: Text(
            "เว็บไซต์สหกรณ์ ฯ",
            style: CustomTextStyle.dataHeadTitleCTxt(context, 1, 'w'),
          ),
        ),
      ),
    );
  }

  Widget _phonenumber(n, t) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Column(
      children: [
        IconButton(
          icon: Image.asset('assets/imgs/call.png'),
          iconSize: tabletMode ? 70 : 40,
          onPressed: () {
            _callNumber(MyClass.formatNumberPhoneI(n));
          },
        ),
        Text(
          n,
          textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
          style: CustomTextStyle.dataHTxt(context, 0, 'TxtBlue'),
        ),
        Text(
          t,
          textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
          style: CustomTextStyle.dataHTxt(context, 0, 'TxtBlue'),
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String url;

  const DetailScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: NetworkImage(url),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
