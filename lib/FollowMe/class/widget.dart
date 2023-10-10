import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:flutter/material.dart';

class MyWidget {
  static nodata(lgs, context) {
    return Center(
      child: Text(
        Language.mainLg('nodata', lgs),
        textScaleFactor: MyClass.fontSizeApp(),
        style: CustomTextStyle.nodataTxt(context, 0),
      ),
    );
  }

  static BoxDecoration bgPdpa() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bgpdpa.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  static BoxDecoration bgApp() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bg.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
