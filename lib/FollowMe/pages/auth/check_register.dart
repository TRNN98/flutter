import 'package:mwasc/FollowMe/pages/auth/login.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/pages/auth/reandfo.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

class Checkregister extends StatefulWidget {
  final String? title;
  final String? lgs;
  const Checkregister({super.key, this.title, this.lgs});
  @override
  CheckregisterState createState() => CheckregisterState();
}

class CheckregisterState extends State<Checkregister> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String user = '';

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    title = widget.title!;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGroundAuth(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.01
                        : displayHeight(context) * 0.01,
                  ),
                  CustomUI.appbarBackgroundUi(context),
                  CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
                  Container(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.01),
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Text(
                                MyClass.company('th'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, 7, "bl2", 2),
                              ),
                              Text(MyClass.company('th'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, 7, 'bl')),
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                MyClass.company('en'),
                                textScaleFactor: MyClass.fontSizeApp(),
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.defaultTxtPaint(
                                    context, -2, "bl2", 2),
                              ),
                              Text(MyClass.company('en'),
                                  textScaleFactor: MyClass.fontSizeApp(),
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.dataHeadTitleCTxt(
                                      context, -2, 'bl')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: tabletMode
                        ? displayHeight(context) * 0.055
                        : displayHeight(context) * 0.055,
                  ),
                  Center(
                    child: Text(
                      title == "ลงทะเบียนเปิดใช้งาน"
                          ? Language.loginLg('newRegis', "th")
                          : Language.loginLg('forgotPassword', "th"),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleCTxt(
                          context, 8, 'TxtBlue'),
                    ),
                  ),
                  Center(
                    child: Text(
                      title == "ลงทะเบียนเปิดใช้งาน"
                          ? Language.loginLg('newRegis', "en")
                          : Language.loginLg('forgotPassword', "en"),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleCTxt(
                          context, -1, 'TxtBlue'),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: tabletMode ? 60 : 30,
                              right: tabletMode ? 60 : 30,
                              top: 20,
                              bottom: 0),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              textScaleFactor: MyClass.fontSizeApp(),
                            ),
                            child: TextFormField(
                              style: CustomTextStyle.defaultTxt(context, 0),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Opacity(
                                  opacity: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.visibility,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                prefixIcon: Icon(Icons.account_circle,
                                    size: tabletMode ? 40 : 30),
                                labelText:
                                    Language.loginLg('member', widget.lgs),
                                labelStyle: TextStyle(
                                    color: MyColor.color(
                                        'TextFormFieldTextStyle')),
                                border: const OutlineInputBorder(),
                                errorStyle: CustomTextStyle.defaultTxt1(
                                    context, -4, 'R'),
                              ),
                              validator: (String? value) {
                                return _validatUser(value);
                                // return null;
                              },
                              onSaved: (String? value) {
                                user = MyClass.genmember(value);
                              },
                            ),
                          ),
                        ),
                        lineSizedBox(context, -10),
                        hSizedBoxButton(context, 0),
                        _onSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validatUser(String? value) {
    if (value!.isEmpty) {
      return Language.loginLg('memberDetail', widget.lgs);
    }
  }

  Widget _onSubmit() {
    return Column(
      children: [
        Container(
          width: displayWidth(context) * 0.85,
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
            onTap: _submit,
            child: Center(
              child: Text(
                Language.loginLg('checkInformation', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.loginBoldTxt(context, -3, 'TxtBl'),
              ),
            ),
          ),
        ),
        hSizedBoxButton(context, 0),
        Container(
          width: displayWidth(context) * 0.85,
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: MyColor.color('w'),
          ),
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Login(
                    lgs: widget.lgs,
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                Language.loginLg('cancel', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.loginBoldTxt(context, -3, 'R'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        barrierDismissible: false,
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return MyClass.loading();
        },
      );

      if (title == Language.loginLg('forgotPassword', widget.lgs)) {
        var objAuth = '{"pass":"","mode": "1","membership_no":"$user"}';
        Network.fetchAuth(objAuth).then((value) => {
              _oncheckfo(value),
            });
      } else {
        var objAuth = '{"pass":"","mode": "2","membership_no":"$user"}';
        Network.fetchAuthReg(objAuth).then((value) => {
              _oncheckre(value),
            });
      }
    } else {}
  }

  _oncheckfo(value) {
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      if (MyClass.json(value)[0]['member_status_code'].toString() != '3') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Reandfo(
                title: title,
                sex: MyClass.json(value)[0]['sex'].toString(),
                member: user,
                idcard: MyClass.json(value)[0]['id_card'].toString(),
                brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
                lgs: widget.lgs,
                name: MyClass.json(value)[0]['member_name'].toString(),
                lastName: MyClass.json(value)[0]['member_surname'].toString()),
          ),
        );
      } else {
        Navigator.pop(context);
        MyClass.showToast('ไม่มีทะเบียนสมาชิก');
      }
    } else {
      Navigator.pop(context);
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }

  _oncheckre(value) {
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      if (MyClass.json(value)[0]['member_status_code'].toString() != '3') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Reandfo(
                title: title,
                sex: MyClass.json(value)[0]['sex'].toString(),
                member: user,
                idcard: MyClass.json(value)[0]['id_card'].toString(),
                brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
                lgs: widget.lgs,
                name: MyClass.json(value)[0]['member_name'].toString(),
                lastName: MyClass.json(value)[0]['member_surname'].toString()),
          ),
        );
      } else {
        Navigator.pop(context);
        MyClass.showToast('ไม่มีทะเบียนสมาชิก');
      }
    } else {
      Navigator.pop(context);
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }
}
