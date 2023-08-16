import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/class/widget.dart';
import 'package:udtscc/FollowMe/models/news/msg_model.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

import 'msg_detail.dart';

class Msgs extends StatefulWidget {
  final Param param;
  final String groupID;

  const Msgs({super.key, required this.param, required this.groupID});

  @override
  MsgsState createState() => MsgsState();
}

class MsgsState extends State<Msgs> {
  Future<void> _insertMsgStatus(groupid, id) async {
    var objMsgStatus =
        '{"mode": "6","message_type":"$groupid","system_datetime":"$id"}';
    await Network.fetchMsgStatus(objMsgStatus, widget.param.token, context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var objMsg = '{"mode": "2"}';
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.msgLg('msg', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.025),
                    child:
                        CustomUI.appbarDetailUi('assets/imgs/new.png', context),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: displayHeight(context) * (tabletMode ? 0.2 : 0.15),
                      right: displayWidth(context) * 0.04,
                      left: displayWidth(context) * 0.04,
                    ),
                    // child: _getnew(news1: new12, tabletMode: tabletMode),
                    child: FutureBuilder<List<MsgModel>>(
                      future:
                          Network.fetchMsg(objMsg, widget.param.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isNotEmpty
                              ? _getmsg(msg: snapshot.data)
                              : MyWidget.nodata(widget.param.lgs, context);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return MyClass.loading();
                      },
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

  Widget _getmsg({msg}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(color: MyColor.color('LineColor'), width: 4)),
        color: MyColor.color('datatitle'),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: msg.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              if (msg[index].type == "member") {
                _insertMsgStatus(msg[index].memberRef, msg[index].seq);
              } else {
                _insertMsgStatus(msg[index].memberRef, msg[index].seq);
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MsgDetail(
                    msgdata: msg[index],
                    param: widget.param,
                    photoMobile: msg[index].photoMobile,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.fiber_manual_record,
                          color: msg[index].status == '1'
                              ? Colors.grey
                              : Colors.red,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg[index].title,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style:
                                    CustomTextStyle.dataHTxt(context, 1, 'Go'),
                              ),
                              Text(
                                msg[index].message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, -2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: iconnext(context, 0),
                              color: MyColor.color('Go'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
