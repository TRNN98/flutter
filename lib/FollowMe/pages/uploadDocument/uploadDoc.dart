import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/pages/uploadDocument/uploadDropdown.dart';

import '../../class/custom_ui.dart';
import '../../class/language.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../auth/pins.dart';

double _fontsizeapps = 1.0;
int checkpage = 0;
int textSelect = 0;
String lgs1 = '';
String xxx = '';
String? selectedValue;
final List<String> typeItems = [
  'ชำระหนี้ - เงินกู้พิเศษ1',
  'ชำระหนี้ - เงินกู้พิเศษ2',
];

var txtDate = TextEditingController();
var txtTime = TextEditingController();
final format = DateFormat("y-MMM-d");
var txtUser = TextEditingController();

class UploadDoc extends StatefulWidget {
  Param param;
  UploadDoc(this.param, {super.key});

  @override
  State<UploadDoc> createState() => _UploadDocState();
}

class _UploadDocState extends State<UploadDoc> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.UploadDoc('UploadDocument', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  // CustomUI.appbarDetailUi('assets/imgs/uploadDoc.png', context),
                  lineSizedBox(context, -15),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _detail(widget.param.membershipNo,
                          widget.param.name, context, widget.param.lgs)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset.fromDirection(1, 3),
                  blurRadius: 3,
                  spreadRadius: 2)
            ],
          ),
          margin: EdgeInsets.all(10),
          child: Container(
            width: displayWidth(context) * 0.7,
            height: displayHeight(context) * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  MyColor.color('bl1'),
                  MyColor.color('bl3'),
                ],
              ),
            ),
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                _showAlert('อัพโหลดหลักฐานสำเร็จ', context, widget.param.lgs);
              },
              child: Center(
                child: Text(
                  'ส่งข้อมูล',
                  textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                  style: CustomTextStyle.loginBoldTxt(context, -8, 'TxtBt'),
                ),
              ),
            ),
          )),
    );
  }

  _showAlert(msg, context, lgs) {
    Alert(
      context: context,
      type: AlertType.success,
      style:
          AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 3)),
      title: "",
      desc: msg,
      onWillPopActive: true,
      useRootNavigator: false,
      closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      buttons: [
        DialogButton(
          onPressed: () => {Navigator.of(context).pop()},
          color: MyColor.color('TxtBt'),
          child: Text(
            "ปิด",
            style: CustomTextStyle.loginBoldTxt(context, -8, 'w'),
          ),
        ),
      ],
    ).show();
  }

  Center _detail(member, name, context, lgs) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset.fromDirection(0, 2.0),
                    blurRadius: 6.0,
                    spreadRadius: 1.0)
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: MyColor.color('datatitle'),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('เลือกรายการ',
                        textAlign: TextAlign.start,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHeadTitleTxt(context, 0)),
                  ],
                ),
                lineSizedBox(context, -15),
                Column(children: [
                  // plugin : dropdown_button2
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      fillColor: Colors.red,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    hint: const Text(
                      'เลือกประเภทเงินกู้',
                      style: TextStyle(fontSize: 14),
                    ),
                    items: typeItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'กรุณาเลือกประเภทเงินกู้';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ]),
                lineSizedBox(context, -10),
                Row(
                  children: <Widget>[
                    const Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.black,
                          endIndent: 2,
                          height: 5,
                          thickness: 1,
                        )),
                    Expanded(
                        flex: 2,
                        child: Text('กรอกรายละเอียด',
                            textAlign: TextAlign.center,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style:
                                CustomTextStyle.dataHeadTitleTxt(context, 0))),
                    const Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.black,
                          endIndent: 2,
                          height: 5,
                          thickness: 1,
                        )),
                  ],
                ),
                lineSizedBox(context, -10),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("   วันที่ทำธุรกรรม",
                                textAlign: TextAlign.center,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 0)),
                            _date(txtDate, context, widget.param.lgs),
                          ],
                        )),
                    Text('     '),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text("เวลาที่ทำรายการ",
                                textAlign: TextAlign.end,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHeadDataTxt(
                                    context, 0)),
                            _time(txtTime, context, widget.param.lgs),
                          ],
                        )),
                  ],
                ),
                lineSizedBox(context, -10),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("   อัพโหลดไฟล์",
                                textAlign: TextAlign.center,
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, 0)),
                            _upload(txtDate, context, widget.param.lgs),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _date(txtDate, context, lgs) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          onTap: () async {
            DateTime? newDateTime = await DatePicker.showDatePicker(
              context,
              locale: LocaleType.th,
              maxTime: DateTime(DateTime.now().year + 543),
              minTime: DateTime((DateTime.now().year + 543) - 100),
            );
            if (newDateTime != null) {
              String date = '';
              date = newDateTime.day.toString() +
                  '/' +
                  newDateTime.month.toString() +
                  '/' +
                  (newDateTime.year - 1).toString();
              // txtDateFrom = TextEditingController()..text = date;
              txtDate.text = date;
            }
          },
          controller: txtDate,
          readOnly: true,
          textAlign: TextAlign.start,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: InputDecoration(
            fillColor: Color(0xFFEFEFEF),
            filled: true,
            hintText: "xx/xx/xxxx",
            suffixIcon: Icon(Icons.date_range),
            labelStyle: TextStyle(color: Color(0xFF6C6C6C)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          validator: (value) {
            return _validatDate(value);
          },
          onSaved: (value) {
            // userrefo.date = value;
          },
        ),
      ),
    );
  }

  _validatDate(value) {
    if (value.isEmpty) {
      return Language.loginLg('birthDayDetail', lgs1);
    }
  }

  Padding _time(txtTime, context, lgs) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          onTap: () async {
            final TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.inputOnly,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      alwaysUse24HourFormat: true,
                    ),
                    child: child!,
                  ),
                );
              },
            );
            if (newTime != null) {
              String formattedTime =
                  '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
              txtTime.text = formattedTime;
            }
          },
          controller: txtTime,
          readOnly: true,
          textAlign: TextAlign.start,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: const InputDecoration(
            fillColor: Color(0xFFEFEFEF),
            filled: true,
            hintText: "xx:xx",
            suffixIcon: Icon(Icons.access_time),
            labelStyle: TextStyle(color: Color(0xFF6C6C6C)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          validator: (value) {
            return _validateTime(value);
          },
          onSaved: (value) {
            // uploadDoc.time = value;
          },
        ),
      ),
    );
  }

  _validateTime(value) {
    if (value.isEmpty) {
      return Language.loginLg('birthDayDetail', lgs1);
    }
  }

  Padding _upload(txtDate, context, lgs) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          onTap: () {},
          controller: txtDate,
          readOnly: true,
          textAlign: TextAlign.start,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: const InputDecoration(
            fillColor: Color(0xFFEFEFEF),
            filled: true,
            hintText: "รูปภาพ หรือไฟล์ PDF",
            suffixIcon: Icon(Icons.photo),
            labelStyle: TextStyle(color: Color(0xFF6C6C6C)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          validator: (value) {
            return value; // _validatDate(value);
          },
          onSaved: (value) {
            // userrefo.date = value;
          },
        ),
      ),
    );
  }

  Container _buttomClick() {
    return Container(
      width: displayWidth(context) * 0.7,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('bl1'),
            MyColor.color('bl3'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            'ส่งข้อมูล',
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.loginBoldTxt(context, -8, 'TxtBt'),
          ),
        ),
      ),
    );
  }
}
