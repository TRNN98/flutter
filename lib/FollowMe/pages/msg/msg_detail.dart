import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../class/custom_ui.dart';
import '../../class/language.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../models/news/msg_model.dart';
import '../../services/network.dart';
import '../auth/pins.dart';

class MsgDetail extends StatefulWidget {
  final MsgModel msgdata;
  final String photoMobile;
  final Param param;

  const MsgDetail({
    super.key,
    required this.msgdata,
    required this.photoMobile,
    required this.param,
  });
  @override
  MsgDetailState createState() => MsgDetailState();
}

class MsgDetailState extends State<MsgDetail> {
  String kHtml = '''  ''';
  Future<void> _updateMsgStatusdel(membership, seq) async {
    var objMsgStatus =
        '{"mode": "6","membership_no":"${membership.toString()}","system_datetime":"${seq.toString()}"}';
    await Network.fetchMsgStatusdel(objMsgStatus, widget.param.token, context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _updateMsgStatusdel(widget.param.membershipNo, widget.msgdata.seq);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.msgLg('msg', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.04,
            ),
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    lineSizedBox(context, -15),
                    CustomUI.appbarDetailUi('assets/imgs/new.png', context),
                    lineSizedBox(context, -15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: MyColor.color('LineColor'), width: 5)),
                        color: MyColor.color('datatitle'),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                widget.msgdata.title!,
                                textAlign: TextAlign.center,
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.param.fontsizeapps),
                                style: CustomTextStyle.dataBoldTxt(context, 5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.msgdata.message!,
                              textAlign: TextAlign.center,
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.defaultpdpaTxt(context, 0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomUI.appbarTxtTitleUi(Language.msgLg('msg', widget.param.lgs),
              widget.param.fontsizeapps, context),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String url;

  const DetailScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: NetworkImage(url),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
