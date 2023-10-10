import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/promoney/class/custom_ui_pro.dart';
import 'package:mwasc/promoney/class/languagepro.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:mwasc/promoney/class/textstylepro.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class CalculateBorrow extends StatefulWidget {
  final Param param;
  final String imei;

  const CalculateBorrow({super.key, required this.imei, required this.param});

  @override
  CalculateBorrowState createState() => CalculateBorrowState();
}

class CalculateBorrowState extends State<CalculateBorrow> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUIPro.appbarDetailUiPro('assets/imgPro/calculate.png',
          'calculate', widget.param.fontsizeapps, widget.param.lgs, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.2
                        : displayHeight(context) * 0.2,
                  ),
                  _rowcalculateBorrowingRightsButtom(),
                ],
              ),
            ),
          ),

          // CustomUI.appbarUi(),
        ],
      ),
    );
  }

  Widget _rowcalculateBorrowingRightsButtom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            // width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColorPro.color('gr'),
                  MyColorPro.color('gr1'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                _launchURL(
                    "${MyClass.hostApp()}/promoney/loancal/${widget.param.cooptoken}/${widget.param.token}");
              },
              child: Center(
                child: Text(
                  LanguagePro.adminPro(
                      'checkMaximumLoanAmount', widget.param.lgs, ''),
                  textScaleFactor:
                      MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                  style: CustomTextStylePro.buttonTxt(context, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
