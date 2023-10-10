import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/pages/settings/security/checksecurity.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Security extends StatefulWidget {
  final Param param;

  const Security(this.param, {super.key});

  @override
  SecurityState createState() => SecurityState();
}

class Securitys {
  String? title;
  int? type;
  String? description;

  Securitys({this.title, this.description, this.type});
}

var imgprofile = '';

class SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membershipNo}.jpg';
    _fontsizeapps = widget.param.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<Securitys> securitys = <Securitys>[
      Securitys(
          title: Language.settingLg('changePin', widget.param.lgs),
          description: Language.settingLg('changePindesc', widget.param.lgs),
          type: 0),
      Securitys(
          title: Language.settingLg('forgotPassword', widget.param.lgs),
          description:
              Language.settingLg('forgotPassworddesc', widget.param.lgs),
          type: 1),
      Securitys(
          title: Language.settingLg('deactivate', widget.param.lgs),
          description: Language.settingLg('deactivatedesc', widget.param.lgs),
          type: 2),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(
          Language.settingLg('passwordSecurity', widget.param.lgs),
          widget.param.fontsizeapps,
          context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.03),
                    child: CustomUI.appbarDetailUiPro1(imgprofile, context),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.175),
                    child:
                        _genmemu(security: securitys, tabletMode: tabletMode),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView _genmemu({security, tabletMode}) => ListView.builder(
        itemCount: security.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checksecurity(
                    type: security[index].type.toString(),
                    param: widget.param,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 10, right: 10, bottom: 5),
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Card(
                    elevation: 0,
                    color: MyColor.color('SettingBackground'),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: MyColor.color('LineColor'),
                                    width: 8))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    security[index].title,
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style:
                                        CustomTextStyle.settingTxt(context, 0),
                                  ),
                                  Text(
                                    security[index].description,
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style:
                                        CustomTextStyle.settingTxt(context, -3),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: iconnext(context, 0),
                                    color: MyColor.color('buttonnext'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
