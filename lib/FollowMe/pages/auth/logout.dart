import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:flutter/material.dart';

const String lgs = 'th';

class Logout extends StatefulWidget {
  final String gettitle;

  const Logout({super.key, required this.gettitle});

  @override
  LogoutState createState() => LogoutState();
}

class LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGroundAuth(),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                tabletMode
                    ? lineSizedBox(context, displayHeight(context) * 0.03)
                    : lineSizedBox(context, displayHeight(context) * 0.05),
                CustomUI.appbarDetailUi3('assets/imgs/icon.png', context),
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.0275
                      : displayHeight(context) * 0.0275,
                ),
                Text(MyClass.company('th'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataHeadTitleCTxt(context, 3, 'Go')),
                Text(MyClass.company('en'),
                    textAlign: TextAlign.center,
                    textScaleFactor: MyClass.fontSizeApp(),
                    style:
                        CustomTextStyle.dataHeadTitleCTxt(context, -2, 'Go')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                _buildsubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildsubmitButton() {
    bool platformios = MyClass.checkPlatform();
    return Container(
      width: displayWidth(context) * 0.8,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // color: MyColor.color('button'),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Pins(gettitle: 'pinCode')),
          );
        },
        child: Center(
          child: Text(
            Language.loginLg('logIn', lgs),
            textScaleFactor: MyClass.fontSizeApp(),
            style:
                CustomTextStyle.buttonTxt(context, platformios == true ? 0 : 3),
          ),
        ),
      ),
    );
  }
}
