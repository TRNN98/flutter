import 'package:udtscc/FollowMe/pages/auth/login.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/pages/intro/notrg.dart';
import 'package:flutter/material.dart';

class Checkrg extends StatefulWidget {
  const Checkrg({super.key});

  @override
  CheckrgState createState() => CheckrgState();
}

class CheckrgState extends State<Checkrg> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyWidget.bgApp(),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode
                      ? displayHeight(context) * 0.2
                      : displayHeight(context) * 0.2,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding:
                          EdgeInsets.only(top: displayHeight(context) * 0.01),
                      child: Image.asset(
                        'assets/imgs/checkRe.png',
                        width: tabletMode
                            ? displayWidth(context) * 0.5
                            : displayWidth(context) * 0.5,
                        height: tabletMode
                            ? displayWidth(context) * 0.5
                            : displayWidth(context) * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                        child: Text(
                      'คุณเคยลงทะเบียนใช้งานระบบบริการสมาชิก\nแบบออนไลน์ \n (เว็บไซต์ หรือ โมบายแอปพลิเคชัน) \n แล้ว ใช่หรือไม่ ?',
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.titleIntoTxt2(context, -10),
                    )),
                  ],
                ),
                lineSizedBox(context, 0),
                hSizedBoxButton(context, 0),
                _onSubmit()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _onSubmit() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.30,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('button1'),
                MyColor.color('button1'),
              ],
            ),
          ),
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Notrg(),
                ),
              );
            },
            child: Center(
              child: Text(
                'ไม่ใช่',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt1(context, 5, 'w'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.30,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Login(lgs: "1.0"),
                ),
              );
            },
            child: Center(
              child: Text(
                '   ใช่   ',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Text(''),
        ),
      ],
    );
  }
}
