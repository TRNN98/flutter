import 'package:flutter/material.dart';

import '../../class/myclass.dart';
import '../../class/mycolor.dart';
import '../../class/sizes.dart';
import '../../class/textstyle.dart';
import '../../class/widget.dart';
import '../../models/lock/lock_pin_model.dart';
import '../../services/network.dart';

class LockPin extends StatefulWidget {
  final String user;
  const LockPin({super.key, required this.user});

  @override
  LockPinState createState() => LockPinState();
}

class LockPinState extends State<LockPin> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    var objAuth = '{"pass":"","mode": "6","membership_no":"${widget.user}"}';
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: MyClass.backGroundAuth(),
          child: Column(
            children: [
              tabletMode
                  ? lineSizedBox(context, displayHeight(context) * 0.23)
                  : lineSizedBox(context, displayHeight(context) * 0.23),
              SizedBox(width: displayWidth(context) * 1),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: FutureBuilder<List<LockPinModel>>(
                    future: Network.fetchLockPin(objAuth),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!.isNotEmpty
                            ? _detail(lock: snapshot.data)
                            : MyWidget.nodata('th', context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return MyClass.loading();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.52,
              ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset('assets/imgs/icon.png',
                width: tabletMode
                    ? displayWidth(context) * 0.2
                    : displayWidth(context) * 0.3,
                height: tabletMode
                    ? displayWidth(context) * 0.2
                    : displayWidth(context) * 0.3)),
      ]),
    );
  }

  Widget _detail({lock}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: lock.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lock[index].txt1,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(1.00),
                      style: CustomTextStyle.dataHTxt(context, 4, 'R'),
                    ),
                    Text(
                      lock[index].time,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(1.00),
                      style: CustomTextStyle.dataHTxt(context, 4, 'R'),
                    ),
                    Text(
                      lock[index].txt2,
                      textAlign: TextAlign.center,
                      textScaleFactor: MyClass.blocFontSizeApp(1.00),
                      style: CustomTextStyle.dataHTxt(context, 4, 'R'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
