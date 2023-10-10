import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/models/news/news_model.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/custom_ui.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

double _fontsizeapps = 1.0;

class NewsDetail extends StatefulWidget {
  final Param param;
  final NewsModel newdata;

  const NewsDetail({super.key, required this.newdata, required this.param});

  @override
  NewsDetailState createState() => NewsDetailState();
}

class NewsDetailState extends State<NewsDetail> {
  String kHtml = '''  ''';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.param.fontsizeapps;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.newsLg('news', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: Stack(
        children: [
          Container(
            decoration: MyClass.backGround(),
            child: SafeArea(
              child: Column(
                children: [
                  lineSizedBox(context, -15),
                  CustomUI.appbarDetailUi('assets/imgs/new.png', context),
                  lineSizedBox(context, -15),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: paddinglist(context, 0),
                          right: paddinglist(context, 0)),
                      child: _detail(),
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

  Widget _detail() => Scrollbar(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 0),
          separatorBuilder: (context, index) => Divider(
            color: MyColor.color('linelist'),
          ),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(
                  left: paddinglist(context, -5),
                  right: paddinglist(context, -5)),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: MyColor.color('LineColor'), width: 8)),
                  color: MyColor.color('SettingBackground'),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.newdata.question2.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataHeadTitleCTxt(
                            context, 3, 'TxtBl'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Image.network(
                          '${MyClass.hostApp()}${widget.newdata.nphoto.toString()}',
                          height: displayHeight(context) * 0.2,
                          width: displayWidth(context) * 1,
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(
                              url:
                                  '${MyClass.hostApp()}${widget.newdata.nphoto}',
                            );
                          }));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: HtmlWidget(
                        '''${widget.newdata.note}''',
                        textStyle: CustomTextStyle.defaultTxt(context, -2),
                        customStylesBuilder: (element) {
                          if (element.classes.contains('')) {
                            return {'color': 'red'};
                          }
                          return null;
                        },
                      ),
                    ),
                    widget.newdata.ndata != null
                        ? widget.newdata.ndata != ''
                            ? _checkloadfile()
                            : const Padding(
                                padding: EdgeInsets.all(8),
                              )
                        : const Padding(
                            padding: EdgeInsets.all(8),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  Padding _checkloadfile() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {
              _launchURL(
                  '${MyClass.hostApp()}' + widget.newdata.ndata.toString()),
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.5, color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.file_download,
                    color: Colors.black,
                  ),
                  Text(
                    Language.newsLg('load', widget.param.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, 1),
                  ),
                ],
              ),
            ),
          ),
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

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
