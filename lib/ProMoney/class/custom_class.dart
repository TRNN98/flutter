import 'package:mwasc/promoney/class/languagepro.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:mwasc/promoney/class/textstylepro.dart';
import 'package:flutter/material.dart';

class CustomClass {
  static cardhead(fontsizeapps, lgs, txt, context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Divider(
                  endIndent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColorPro.color('b'),
                ),
              ),
              Text(
                LanguagePro.tranPro(txt, lgs),
                textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                style: CustomTextStylePro.headTxt(context, 0),
              ),
              Expanded(
                flex: 5,
                child: Divider(
                  indent: 5,
                  height: 20,
                  thickness: 2,
                  color: MyColorPro.color('b'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
