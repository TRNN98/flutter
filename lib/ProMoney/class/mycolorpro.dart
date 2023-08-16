import 'package:flutter/material.dart';

class MyColorPro {
  static color(data) {
    if (data.toString() == 'b') {
      return const Color(0xff000000);
    } else if (data.toString() == 'w') {
      return const Color(0xffffffff);
    } else if (data.toString() == 'card') {
      return const Color(0xCCFFFFFF);
    } else if (data.toString() == 'headtxt') {
      return const Color(0xff262121);
    } else if (data.toString() == 'defaulttxt') {
      return const Color(0xff006937);
    } else if (data.toString() == 'buttontxt') {
      return const Color(0xFFF5D51A);
    } else if (data.toString() == 'buttonBar') {
      return const Color(0xffBA8C26);
    } else if (data.toString() == 'detail') {
      return const Color(0xFF222222);
    } else if (data.toString() == 'gr') {
      return const Color(0xFFCDAD31);
    } else if (data.toString() == 'gr1') {
      return const Color(0xFFB68925);
    } else if (data.toString() == 'gr2') {
      return const Color(0xffDE7710);
    } else if (data.toString() == 'gr3') {
      return const Color(0xffF29130);
    } else if (data.toString() == 'bill') {
      return const Color(0xFFFFFFFF);
    } else if (data.toString() == 'headdetail') {
      return const Color(0xff006937);
    } else if (data.toString() == 'detailadmin') {
      return const Color(0x00E4F9FF);
    } else if (data.toString() == 'R') {
      return const Color(0xffFF0000);
    } else if (data.toString() == 'G') {
      return const Color(0xff00b200);
    } else if (data.toString() == 'blue') {
      return const Color(0xFF023CC2);
    } else if (data.toString() == 'gray') {
      return const Color(0xff6e6e6e);
    } else if (data.toString() == 'line') {
      return const Color(0xff426aee);
    } else if (data.toString() == 'scb') {
      return const Color(0xff502e82);
    } else if (data.toString() == 'kbank') {
      return const Color(0xff3ca247);
    } else if (data.toString() == 'ktb') {
      return const Color(0xff00a3e4);
    }
  }
}
