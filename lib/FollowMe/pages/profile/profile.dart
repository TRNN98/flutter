import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:udtscc/FollowMe/models/profile/info_model.dart';
import 'package:udtscc/FollowMe/pages/auth/pins.dart';
import 'package:udtscc/FollowMe/class/custom_ui.dart';
import 'package:udtscc/FollowMe/class/language.dart';
import 'package:udtscc/FollowMe/class/myclass.dart';
import 'package:udtscc/FollowMe/class/mycolor.dart';
import 'package:udtscc/FollowMe/class/sizes.dart';
import 'package:udtscc/FollowMe/class/textstyle.dart';
import 'package:udtscc/FollowMe/services/network.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  final Param param;
  const Profile(this.param, {super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late File _image;

  late String base64Image;

  final picker = ImagePicker();

  startUpload() async {
    String fileName = _image.path.split('/').last;
    await upload(fileName);
  }

  Future upload(String fileName) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/upload');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var data =
        '{"image": "$base64Image", "name": "${widget.param.membershipNo}"}';
    String jsons = json.encode(data);
    await http.post(url, headers: headers, body: json.decode(jsons));
    setState(() {});
  }

  Future getcamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    editimg(File(pickedFile!.path));
  }

  Future getgallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    editimg(File(pickedFile!.path));
  }

  Future editimg(img) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: img.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedFile != null) {
      _image = File(croppedFile.path);
      setState(() {
        base64Image = base64Encode(File(croppedFile.path).readAsBytesSync());
        showimg();
      });
    } else {
      _image = File(img.path);
      setState(() {
        base64Image = base64Encode(File(img.path).readAsBytesSync());
        showimg();
      });
    }
  }

  var objInfo = '{"mode": "1"}';

  late String imgprofile;

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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    imgprofile =
        '${MyClass.hostApp()}/public/member/profile/${widget.param.membershipNo}.jpg';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomUI.appbarUi(Language.profileLg('profile', widget.param.lgs),
          widget.param.fontsizeapps, context),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: SafeArea(
                child: Column(
                  children: [
                    lineSizedBox(context, -10),
                    GestureDetector(
                      onTap: () {
                        showd();
                      },
                      child: Stack(
                        children: [
                          CustomUI.appbarDetailUiPro1(imgprofile, context),
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(
                                top: displayHeight(context) * 0.06,
                                left: displayWidth(context) * 0.15),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: displayHeight(context) * 0.05,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CustomUI.headprofile(context, widget.param.lgs,
                          widget.param.fontsizeapps, widget.param.name),
                    ),
                    lineSizedBox(context, -30),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: FutureBuilder<List<InfoModel>>(
                          future: Network.fetchInfo(
                              objInfo, widget.param.token, context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _detail(info: snapshot.data);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return MyClass.loading();
                          },
                        ),
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

  void showd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text(
                              Language.profileLg('camera', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getcamera();
                            Navigator.of(context).pop(true);
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                              Language.profileLg('gallery', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getgallery();
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  void showimg() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child:
                          // _image == null
                          //     ? Text('No image selected.',
                          //         textScaleFactor: MyClass.blocFontSizeApp(
                          //             widget.param.fontsizeapps),
                          //         style: CustomTextStyle.dataBoldTxt(context, -1))
                          //     :
                          CircleAvatar(
                        radius: 55,
                        backgroundColor: MyColor.color('imgprofile'),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              MemoryImage(base64Decode(base64Image)),
                          // child: Image.file(_image),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          // color: Colors.red,
                          child: Text(
                              Language.profileLg('cancel', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        ElevatedButton(
                          // color: Colors.blue,
                          child: Text(
                              Language.profileLg('upload', widget.param.lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(
                                  widget.param.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            startUpload();
                            Timer(const Duration(milliseconds: 700), () {
                              Navigator.of(context).pop(true);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Pins(gettitle: 'pinCode')),
                                  (Route<dynamic> route) => false);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _detail({info}) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
          color: MyColor.color('datatitle'),
        ),
        child: Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: MyColor.color('linelist'),
            ),
            itemCount: info.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: MyColor.color('LineColor'), width: 4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'member', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].membershipNo.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'idCard', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].idCard.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'position', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].positionName.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'share_stock', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].shareStock.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg('member_group_prename',
                                        widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].memberGroupName.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'salary', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].salaryAmount.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'mem_status', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].memTypeDesc.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'birthday', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].dateOfBirth.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'dateOfMembership', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].dateOfApprove.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'address', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(
                                        info[index].address.toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Language.profileLg(
                                        'phone', widget.param.lgs),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Go'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    MyClass.checkNull(info[index]
                                        .presentTelephone
                                        .toString()),
                                    textScaleFactor: MyClass.blocFontSizeApp(
                                        widget.param.fontsizeapps),
                                    style: CustomTextStyle.dataHTxt(
                                        context, 0, 'Bl'),
                                  ),
                                ),
                              ],
                            ),
                            lineSizedBox(context, -15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
