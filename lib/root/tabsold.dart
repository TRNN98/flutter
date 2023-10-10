import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/FollowMe/class/language.dart';
import 'package:mwasc/FollowMe/pages/deposit/deposit.dart';
import 'package:mwasc/FollowMe/pages/dividend/dividend.dart';
import 'package:mwasc/FollowMe/pages/gain/gain.dart';
import 'package:mwasc/FollowMe/pages/guarantee/guarantee.dart';
import 'package:mwasc/FollowMe/pages/kept/kept.dart';
import 'package:mwasc/FollowMe/pages/loan/loan.dart';
import 'package:mwasc/FollowMe/pages/location/location.dart';
import 'package:mwasc/FollowMe/pages/mainmenu.dart';
import 'package:mwasc/FollowMe/pages/news/news.dart';
import 'package:mwasc/FollowMe/pages/offset/offset.dart';
import 'package:mwasc/FollowMe/pages/profile/profile.dart';
import 'package:mwasc/FollowMe/pages/share/share.dart';
import 'package:flutter/material.dart';

int _selectedPage = 0;

class Tabs extends StatefulWidget {
  final Param param;

  const Tabs(this.param, {super.key});

  @override
  TabsState createState() => TabsState();
}

class TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    final page = [
      MainMenu(widget.param),
      News(widget.param),
      Location(widget.param),
      Profile(widget.param),
    ];
    final route = <String, WidgetBuilder>{
      '/loan': (BuildContext context) => Loan(widget.param),
      '/share': (BuildContext context) => Share(widget.param),
      '/deposit': (BuildContext context) => Deposit(widget.param),
      '/guarantee': (BuildContext context) => Guarantee(widget.param),
      '/kept': (BuildContext context) => Kept(widget.param),
      '/dividend': (BuildContext context) => Dividend(widget.param),
      '/gain': (BuildContext context) => Gain(widget.param),
      '/new': (BuildContext context) => News(widget.param),
      '/offset': (BuildContext context) => Offsets(widget.param),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FC_Ekaluck',
      ),
      routes: route,
      home: Scaffold(
        body: page[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                // icon: Icon(Icons.home),
                // icon: ImageIcon(
                //   AssetImage("assets/imgs/menu1.png"),
                //   color: Colors.transparent,
                // ),
                activeIcon: Tooltip(
                  message: Language.tabsLg('menu', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/menu1.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                icon: Tooltip(
                  message: Language.tabsLg('menu', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/menu2.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                label: ''
                // title: Text(
                //   Language.tabsLg('menu', widget.param.lgs),
                //   textScaleFactor: MyClass.fontSizeApp(),
                //   style: CustomTextStyle.defaultTxt(context, -5),
                // ),

                ),
            BottomNavigationBarItem(
                // icon: Icon(Icons.home),
                // icon: ImageIcon(
                //   AssetImage("assets/imgs/menu1.png"),
                //   color: Colors.transparent,
                // ),
                activeIcon: Tooltip(
                  message: Language.tabsLg('news', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/news1.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                icon: Tooltip(
                  message: Language.tabsLg('menu', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/news2.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                label: ''
                // title: Text(
                //   Language.tabsLg('menu', widget.param.lgs),
                //   textScaleFactor: MyClass.fontSizeApp(),
                //   style: CustomTextStyle.defaultTxt(context, -5),
                // ),

                ),
            BottomNavigationBarItem(
                // icon: Icon(Icons.location_on),
                activeIcon: Tooltip(
                  message: Language.tabsLg('address', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/location1.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                icon: Tooltip(
                  message: Language.tabsLg('address', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/location2.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                label: ''
                // title: Text(
                //   Language.tabsLg('address', widget.param.lgs),
                //   textScaleFactor: MyClass.fontSizeApp(),
                //   style: CustomTextStyle.defaultTxt(context, -5),
                // ),

                ),
            BottomNavigationBarItem(
                // icon: Icon(Icons.people),
                activeIcon: Tooltip(
                  message: Language.tabsLg('profile', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/profile1.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                icon: Tooltip(
                  message: Language.tabsLg('profile', widget.param.lgs),
                  child: Image.asset(
                    "assets/imgs/profile2.png",
                    width: tabletMode ? 55 : 30,
                  ),
                ),
                label: ''
                // title: Text(
                //   Language.tabsLg('profile', widget.param.lgs),
                //   textScaleFactor: MyClass.fontSizeApp(),
                //   style: CustomTextStyle.defaultTxt(context, -5),
                // ),
                ),
          ],
          currentIndex: _selectedPage,
          // selectedItemColor: MyColor.color('tabs'),
          // selectedItemColor:Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
