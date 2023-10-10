import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:mwasc/FollowMe/models/news/news_model.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/class/widget.dart';
import 'package:mwasc/FollowMe/pages/news/news_detail.dart';
import 'package:mwasc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final Param param;
  const News(this.param, {super.key});

  @override
  NewsState createState() => NewsState();
}

class New {
  final String title;
  final String img;

  const New({required this.title, required this.img});
}

class NewsState extends State<News> {
  var objnews = '{"mode": "1"}';
  late ByteData bytes;
  late Uint8List list;

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'ออกจากแอปพลิเคชัน',
              style: CustomTextStyle.dataHTxt(context, 5, 'Bl'),
            ),
            content: Text(
              'คุณต้องการออกจากแอปพลิเคชันหรือไม่',
              style: CustomTextStyle.dataHTxt(context, -1, 'Bl'),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  'ยกเลิก',
                  style: CustomTextStyle.dataHTxt(context, 3, 'B'),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'ตกลง',
                  style: CustomTextStyle.dataHTxt(context, 3, 'R'),
                ),
                onPressed: () {
                  Platform.isIOS
                      ? FlutterExitApp.exitApp(iosForceExit: true)
                      : FlutterExitApp.exitApp();
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    image();
    super.initState();
  }

  void image() async {
    bytes = await rootBundle.load('assets/imgs/icon.png');
    list = bytes.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.newsLg('news', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) *
                            (tabletMode ? 0.025 : 0.025),
                      ),
                      child: CustomUI.appbarDetailUi(
                          'assets/imgs/new.png', context),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) *
                            (tabletMode ? 0.175 : 0.175),
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0),
                        bottom: displayHeight(context) * 0.1,
                      ),
                      // child: _getnew(news1: new12, tabletMode: tabletMode),
                      child: FutureBuilder<List<NewsModel>>(
                        future: Network.fetchNews(
                            objnews, widget.param.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isNotEmpty
                                ? _getnew(news1: snapshot.data)
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
      ),
    );
  }

  _getnew({news1}) => Container(
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: MyColor.color('LineColor'), width: 4)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 25),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: news1.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetail(
                          newdata: news1[index], param: widget.param),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, bottom: 5),
                      child: Row(
                        children: [
                          FadeInImage.memoryNetwork(
                              width: displayHeight(context) * 0.07,
                              height: displayHeight(context) * 0.07,
                              fit: BoxFit.fill,
                              placeholder: list,
                              image:
                                  '${MyClass.hostApp()}${news1[index].nphoto}'),
                          const Text('      '),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news1[index].date,
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 1, 'TxtBlue'),
                                ),
                                Text(
                                  news1[index].question,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textScaleFactor: MyClass.blocFontSizeApp(
                                      widget.param.fontsizeapps),
                                  style: CustomTextStyle.dataHTxt(
                                      context, 0, 'TxtBlue'),
                                ),
                              ],
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
                                  color: MyColor.color('buttonnext'),
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
        ),
      );
}
