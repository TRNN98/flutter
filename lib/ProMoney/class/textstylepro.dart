import 'dart:io';

import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/promoney/class/mycolorpro.dart';
import 'package:flutter/material.dart';

class CustomTextStylePro {
  static TextStyle defaultCTxt(BuildContext context, double number, color) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.045 : 0.045) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color(color));
  }

  static TextStyle cardTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (tabletMode ? 0.035 : 0.05) + number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle cardWTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (tabletMode ? 0.035 : 0.05) + number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('w'));
  }

  static TextStyle headTitleTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * 0.065 + number,
        // fontSize: tabletMode ? 35 + number : 20 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle titleTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * 0.065 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle txtColor(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * 0.07 + number,
        color: MyColorPro.color('w'));
  }

  static TextStyle headTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.045 : 0.045) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('headtxt'));
  }

  static TextStyle adminDetailTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.03 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle buttonBarTxt(BuildContext context, double number, type) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: type == 's' ? MyColorPro.color('w') : const Color(0xFFBA8C26));
  }

  static TextStyle buttonTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.050 : 0.050) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('w'));
  }

  static TextStyle buttonCTxt(BuildContext context, double number, type) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.050 : 0.050) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: type == 'b'
            ? MyColorPro.color('b')
            : type == 'g'
                ? MyColorPro.color('defaulttxt')
                : MyColorPro.color('gr2'));
  }

  static TextStyle detailTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.036 : 0.036) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle detailTxtLight(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w300,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.036 : 0.036) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle detail1Txt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('R'));
  }

  static TextStyle defaultTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle defaultTxtLight(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w100,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle defaultTxt1(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color('b'));
  }

  static TextStyle defaultTxtC(BuildContext context, double number, c) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.030 : 0.030) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColorPro.color(c));
  }

  static TextStyle defaultTxtCS(
      BuildContext context, double number, statusColor) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.045 : 0.045) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: statusColor == 'R'
            ? const Color(0xFFFF0000)
            : statusColor == 'G'
                ? const Color(0xFF078007)
                : const Color(0xFF000000));
  }

  static showErrorTextField(context) {
    return TextStyle(
      // fontSize: 16.0,
      fontFamily: "prompt",
      fontWeight: FontWeight.w500,
      fontSize: displayWidth(context) * 0.04,
    );
  }
}
