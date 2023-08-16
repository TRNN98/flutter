import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/promoney/class/myclasspro.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:udtscc/promoney/class/textstylepro.dart';
import 'package:udtscc/root/tabs.dart';
import 'package:flutter/material.dart';

class AccountFinish extends StatefulWidget {
  final Param param;

  const AccountFinish({
    super.key,
    required this.param,
  });

  @override
  AccountFinishState createState() => AccountFinishState();
}

class AccountFinishState extends State<AccountFinish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: MyClass.backGround(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: displayWidth(context) * 1,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Tabs(widget.param)));
                  },
                  child: Center(
                    child: Text(
                      'เสร็จสิ้น',
                      textScaleFactor:
                          MyClassPro.fontSizeApp(widget.param.fontsizeapps),
                      style: CustomTextStylePro.buttonTxt(context, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
