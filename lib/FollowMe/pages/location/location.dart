import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/models/location/address_json.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                    lineSizedBox(context, 15),
                    CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.0275
                          : displayHeight(context) * 0.0275,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(MyClass.company('th'),
                              textAlign: TextAlign.center,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleCTxt(
                                  context, 3, 'Go')),
                          Text(MyClass.company('en'),
                              textAlign: TextAlign.center,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleCTxt(
                                  context, -2, 'Go')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: tabletMode ? 70 : 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 25),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
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

  Widget _callnumber(List<AddressModel>? address) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ติดต่อเรา',
              textScaleFactor:
                  MyClass.blocFontSizeApp(widget.param.fontsizeapps),
              style: CustomTextStyle.dataHTxt(context, 5, 'Go'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _phonenumber(address![0].numberPhone1, address[0].txtPhone1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _email(address[0].email),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _facebook(address[0].facebook),
            _maps(address[0].map),
            _line(address[0].line),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ],
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
            style: CustomTextStyle.dataHTxt(context, 3, 'Go'),
          ),
          Text(
            url,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 1, 'Go'),
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

  Widget _phonenumber(n, t) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
            style: CustomTextStyle.dataHTxt(context, 0, 'Go'),
          ),
          Text(
            t,
            textScaleFactor: MyClass.blocFontSizeApp(widget.param.fontsizeapps),
            style: CustomTextStyle.dataHTxt(context, 0, 'Bl'),
          ),
        ],
      ),
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
