import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/pages/creditinsure/creditinsure.dart';
import 'package:udtscc/FollowMe/pages/cremation/cremation.dart';
import 'package:udtscc/FollowMe/pages/deposit/deposit.dart';
import 'package:udtscc/FollowMe/pages/dividend/dividend.dart';
import 'package:udtscc/FollowMe/pages/gain/gain.dart';
import 'package:udtscc/FollowMe/pages/grouplife/grouplife.dart';
import 'package:udtscc/FollowMe/pages/guarantee/guarantee.dart';
import 'package:udtscc/FollowMe/pages/kept/kept.dart';
import 'package:udtscc/FollowMe/pages/loan/loan.dart';
import 'package:udtscc/FollowMe/pages/location/location.dart';
import 'package:udtscc/FollowMe/pages/mainmenu.dart';
import 'package:udtscc/FollowMe/pages/news/news.dart';
import 'package:udtscc/FollowMe/pages/offset/offset.dart';
import 'package:udtscc/FollowMe/pages/paymentbirthday/paymentbirthday.dart';
import 'package:udtscc/FollowMe/pages/profile/profile.dart';
import 'package:udtscc/FollowMe/pages/retire/retire.dart';
import 'package:udtscc/FollowMe/pages/share/share.dart';
import 'package:udtscc/FollowMe/pages/welfare/welfare.dart';
import 'package:udtscc/FollowMe/pages/welfarereceive/welfarereceive.dart';
import 'package:udtscc/FollowMe/pages/welmaster/welmaster.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:udtscc/promoney/locals/device.dart';
import 'package:udtscc/promoney/models/sql/device_db.dart';
import 'package:udtscc/promoney/pages/admin/calculate/calculate.dart';
import 'package:udtscc/promoney/pages/admin/dilute_shares/dilute_shares.dart';
import 'package:udtscc/promoney/pages/admin/track_status/track_status.dart';
import 'package:udtscc/promoney/pages/auth/otp.dart';
import 'package:udtscc/promoney/pages/banks/loan_payment/loan_payment.dart';
import 'package:udtscc/promoney/pages/promoney.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import '../promoney/pages/banks/tran_bank/tran_bank.dart';
import '../promoney/pages/banks/withdraw_bank/withdraw_bank.dart';
import '../promoney/pages/banks/withdraw_loan/withdraw_loan.dart';
import '../promoney/pages/coops/pay/pay.dart';
import '../promoney/pages/coops/tran/tran.dart';
import '../promoney/pages/history/history.dart';

int _selectedPage = 0;

class Tabs extends StatefulWidget {
  final Param param;

  const Tabs(this.param, {super.key});

  @override
  TabsState createState() => TabsState();
}

class Devices {
  Devices() {
    name = '';
    platform = '';
    version = '';
    model = '';
  }

  String? name;
  String? platform;
  String? version;
  String? model;
}

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  Devices getdevicealls = Devices();
  String udid = '';
  bool canAccessB = true;

  _device() async {
    Timer(const Duration(milliseconds: 1500), () {
      canAccessB = true;
    });
    if (canAccessB) {
      canAccessB = false;
      udid = await FlutterUdid.udid;
      await _getChackPD(udid);
    }
  }

  final iconListA = [
    'assets/imgs/menu1.png',
    'assets/imgs/news1.png',
    'assets/imgs/location1.png',
    'assets/imgs/profile1.png',
  ];
  final iconList = [
    'assets/imgs/menu2.png',
    'assets/imgs/news2.png',
    'assets/imgs/location2.png',
    'assets/imgs/profile2.png',
  ];
  final nameList = [
    Language.tabsLg('menu', 'th'),
    Language.tabsLg('news', 'th'),
    Language.tabsLg('address', 'th'),
    Language.tabsLg('profile', 'th'),
  ];
  var _bottomNavIndex = 0;

  DeviceDb dv = DeviceDb();
  late DBDevice dbDevice;
  String statusDevice = '0';
  String statusDevice1 = '0';

  _getDevice() {
    dbDevice.initDB().then((value) => {
          dbDevice.getDevice().then((value) => {
                if (value.isNotEmpty)
                  {
                    statusDevice = MyClass.json(value)[0]['status'],
                  }
              }),
        });
  }

  List checkMemList = [];
  List checkPDList = [];
  String gphoneNo = '';
  String gbankNo = '';
  String gtimeout = '';
  String gbankAccNo = '';

  Future _getChackMem() async {
    var obj = '{"mode": "2","imei":"","platform":" ","model":" ","phone":""}';
    await NetworkPro.fetchDeviceStatus(obj, widget.param.token, context)
        .then((value) => {
              checkMemList = value,
              gphoneNo = value[0]['phone'],
              gbankNo = value[0]['bank'],
              gtimeout = value[0]['timeout'],
              gbankAccNo = value[0]['bank_acc_no'] ?? "",
            });
    // throw Exception('ddde');
  }

  _getChackPD(model) {
    _getChackMem().then(_gettoken());
    // var obj = '{"mode": "3","imei":"$model","platform":" ","model":""}';
    // NetworkPro.fetchDeviceStatus(obj, widget.param.token, context).then(
    //   (value) => {
    //     statusDevice1 = value[0]['status'],
    //     if (checkMemList[0]['type'].toString() == '1')
    //       {
    //         if (statusDevice.toString() == '1' &&
    //             statusDevice1.toString() == '1')
    //           {_getChackMem().then(_gettoken())}
    //         else
    //           {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => Otp(
    //                     type: 'pro',
    //                     timeout: gtimeout,
    //                     phoneNo: gphoneNo,
    //                     bank: gbankNo,
    //                     param: widget.param),
    //               ),
    //             )
    //           }
    //       }
    //     else
    //       {MyClass.showToast(checkMemList[0]['msg'].toString())}
    //   },
    // );
  }

  _gettoken() async {
    try {
      await Network.fetchToken('{}', widget.param.token).then(
        (value) => {
          if (value[0].result.coopToken.accessToken.length != 0)
            {
              setState(
                () {
                  widget.param.cooptoken =
                      value[0].result.coopToken.accessToken;
                  _selectedPage = 4;
                  _bottomNavIndex = 4;
                },
              )
            }
          else
            {
              MyClass.showToast(checkMemList[0]['msg'].toString()),
            }
        },
      );
    } catch (e) {
      MyClass.showToast(checkMemList[0]['msg'].toString());
    }
  }

  @override
  void initState() {
    dbDevice = DBDevice();
    super.initState();

    _getDevice();
    _getChackMem();

    _selectedPage = 0;

    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor: HexColor('#ffffff'),
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    dbDevice.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    final page = [
      MainMenu(widget.param),
      News(widget.param),
      Location(widget.param),
      Profile(widget.param),
      Promoney(
        imei: getdevicealls.model.toString(),
        param: widget.param,
        bankNo: gbankNo,
        bankAccNo: gbankAccNo,
      ),
    ];
    final route = <String, WidgetBuilder>{
      '/loan': (BuildContext context) => Loan(widget.param),
      '/share': (BuildContext context) => Share(widget.param),
      '/deposit': (BuildContext context) => Deposit(widget.param),
      '/guarantee': (BuildContext context) => Guarantee(widget.param),
      '/kept': (BuildContext context) => Kept(widget.param),
      '/dividend': (BuildContext context) => Dividend(widget.param),
      '/gain': (BuildContext context) => Gain(widget.param),
      '/new': (BuildContext context) => News(widget.param),
      '/welfare': (BuildContext context) => Welfare(widget.param),
      '/cremation': (BuildContext context) => Cremation(widget.param),
      '/grouplife': (BuildContext context) => GroupLife(widget.param),
      '/creditinsure': (BuildContext context) => CreditInsure(widget.param),
      '/welmaster': (BuildContext context) => WelMaster(widget.param),
      '/paymentbirthday': (BuildContext context) =>
          PaymentBirthday(widget.param),
      '/retire': (BuildContext context) => Retire(widget.param),
      '/welfarereceive': (BuildContext context) => WelfareReceive(widget.param),
      '/offset': (BuildContext context) => Offsets(widget.param),
      '/tran': (BuildContext context) => TranAccount(
          param: widget.param, imei: getdevicealls.model.toString()),
      '/tranbank': (BuildContext context) => TranBank(
          param: widget.param,
          imei: getdevicealls.model.toString(),
          bankNo: gbankNo,
          bankAccNo: gbankAccNo),
      '/drawLoan': (BuildContext context) => DrawLoan(
          param: widget.param,
          imei: getdevicealls.model.toString(),
          bankNo: gbankNo,
          bankAccNo: gbankAccNo),
      '/withDrawBank': (BuildContext context) => WithDrawBank(
          param: widget.param,
          imei: getdevicealls.model.toString(),
          bankNo: gbankNo,
          bankAccNo: gbankAccNo),
      '/pay': (BuildContext context) =>
          Pay(param: widget.param, imei: getdevicealls.model.toString()),
      '/loanpayment': (BuildContext context) => LoanPayment(
          param: widget.param,
          imei: getdevicealls.model.toString(),
          bankNo: gbankNo,
          bankAccNo: gbankAccNo),
      // '/bychare': (BuildContext context) =>
      //     BuyChare(param: widget.param, imei: getdevicealls.model.toString()),
      '/history': (BuildContext context) => History(
            param: widget.param,
            imei: getdevicealls.model.toString(),
          ),
      // // '/admin': (BuildContext context) => Admin(
      // //       token: param.token,
      // //       name: param.name,
      // //       membership_no: param.membership_no,
      // //       lgs: param.lgs,
      // //       fontsizeapps: param.fontsizeapps,
      // //       cooptoken: param.cooptoken,
      // //     ),
      '/diluteShares': (BuildContext context) => DiluteShares(
          param: widget.param, imei: getdevicealls.model.toString()),
      '/calculate': (BuildContext context) => CalculateBorrow(
          param: widget.param, imei: getdevicealls.model.toString()),
      // '/saveBorrow': (BuildContext context) => SaveBorrow(
      //       token: param.token,
      //       name: param.name,
      //       membership_no: param.membership_no,
      //       lgs: param.lgs,
      //       fontsizeapps: param.fontsizeapps,
      //       cooptoken: param.cooptoken,
      //       param: param,
      //     ),
      '/trackStatus': (BuildContext context) => TrackStatus(
          param: widget.param, imei: getdevicealls.model.toString()),
      // '/editprofile': (BuildContext context) => EditProfile(param: param),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FC_Lamoon',
      ),
      routes: route,
      home: Scaffold(
        extendBody: true,
        body: page[_selectedPage],
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: HexColor('#BA8C26'),
            child: Image.asset(
              'assets/imgPro/menuPro.png',
              width: 40,
            ),
            onPressed: () {
              _device();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isActive == true ? iconListA[index] : iconList[index],
                  width: tabletMode ? 40 : 30,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    nameList[index].toString(),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.defaultTxt1(
                        context, tabletMode ? -15 : -6, isActive ? 'Go' : 'Bl'),
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: _bottomNavIndex,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.sharpEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          height: tabletMode ? 100 : 70,
          onTap: (index) => setState(() => {
                _bottomNavIndex = index,
                _selectedPage = index,
              }),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
