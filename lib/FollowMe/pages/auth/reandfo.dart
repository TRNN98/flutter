import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mwasc/FollowMe/class/custom_date_picker_reandfo.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/id_card_formatter.dart';
import 'package:mwasc/FollowMe/pages/auth/check_register.dart';
import 'package:mwasc/FollowMe/pages/auth/login.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

import '../../class/language.dart';
import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';

String lgs1 = '';
String xxx = '';
final format = DateFormat("y-MMM-d");
var txtUser = TextEditingController();
// var txtDate = '';
var txtDate = TextEditingController();

// TextEditingController txtDate;
class UserReFo {
  UserReFo() {
    user = '';
    idcard = '';
    date = '';
    password = '';
    conPassword = '';
    name = '';
    lastName = '';
  }

  String? user;
  String? idcard;
  String? date;
  String? password;
  String? conPassword;
  String? name;
  String? lastName;
}

UserReFo userrefo = UserReFo();

class Reandfo extends StatefulWidget {
  final String? title;
  final String? sex;
  final String? member;
  final String? idcard;
  final String? brithDate;
  final String? lgs;
  final String? name;
  final String? lastName;

  const Reandfo(
      {super.key,
      this.title,
      this.sex,
      this.member,
      this.idcard,
      this.brithDate,
      this.lgs,
      this.name,
      this.lastName});

  @override
  ReandfoState createState() => ReandfoState();
}

class ReandfoState extends State<Reandfo> {
  final _formKey = GlobalKey<FormState>();

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late DateTime dateTime;
  late Duration duration;

  // text = 'Your initial value';
  String imgprofile = '';

  @override
  void initState() {
    txtDate = TextEditingController()..text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool platformandroid = MyClass.checkPlatform();
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // lgs1 = widget.lgs;
    txtUser = TextEditingController()..text = widget.member.toString();
    if (widget.sex == 'M') {
      imgprofile = 'assets/image/logo.png';
    } else {
      imgprofile = 'assets/image/logo.png';
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 25),
              child: Column(),
            ),
            Container(
              height: double.infinity,
              decoration: MyClass.backGroundAuth(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode
                          ? displayHeight(context) * 0.25
                          : displayHeight(context) * 0.08,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.title.toString() == 'ลงทะเบียนเปิดใช้งาน'
                                  ? Language.reandfo("regis", "th")
                                  : Language.reandfo("forget", "th"),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.TitleTxt(
                                  context, 16, 'TxtBlue'),
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.title.toString() == 'ลงทะเบียนเปิดใช้งาน'
                                  ? Language.reandfo("regis", "en")
                                  : Language.reandfo("forget", "en"),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.TitleTxt(
                                  context, 0, 'TxtBlue'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, left: 35),
                            child: Text(
                              Language.loginLg('member', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.boldTxt(context, 0),
                            ),
                          ),
                          _user(txtUser, context, widget.lgs),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                              Language.loginLg('idCard', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.boldTxt(context, 0),
                            ),
                          ),
                          _idCard(context, widget.lgs),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, bottom: 20),
                            child: Text(
                                Language.loginLg('idCardDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -2, 'R')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                              Language.loginLg('birthday', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.boldTxt(context, 0),
                            ),
                          ),
                          _date(txtDate, context, widget.lgs),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, bottom: 20),
                            child: Text(
                                Language.loginLg('birthDayDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -2, 'R')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                              Language.loginLg('password', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.boldTxt(context, 0),
                            ),
                          ),
                          _password(context, widget.lgs),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, bottom: 20),
                            child: Text(
                                Language.loginLg('passwordDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -2, 'R')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                              Language.pinLg('confirmPasswords', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.boldTxt(context, 0),
                            ),
                          ),
                          _confpassword(context, widget.lgs),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                                Language.loginLg('passwordDetail', widget.lgs),
                                textScaleFactor: MyClass.fontSizeApp(),
                                style: CustomTextStyle.defaultTxt1(
                                    context, -2, 'R')),
                          ),
                          lineSizedBox(context, 0),
                          _onLogin(widget.title, context),
                          lineSizedBox(context, 0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomUI.appbarBackgroundUi(context),
            // CustomUI.appbarTxtTitleUi(Language.loginLg(widget.title, widget.lgs), context),
            //CustomUI.appbarDetailUi1(imgprofile, context),
          ],
        ),
      ),
    );
  }

  Widget dateImg(context) {
    return TextButton(
        onPressed: () {
          setState(() async {
            DateTime? newDateTime = await DatePicker.showDatePicker(
              context,
              locale: LocaleType.th,
              minTime: DateTime((DateTime.now().year + 543) - 100),
              maxTime: DateTime(DateTime.now().year + 543),
            );
            if (newDateTime != null) {
              String date = '';
              date =
                  '${newDateTime.day.toString()}/${newDateTime.month.toString()}/${newDateTime.year.toString()}';
              txtDate = TextEditingController()..text = date;
            }
            setState(() {});
          });
        },
        child: Image.asset("assets/imgs/date.png"));
  }

  Widget _onLogin(title, context) {
    return Row(
      children: [
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.35,
          height: displayHeight(context) * 0.055,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: Colors.white),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Checkregister(title: title, lgs: lgs1),
                ),
              );
            },
            child: Center(
              child: Text(
                Language.loginLg('cancel', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.loginBoldTxt(context, -5, 'R'),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(''),
        ),
        Container(
          width: displayWidth(context) * 0.35,
          height: displayHeight(context) * 0.055,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              colors: <Color>[
                MyColor.color('bl1'),
                MyColor.color('bl3'),
              ],
            ),
          ),
          child: InkWell(
            onTap: _submit,
            child: Center(
              child: Text(
                Language.loginLg('save', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.loginBoldTxt(context, -5, 'TxtBl'),
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.idcard != userrefo.idcard) {
        MyClass.showToast(Language.loginLg('invalidIDCard', widget.lgs));
      } else if (userrefo.password != userrefo.conPassword) {
        MyClass.showToast(Language.loginLg('invalidConPassword', widget.lgs));
      } else if (MyClass.formatDate(userrefo.date) != widget.brithDate) {
        MyClass.showToast(Language.loginLg('invalidBirthday', widget.lgs));
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          useRootNavigator: false,
          builder: (BuildContext context) {
            return MyClass.loading();
          },
        );
        if (widget.title == Language.loginLg('memberRegis', widget.lgs)) {
          Network.fetchAuthRe(
                  '{"membership_no": "${userrefo.user}","id_card":"${userrefo.idcard}","member_name":"","member_surname":"","date_of_birth":"${MyClass.formatDateC(widget.brithDate)}","mem_password":"${userrefo.password}","password_confirm":"${userrefo.conPassword}"}')
              .then((value) => {
                    _onLoginsRe(value, context, widget.lgs),
                  });
        } else {
          Network.fetchAuthFo(
                  '{"membership_no": "${userrefo.user}","mem_password":"${userrefo.password}","id_card":"${userrefo.idcard}","date_of_birth":"${MyClass.formatDateC(widget.brithDate)}"}')
              .then((value) => {
                    _onLoginsFo(value, context, widget.lgs),
                  });
        }
      }
    }
  }

  Padding _password(context, lgs) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: InputDecoration(
            hintText: Language.loginLg('password', widget.lgs),
            fillColor: Colors.white,
            filled: true,
            labelStyle:
                TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.color('TextFormFieldBorderSide'),
                width: 2.0,
              ),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: _obscureText == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                        size: tabletMode ? 40 : 20,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.blue.shade600,
                        size: tabletMode ? 40 : 20,
                      ),
                onPressed: () {
                  _toggle();
                },
              ),
            ),
          ),
          obscureText: _obscureText,
          validator: (value) {
            _validatPassword(value);
            return null;
          },
          onSaved: (value) {
            userrefo.password = value;
          },
        ),
      ),
    );
  }

  Padding _confpassword(context, lgs) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: MyClass.fontSizeApp(),
        ),
        child: TextFormField(
          textAlign: TextAlign.center,
          style: CustomTextStyle.defaultpdpaTxt(context, 0),
          decoration: InputDecoration(
            hintText: Language.pinLg('confirmPasswords', widget.lgs),
            fillColor: Colors.white,
            filled: true,
            labelStyle:
                TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.color('TextFormFieldBorderSide'),
                width: 2.0,
              ),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: _obscureText == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                        size: tabletMode ? 40 : 20,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.blue.shade600,
                        size: tabletMode ? 40 : 20,
                      ),
                onPressed: () {
                  _toggle();
                },
              ),
            ),
          ),
          obscureText: _obscureText,
          validator: (value) {
            _validatConPassword(value);
            return null;
          },
          onSaved: (value) {
            userrefo.conPassword = value;
          },
        ),
      ),
    );
  }
}

_onLoginsRe(value, context, lgs) {
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      Navigator.pop(context);
      _showAlert(Language.loginLg('regisok', "th"), context, lgs);
    } else {
      Navigator.pop(context);
      MyClass.showToast(Language.loginLg('registrationFailed', lgs));
    }
  } catch (e) {
    Navigator.pop(context);
    MyClass.showToast(Language.loginLg('registrationFailed', lgs));
  }
}

_onLoginsFo(value, context, lgs) {
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      Navigator.pop(context);
      _showAlert(Language.loginLg('forgetok', "th"), context, lgs);
    } else {
      Navigator.pop(context);
      MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
    }
  } catch (e) {
    Navigator.pop(context);
    MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
  }
}

_validatPassword(value) {
  if (value.isEmpty) {
    return Language.loginLg('pleaseYourpassword', lgs1);
  } else if (value.length <= 5) {
    return Language.loginLg('passwordDetail', lgs1);
  }
}

_validatConPassword(value) {
  if (value.isEmpty) {
    return Language.loginLg('pleaseConfirmPassword', lgs1);
  } else if (value.length <= 5) {
    return Language.loginLg('passwordDetail', lgs1);
  }
}

Padding _user(txtUser, context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 10),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        controller: txtUser,
        enabled: false,
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          // labelText: Language.loanLg('member', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          _validatUser(value);
          return null;
        },
        onSaved: (value) {
          userrefo.user = MyClass.genmember(value);
        },
      ),
    ),
  );
}

_validatUser(value) {
  if (value.isEmpty) {
    return Language.loginLg('memberDetail', lgs1);
  }
}

Padding _idCard(context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(17),
          IdCardFormatter()
        ],
        textAlign: TextAlign.center,
        // maxLength: 13,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        // keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: Language.loginLg('idCardFormat', lgs),
          fillColor: Colors.white,
          filled: true,
          // labelText: Language.loginLg('idCard', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          _validatIdCard(value);
          return null;
        },
        onSaved: (value) {
          userrefo.idcard = value.toString().replaceAll('-', '');
        },
      ),
    ),
  );
}

_validatIdCard(value) {
  if (value.isEmpty) {
  } else if (value.length <= 12) {
    return Language.loginLg('idCardDetail', lgs1);
  }
}

Padding _date(txtDate, context, lgs) {
  bool tabletMode = MediaQuery.of(context).size.width > 600;
  return Padding(
    padding: tabletMode
        ? const EdgeInsets.only(left: 60, right: 60)
        : const EdgeInsets.only(left: 30, right: 30),
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
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultpdpaTxt(context, 0),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "xx/xx/xxxx",
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          _validatDate(value);
          return null;
        },
        onSaved: (value) {
          userrefo.date = value;
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

_showAlert(msg, context, lgs) {
  Alert(
    context: context,
    type: AlertType.success,
    style: AlertStyle(descStyle: CustomTextStyle.dataHeadTitleTxt(context, 3)),
    title: "",
    desc: msg,
    onWillPopActive: true,
    useRootNavigator: false,
    closeIcon: const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    // closeFunction: ,
    buttons: [
      DialogButton(
        onPressed: () => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login(lgs: lgs)),
              (Route<dynamic> route) => false)
        },
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('bl1'),
            MyColor.color('bl3'),
          ],
        ),
        child: Text(
          "ปิด",
          style: CustomTextStyle.loginBoldTxt(context, -8, 'TxtBl'),
        ),
      ),
    ],
  ).show();
}
