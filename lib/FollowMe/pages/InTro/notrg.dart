import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/pages/intro/checkrg.dart';
import 'package:mwasc/FollowMe/pages/auth/check_register.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:flutter/material.dart';

class Notrg extends StatefulWidget {
  const Notrg({super.key});

  @override
  NotrgState createState() => NotrgState();
}

class NotrgState extends State<Notrg> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: MyWidget.bgApp(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.10
                        : displayHeight(context) * 0.20,
                  ),
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
                    'แอปพลิเคชัน',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldBTxt(context, 0),
                  )),
                  Center(
                      child: Text(
                    MyClass.company('th'),
                    textAlign: TextAlign.center,
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldBTxt(context, 0),
                  )),
                  Center(
                      child: Text(
                    'ขอเชิญพบกับประสบการณ์การให้บริการ',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldBTxt(context, 0),
                  )),
                  Center(
                      child: Text(
                    'ข้อมูลสมาชิกที่ครอบคลุมทุกการใช้งาน',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldBTxt(context, 0),
                  )),
                  lineSizedBox(context, 0),
                  Center(
                      child: Text(
                    'กรุณาลงทะเบียนสมัครสมาชิก',
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataBoldBTxt(context, 0),
                  )),
                  hSizedBoxButton(context, 0),
                  _onSubmit()
                ],
              ),
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
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.4,
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
                  builder: (context) => Checkregister(
                      title: Language.loginLg('memberRegis', 'th'), lgs: 'th'),
                ),
              );
            },
            child: Center(
              child: Text(
                'ลงทะเบียน',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.4,
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
                  builder: (context) => const Checkrg(),
                ),
              );
            },
            child: Center(
              child: Text(
                'ยกเลิก',
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt1(context, 5, 'w'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
      ],
    );
  }
}
