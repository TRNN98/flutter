import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomPickerReandFo extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPickerReandFo({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.year + 493);
    setMiddleIndex(1);
    setRightIndex(1);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= currentTime.year + 443 && index < currentTime.year + 543) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 1 && index < 13) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (currentMiddleIndex() == 1 ||
        currentMiddleIndex() == 3 ||
        currentMiddleIndex() == 5 ||
        currentMiddleIndex() == 7 ||
        currentMiddleIndex() == 8 ||
        currentMiddleIndex() == 10 ||
        currentMiddleIndex() == 12) {
      if (index >= 1 && index < 32) {
        return digits(index, 2);
      } else {
        return null;
      }
    } else if (currentMiddleIndex() == 2) {
      if (index >= 1 && index < 30) {
        return digits(index, 2);
      } else {
        return null;
      }
    } else {
      if (index >= 1 && index < 31) {
        return digits(index, 2);
      } else {
        return null;
      }
    }
  }

  @override
  String leftDivider() {
    return "/";
  }

  @override
  String rightDivider() {
    return "/";
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            // currentTime.year,
            // currentTime.month,
            // currentTime.day,
            currentLeftIndex() - 543,
            currentMiddleIndex(),
            currentRightIndex())
        : DateTime(
            // currentTime.year,
            // currentTime.month,
            // currentTime.day,
            currentLeftIndex() - 543,
            currentMiddleIndex(),
            currentRightIndex());
  }
}
