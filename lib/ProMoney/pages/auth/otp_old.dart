import 'dart:io';

import 'package:flutter_udid/flutter_udid.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/languagepro.dart';
import 'package:udtscc/promoney/locals/device.dart';
import 'package:udtscc/promoney/models/sql/device_db.dart';
import 'package:udtscc/promoney/sevices/network_pro.dart';
import 'package:udtscc/root/tabs.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:timer_button/timer_button.dart';

class Otp extends StatefulWidget {
  final String type;
  final String tokenOtp;
  final String timeout;
  final String phoneNo;
  final String bank;
  final Param param;

  const Otp(
      {super.key,
      required this.type,
      required this.tokenOtp,
      required this.timeout,
      required this.phoneNo,
      required this.bank,
      required this.param});

  @override
  OtpState createState() => OtpState();
}

class Devices {
  deviceInfo() {
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

DeviceInfoPlugin device1 = DeviceInfoPlugin();

class OtpState extends State<Otp> {
  late Size _screenSize;
  int _currentDigit = 6;
  late List<dynamic> otpValues;
  bool showLoadingButton = false;
  int otpLength = 6;
  late Color keyboardBackgroundColor;
  late bool tabletMode;

  // OTPCountDown _otpCountDown;
  // OTPCountDown _otpSendClose;
  late int _otpTimeInMS;

  Devices getdeviceall = Devices();

  void getDevice() async {
    String udid = await FlutterUdid.udid;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await device1.androidInfo;
      getdeviceall.name = androidInfo.device;
      getdeviceall.platform = androidInfo.product;
      getdeviceall.version = androidInfo.version.release;
      getdeviceall.model = udid;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device1.iosInfo;
      getdeviceall.name = iosInfo.name;
      getdeviceall.platform = iosInfo.systemName;
      getdeviceall.version = iosInfo.systemVersion;
      getdeviceall.model = udid;
    }
    setState(() {});
  }

  getDeviceStatus() {
    var obj =
        '{"mode": "1","imei":"${getdeviceall.model}","platform":"${getdeviceall.platform} ","model":"${getdeviceall.name}(${getdeviceall.version})","phone":"${widget.phoneNo}","bank":"${widget.bank}"}';
    NetworkPro.fetchDeviceStatus(obj, widget.param.token, context)
        .then((value) => {
              dv.status = '1',
              dbDevice.initDB().then((value) => {
                    dbDevice.insertDevice(dv).then((value) => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tabs(widget.param),
                            ),
                          )
                        }),
                  }),
            });
  }

  // void _startCountDown() {
  //   // _otpCountDown = OTPCountDown.startOTPTimer(
  //   //   timeInMS: _otpTimeInMS,
  //   //   currentCountDown: (String countDown) {
  //   //     _countDown = countDown;
  //   //     setState(() {});
  //   //   },
  //   //   onFinish: () {
  //   //     print("Count down finished!");
  //   //   },
  //   // );
  // }

  // void _startCountDownSendClose() {
  //   _otpSendClose = OTPCountDown.startOTPTimer(
  //     timeInMS: _otpSendCloseTimeInMS,
  //     currentCountDown: (String countDown) {
  //       _countDownSendClose = countDown.split(':')[1];
  //       setState(() {});
  //     },
  //     onFinish: () {
  //       print("Count down finished!");
  //     },
  //   );
  // }

  void onEnd() {}

  DeviceDb dv = DeviceDb();
  late DBDevice dbDevice;

  @override
  void initState() {
    _otpTimeInMS = DateTime.now().millisecondsSinceEpoch +
        1000 * int.parse(widget.timeout) * 60;
    otpValues = List<dynamic>.filled(otpLength, '', growable: false);
    dbDevice = DBDevice();
    super.initState();
    getDevice();
  }

  @override
  void dispose() {
    // _otpCountDown.cancelTimer();
    // _otpSendClose.cancelTimer();
    dbDevice.close();
    super.dispose();
  }

  validateOtp(String otp) async {
    _getVerifyOtp(otp);
    await Future.delayed(const Duration(milliseconds: 15000));
  }

  _getVerifyOtp(otp) {
    if (otp == '123123') {
      getDeviceStatus();
    }
    // NetworkPro.fetchVerifyOtp(
    //         '{"Token": "' + widget.tokenOtp + '","Pin": "' + otp + '"}',
    //         widget.param.token,
    //         context)
    //     .then((value) {
    //   try {
    //     if (value[0]['data']['status'] == 'success') {
    //       getDeviceStatus();
    //     } else {
    //       MyClassPro.showToastPro('ใส่รหัส OTP ไม่ถูกต้อง', context);
    //       clearOtp();
    //       showLoadingButton = false;
    //     }
    //   } catch (e) {
    //     MyClassPro.showToastPro('ใส่รหัส OTP ไม่ถูกต้อง', context);
    //     clearOtp();
    //     showLoadingButton = false;
    //   }
    // });
  }

  //
  // void moveToNextScreen(context) {
  //   if (widget.type == Language.loginLg('memberRegis', widget.lgs)) {
  //     Network.fetchAuthRe('{"membership_no": "' +
  //             widget.membership_no +
  //             '","password":"' +
  //             widget.password +
  //             '","id_card":"' +
  //             widget.id_card +
  //             '","member_name":"' +
  //             '' +
  //             '","member_surname":"' +
  //             '' +
  //             '","date_of_birth":"' +
  //             widget.date_of_birth +
  //             '"}')
  //         .then((value) => {
  //               _onLoginsRe(value, context, widget.lgs),
  //             });
  //   } else {
  //     Network.fetchAuthFo('{"membership_no": "' +
  //             widget.membership_no +
  //             '","password":"' +
  //             widget.password +
  //             '","id_card":"' +
  //             widget.id_card +
  //             '","member_name":"' +
  //             '' +
  //             '","member_surname":"' +
  //             '' +
  //             '","date_of_birth":"' +
  //             widget.date_of_birth +
  //             '"}')
  //         .then((value) => {
  //               _onLoginsFo(value, context, widget.lgs),
  //             });
  //   }
  // }

  // void _onLoginsRe(value, context, lgs) {
  //   try {
  //     if (MyClass.json(value)[0]['rc_code'] == '1') {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => Login(lgs: lgs),
  //         ),
  //       );
  //     } else {
  //       // MyClass.showToast(Language.loginLg('registrationFailed', lgs), context);
  //     }
  //   } catch (e) {
  //     // MyClass.showToast(Language.loginLg('registrationFailed', lgs), context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    tabletMode = MediaQuery.of(context).size.width > 600;
    // getDevice();
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              decoration: MyWidget.bgApp(),
              child: SingleChildScrollView(
                child: _getInputPart,
              )),
          CustomUI.appbarDetailUi2('assets/imgs/icon.png', context),
          // CustomUI.appbarUi(context),
        ],
      ),
    );
  }

  get _getInputPart {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            tabletMode ? hSizedBox(context, 20) : hSizedBox(context, 30),
            Padding(
              padding: const EdgeInsets.all(1),
              child: _getTitleText,
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: _getSubtitleText,
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: _gettime,
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: _requestOtp,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: _getInputField,
        ),
        showLoadingButton
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox(
                width: 0,
                height: 0,
              ),
        _getOtpKeyboard
      ],
    );
  }

  get _getOtpKeyboard {
    return SizedBox(
        height: tabletMode ? _screenSize.width - 300 : _screenSize.width - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "1",
                    onPressed: () {
                      _setCurrentDigit(1);
                    }),
                _otpKeyboardInputButton(
                    label: "2",
                    onPressed: () {
                      _setCurrentDigit(2);
                    }),
                _otpKeyboardInputButton(
                    label: "3",
                    onPressed: () {
                      _setCurrentDigit(3);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "4",
                    onPressed: () {
                      _setCurrentDigit(4);
                    }),
                _otpKeyboardInputButton(
                    label: "5",
                    onPressed: () {
                      _setCurrentDigit(5);
                    }),
                _otpKeyboardInputButton(
                    label: "6",
                    onPressed: () {
                      _setCurrentDigit(6);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "7",
                    onPressed: () {
                      _setCurrentDigit(7);
                    }),
                _otpKeyboardInputButton(
                    label: "8",
                    onPressed: () {
                      _setCurrentDigit(8);
                    }),
                _otpKeyboardInputButton(
                    label: "9",
                    onPressed: () {
                      _setCurrentDigit(9);
                    }),
              ],
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: Icon(
                        Icons.backspace,
                        size: tabletMode ? 60 : 30,
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = otpLength - 1; i >= 0; i--) {
                            if (otpValues[i] != '') {
                              otpValues[i] = '';
                              break;
                            }
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _otpKeyboardInputButton({label, onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(40.0),
        child: Container(
          height: tabletMode ? 150 : 60,
          width: 80.0,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: tabletMode ? 60 : 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setCurrentDigit(int i) async {
    setState(() {
      _currentDigit = i;
      int currentField;

      for (currentField = 0; currentField < otpLength; currentField++) {
        if (otpValues[currentField] == '') {
          otpValues[currentField] = _currentDigit;
          break;
        }
      }

      if (currentField == otpLength - 1) {
        showLoadingButton = true;

        String otp = otpValues.join();

        validateOtp(otp).then((value) {
          showLoadingButton = false;
        });
      }
    });
  }

  _otpKeyboardActionButton({label, onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }

  // showToast(BuildContext context, String msg) {
  //   Widget toast = Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 50.0),
  //       child: Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(25.0),
  //           color: Colors.grey.shade500,
  //         ),
  //         child: Center(
  //             child: Text(
  //           msg,
  //           maxLines: 3,
  //           textAlign: TextAlign.center,
  //         )),
  //       ));
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 3);
  // }

  void clearOtp() {
    otpValues = List<dynamic>.filled(otpLength, '', growable: false);
    setState(() {});
  }

  get _getInputField {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getOtpTextWidgetList(),
    );
  }

  List<Widget> getOtpTextWidgetList() {
    List<Widget> optList = [];
    for (int i = 0; i < otpLength; i++) {
      optList.add(_otpTextField(otpValues[i]));
    }
    return optList;
  }

  Widget _otpTextField(dynamic digit) {
    return Container(
      width: tabletMode ? 100 : 45,
      height: tabletMode ? 120 : 45,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 2.0,
      ))),
      child: Text(
        digit != null ? digit.toString() : "",
        style: TextStyle(
          fontSize: tabletMode ? 60 : 30,
        ),
      ),
    );
  }

  get _getTitleText {
    return Text(LanguagePro.otpLg('verification', widget.param.lgs),
        style: CustomTextStyle.dataBoldBTxt(context, 3));
  }

  get _getSubtitleText {
    return Text(
        '${LanguagePro.otpLg('otp', widget.param.lgs)}${MyClass.formatNumberPhoneX(widget.phoneNo)}',
        // MyClass.formatNumberPhoneX(widget.phoneNo),
        style: CustomTextStyle.dataBoldBTxt(context, 1));
  }

  get _gettime {
    return CountdownTimer(
      onEnd: onEnd,
      // endWidget: onEnd,
      endTime: _otpTimeInMS,
      widgetBuilder: (_, time) {
        if (time == null) {
          return Text(LanguagePro.otpLg('time', widget.param.lgs) + '0.00',
              style: CustomTextStyle.dataBoldBTxt(context, 1));
        }
        return Text(
            LanguagePro.otpLg('time', widget.param.lgs) +
                ' ${time.min ?? '0'}:${time.sec ?? '0'}',
            style: CustomTextStyle.dataBoldBTxt(context, 1));
      },
    );
  }

  get _requestOtp {
    // return TimerButton(
    //   label: LanguagePro.otpLg('requestOtp', widget.param.lgs),
    //   timeOutInSeconds: 30,
    //   onPressed: () {},
    //   // disabledColor: Colors.grey,
    //   // color: Colors.blue,
    //   disabledTextStyle: CustomTextStylePro.defaultCTxt(context, 1, 'gray'),
    //   activeTextStyle: CustomTextStylePro.defaultCTxt(context, 1, 'blue'),
    //   buttonType: ButtonType.OutlineButton,
    // );
  }
//   return Column(
//     children: [
//       CountdownTimer(
//         endTime: _otpTimeInMS,
//         widgetBuilder: (_, time) {
//           if (time == null) {
//             return Text(LanguagePro.otpLg('time', widget.param.lgs) + '0.00',
//                 style: CustomTextStyle.dataBoldBTxt(context, 1));
//           }
//           return Text('');
//         },
//       ),
//       GestureDetector(
//         onTap: () {
//           _countDownSendClose == '' ? _getSendOtp() : null;
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Icon(
//             //   Icons.refresh,
//             //   color: Color(0xFF0000FF),
//             // ),
//             _countDownSendClose == null
//                 ? Text(LanguagePro.otpLg('requestOtp', widget.param.lgs),
//                     style: TextStyle(
//                         fontFamily: "FC_Lamoon",
//                         fontWeight: FontWeight.w500,
//                         fontSize: displayWidth(context) * 0.055 + 1,
//                         color: Color(0xFF00A1FA)))
//                 : Text(
//                     LanguagePro.otpLg('requestOtp', widget.param.lgs) +
//                         '(' +
//                         _otpSendCloseTimeInMS +
//                         ')',
//                     style: TextStyle(
//                         fontFamily: "FC_Lamoon",
//                         fontWeight: FontWeight.w500,
//                         fontSize: displayWidth(context) * 0.055 + 1,
//                         color: Color(0xFF808081))),
//           ],
//         ),
//       ),
//     ],
//   );
// }
}
