import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';

// import 'package:udtscc/ProMoney/class/mycolorpro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomTextStyle {
  static TextStyle dataBoldWTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.055 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.045 + number
            : displayWidth(context) * 0.055 + number,
        color: const Color(0xFFFFFFFF));
  }

  static TextStyle titleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.06 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.05 + number
            : displayWidth(context) * 0.06 + number,
        color: const Color(0xFF000000));
  }

  static TextStyle titleWTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.06 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.05 + number
            : displayWidth(context) * 0.06 + number,
        color: const Color(0xFFFFFFFF));
  }

  // static TextStyle defaultTxt1(BuildContext context, double number) {
  //   bool tabletMode = MediaQuery.of(context).size.width > 600;
  //
  //   return Theme.of(context).textTheme.bodyLarge!.copyWith(
  //       fontFamily: "Prompt",
  //       fontWeight: FontWeight.w500,
  //       fontSize: displayWidth(context) * (Platform.isAndroid ? 0.040 : 0.045) +
  //           number,
  //       // fontSize: tabletMode ? 30 + number : 17 + number,
  //       color: MyColorPro.color('w'));
  // }

  static TextStyle subTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.06 + number
        fontSize: tabletMode
            ? displayWidth(context) * 0.04 + number
            : displayWidth(context) * 0.06 + number,
        // fontSize: tabletMode ? 40 + number : 25 + number,
        color: const Color(0xFFFFFFFF));
  }

  static TextStyle titleIntoTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "prompt",
          fontWeight: FontWeight.bold,
          // fontSize: displayWidth(context) * 0.06 + number,
          color: const Color(0xFF0051CA),

          fontSize: tabletMode
              ? displayWidth(context) * 0.06 + number
              : displayWidth(context) * 0.07 + number,
          // fontSize: tabletMode ? 60 + number : 35 + number,
        );
  }

  static TextStyle titleIntoTxt1(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "prompt",
          fontWeight: FontWeight.w500,
          // fontSize: displayWidth(context) * 0.07 + number,
          color: const Color(0xFF0051CA),
          shadows: <Shadow>[
            const Shadow(
                color: Color(0xFF000000), offset: Offset.zero, blurRadius: 1.0)
          ],

          fontSize: tabletMode
              ? displayWidth(context) * 0.06 + number
              : displayWidth(context) * 0.07 + number,
          // fontSize: tabletMode ? 60 + number : 35 + number,
        );
  }

  static TextStyle titleIntoTxt2(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "prompt",
          fontWeight: FontWeight.w500,
          // fontSize: displayWidth(context) * 0.06 + number,
          color: const Color(0xFF0051CA),

          fontSize: tabletMode
              ? displayWidth(context) * 0.06 + number
              : displayWidth(context) * 0.07 + number,
          // fontSize: tabletMode ? 60 + number : 35 + number,
        );
  }

  static TextStyle titleIntoTxt3(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "prompt",
          fontWeight: FontWeight.w500,
          // fontSize: displayWidth(context) * 0.06 + number,
          color: const Color(0xFF000000),

          fontSize: tabletMode
              ? displayWidth(context) * 0.05 + number
              : displayWidth(context) * 0.06 + number,

          // fontSize: tabletMode ? 60 + number : 35 + number,
        );
  }

  static TextStyle defaultpdpaTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.03 : 0.035) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: Colors.black);
    //Color(0xFF000000));
  }

  static TextStyle dataBoldBTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.04 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.03 + number
            : displayWidth(context) * 0.04 + number,
        color: const Color(0xFF000000));
  }

  static TextStyle defaultTxtColor(
      BuildContext context, double number, String statusColor) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.03 : 0.035) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: MyColor.color(statusColor));
  }

  static TextStyle dataHeadTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.035 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: const Color(0xFF181717));
  }

  static TextStyle dataHeadTitleCTxt(
      BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: "prompt",
          fontWeight: FontWeight.bold,
          // fontSize: displayWidth(context) * 0.04 + number,
          fontSize: tabletMode
              ? displayWidth(context) * 0.03 + number
              : displayWidth(context) * 0.04 + number,
          color: MyColor.color(color),
        );
  }

  static TextStyle dataHeadDataTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.035 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: const Color(0xFF000000));
  }

  static TextStyle dataHeadDataCTxt(
      BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.035 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: MyColor.color(color));
  }

  static TextStyle headTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.04 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.03 + number
            : displayWidth(context) * 0.04 + number,
        color: const Color(0xFF000000));
  }

  static TextStyle dataTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.025 : 0.030) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.020 + number
            : displayWidth(context) * 0.030 + number,
        color: const Color(0xFF8A8A8A));
  }

  static TextStyle defaultTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.035 : 0.040) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        color: const Color(0xFF000000));
  }

  static TextStyle defaultTxt1(BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.035 : 0.040) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        color: MyColor.color(color));
  }

  static TextStyle defaultTxtBoldLineUnder(
      BuildContext context, double number, bool checkbox) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.035 : 0.040) +
        //     number,
        decoration: TextDecoration.underline,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        color: checkbox ? const Color(0xFF000000) : const Color(0xFFAAAAAA));
  }

  static TextStyle dataBoldTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.03 : 0.035) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: const Color(0xFF1C1B1B));
  }

  static TextStyle dataHTxt(BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.03 : 0.035) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.025 + number
            : displayWidth(context) * 0.035 + number,
        color: MyColor.color(color));
  }

  static TextStyle dataBoldTxt1(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.055 : 0.06) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.05 + number
            : displayWidth(context) * 0.06 + number,
        color: const Color(0xFFFFFFFF));
  }

  static TextStyle dataBoldTxt2(BuildContext context, double number, c) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.050 : 0.055) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.045 + number
            : displayWidth(context) * 0.055 + number,
        color: c == 'R' ? const Color(0xFFFF0000) : const Color(0xFFBA8C26));
  }

  static TextStyle buttonTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.04 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.03 + number
            : displayWidth(context) * 0.04 + number,
        color: const Color(0xFFFFFFFF));
  }

  static TextStyle buttonCTxt(BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.035 : 0.040) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        color: MyColor.color(color));
  }

  static TextStyle settingTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        // fontSize: displayWidth(context) * 0.05 + number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        color: const Color(0xFF0051CA));
  }

  static ClipPath headcolor(BuildContext context, double number) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        height: displayHeight(context) * 0.12 + number,
        // height: tabletMode ? 70 + number : 70 + number,
        color: MyColor.color('colorheader'),
        // child: Center(child: Text("DiagonalPathClipper()")),
      ),
    );
  }

  static ClipPath headcolor1(BuildContext context, double number) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        height: displayHeight(context) * 0.12 + number,
        // height: tabletMode ? 70 + number : 70 + number,
        color: MyColor.color('colorheader'),
        // child: Center(child: Text("DiagonalPathClipper()")),
      ),
    );
  }

  static TextStyle nodataTxt(BuildContext context, double number) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.w500,
        fontSize: displayWidth(context) * 0.1 + number,
        // fontSize: tabletMode ? 25 + number : 15 + number,
        color: const Color(0xFFFF0000));
  }

  static TextStyle defaultTxtPaint(
      BuildContext context, double number, Color, double Width) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.bold,
        // fontSize: displayWidth(context) * (Platform.isAndroid ? 0.035 : 0.040) +
        //     number,
        fontSize: tabletMode
            ? displayWidth(context) * 0.030 + number
            : displayWidth(context) * 0.040 + number,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = Width as double
          ..color = MyColor.color(Color));
  }
}

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     final double innerCircleRadius = 111;

//     Path path = Path();
//     path.lineTo(0, rect.height);
//     path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
//         rect.height + 15, rect.width / 2 - 75, rect.height + 50);
//     path.cubicTo(
//         rect.width / 2 - 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 75,
//         rect.height + 50);
//     path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
//         rect.height + 15, rect.width, rect.height);
//     path.lineTo(rect.width, 0.0);
//     path.close();

//     return path;
//   }
// }
