import 'package:mwasc/FollowMe/class/sizes.dart';
import 'package:mwasc/FollowMe/pages/intro/pdpa.dart';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/class/mycolor.dart';
import 'package:mwasc/FollowMe/class/textstyle.dart';
import 'package:mwasc/FollowMe/locals/dblg.dart';
import 'package:mwasc/FollowMe/models/sql/lg_db.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  late Function goToTab;
  late DBLg dBLg;
  LGDb lg = LGDb();

  _insertlg() {
    lg.lg = '0';
    dBLg.initDB().then(
          (x) => {
            dBLg.deleteAll().then((value) => {
                  dBLg.insertLg(lg).then(
                        (l) => {},
                      ),
                })
          },
        );
  }

  @override
  void initState() {
    dBLg = DBLg();
    super.initState();
    _insertlg();
    slides.add(
      Slide(
        title: 'WELCOME&',
        styleTitle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'FC_Lamoon'),
        description: "ยินดีต้อนรับเข้าสู่ระบบ\nบริการสมาชิกแบบออนไลน์&",
        pathImage: "assets/imgs/tuto1.png",
      ),
    );
    slides.add(
      Slide(
        title: "Trustworthy&",
        styleTitle: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'FC_Lamoon'),
        description: "สร้างความมั่นใจในการใช้งานด้วย\nมาตรฐานระบบความปลอดภัย&",
        styleDescription: const TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto2.png",
      ),
    );
    slides.add(
      Slide(
        title: "Faster and Save time&",
        styleTitle: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'FC_Lamoon'),
        description:
            "ดีต่อใจ...สะดวกรวดเร็ว และ \nประหยัดเวลากว่าช่องทางอื่นๆ&",
        styleDescription: const TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto3.png",
      ),
    );
    slides.add(
      Slide(
        title: "Answers and Relevant&",
        styleTitle: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'FC_Lamoon'),
        description: "เป็นมากกว่าโปรแกรมสหกรณ์\nตอบโจทย์ทุกการใช้งานบนมือถือ&",
        styleDescription: const TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto4.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Pdpa(),
      ),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: MyColor.color('slide1'),
      size: 23.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: MyColor.color('slide1'),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: MyColor.color('slide1'),
    );
  }

  List<Widget> renderListCustomTabs(tabletMode) {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.15),
              InkWell(
                  child: Image.asset(
                currentSlide.pathImage!,
                width: tabletMode ? 300 : 200,
                height: tabletMode ? 300 : 200,
                fit: BoxFit.contain,
              )),
              Column(
                children: [
                  Text(
                    currentSlide.title!.split('&')[0],
                    // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.titleIntoTxt(context, -4),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    currentSlide.title!.split('&')[1],
                    // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.titleIntoTxt1(context, -6),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  currentSlide.description!.split('&')[0],
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.titleIntoTxt2(context, -9),
                  // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                currentSlide.description!.split('&')[1],
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.titleIntoTxt3(context, -13),
                // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(MyColor.color('slide2')),
      overlayColor: MaterialStateProperty.all<Color>(MyColor.color('slide1')),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _insertlg();
    return IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: MyColor.color('slide2'),
      colorActiveDot: MyColor.color('slide1'),
      sizeDot: 13.0,
      // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: renderListCustomTabs(tabletMode),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        goToTab = refFunc;
      },

      // Show or hide status bar
      // shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: onTabChangeCompleted,
    );
  }
}
