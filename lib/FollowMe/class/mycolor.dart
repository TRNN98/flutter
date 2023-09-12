import 'package:flutter/material.dart';

class MyColor {
  static color(data) {
    if (data.toString() == 'colorheader') {
      return const Color(0xFFF5D512);
    } else if (data.toString() == 'datatitle') {
      return const Color(0xFFFFFFFF);
    } else if (data.toString() == 'headtitle') {
      return Colors.blue;
    } else if (data.toString() == 'linelist') {
      return Colors.grey;
    } else if (data.toString() == 'TextFormFieldTextStyle') {
      return const Color(0xFF6C6C6C);
    } else if (data.toString() == 'TextFormFieldBorderSide') {
      return const Color(0xFFBA8C26);
    } else if (data.toString() == 'button') {
      return const Color(0xFFBA8C26);
    } else if (data.toString() == 'button1') {
      return const Color(0xFFC21E1E);
    } else if (data.toString() == 'buttonG') {
      return const Color(0xFF005E32);
    } else if (data.toString() == 'buttonRegis') {
      return const Color(0xFFF5AF0B);
    } else if (data.toString() == 'buttonnext') {
      return const Color(0xFF979797);
    } else if (data.toString() == 'slide1') {
      return const Color(0xFF0051CA);
    } else if (data.toString() == 'slide2') {
      return Color.fromARGB(255, 251, 251, 251);
    } else if (data.toString() == 'imgprofile') {
      return const Color(0xFFF5D512);
    } else if (data.toString() == 'detailhead') {
      return const Color(0xFFF5D51A);
    } else if (data.toString() == 'settings') {
      return const Color(0xFF005E32);
    } else if (data.toString() == 'buttongra') {
      return const Color(0xFFCDAE32);
    } else if (data.toString() == 'buttongra1') {
      return const Color(0xFFB68925);
    } else if (data.toString() == 'buttongra2') {
      return const Color(0xFFF36D10);
    } else if (data.toString() == 'buttongra3') {
      return const Color(0xFFF36D10);
    } else if (data.toString() == 'tabs') {
      return const Color(0x441CA7EC);
    } else if (data.toString() == 'bg') {
      return const Color(0x441CA7EC);
    } else if (data.toString() == 'R') {
      return const Color(0xFFD01616);
    } else if (data.toString() == 'B') {
      return const Color(0xFF023CC2);
    } else if (data.toString() == 'G') {
      return const Color(0xFF1FC019);
    } else if (data.toString() == 'BlH') {
      return const Color(0xFF262626);
    } else if (data.toString() == 'Or') {
      return const Color(0xFFE85B00);
    } else if (data.toString() == 'Gr') {
      return const Color(0xFF9E9E9E);
    } else if (data.toString() == 'divider') {
      return const Color(0xFF000000);
    } else if (data.toString() == 'Bl') {
      return const Color(0xFF000000);
    } else if (data.toString() == 'Go') {
      return const Color(0xFFBA8C26);
    } else if (data.toString() == 'LineColor') {
      return const Color(0xFFBA8C26);
    } else if (data.toString() == 'SettingBackground') {
      return Colors.white;
    } else if (data.toString() == 'w') {
      return const Color(0xFFFFFFFF);
    } else if (data.toString() == 'bl') {
      return const Color(0xFF0051CA);
    } else if (data.toString() == 'bl1') {
      return const Color(0xFF63DEFF);
    } else if (data.toString() == 'bl2') {
      return const Color(0xFF3CE8FF);
    } else if (data.toString() == 'bl3') {
      return Color(0xFFD1FDFF);
    } else if (data.toString() == 'TxtBlue') {
      return const Color(0xFF003B93);
    } else if (data.toString() == 'Shadow') {
      return Color.fromARGB(113, 0, 0, 0);
    } else if (data.toString() == 'TxtBl') {
      return Color(0xFF047AE2);
    } else if (data.toString() == 'detailhead1') {
      return Color(0xFF47A5FF);
    } else if (data.toString() == 'detailhead2') {
      return Color(0xFF66C8FF);
    } else if (data.toString() == 'TxtBt') {
      return Color(0xFF2192FF);
    }
  }

  static colorLinear(data) {
    if (data.toString() == "button") {
      return <Color>[
        const Color(0xFFF5D512),
        const Color(0xFFF5D512),
        const Color(0xFFF5D512),
      ];
    } else if (data.toString() == "button2") {
      return <Color>[
        Colors.red,
        Colors.red,
        Colors.red,
      ];
    } else if (data.toString() == "button1") {
      return <Color>[
        Colors.pink,
        Colors.pink,
        Colors.pink,
      ];
    } else if (data.toString() == "button3") {
      return <Color>[
        Colors.green,
        Colors.green,
        Colors.green,
      ];
    } else if (data.toString() == "buttoncheckrg1") {
      return <Color>[
        const Color(0xFF42E974),
        const Color(0xFF42E974),
        const Color(0xFF189D6C),
      ];
    } else if (data.toString() == "buttoncheckrg2") {
      return <Color>[
        const Color(0xFF0135E1),
        const Color(0xFF0135E1),
        const Color(0xFF393694),
      ];
    }
  }
}
