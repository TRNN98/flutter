import 'package:mwasc/FollowMe/pages/intro/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:mwasc/root/tabs.dart';

void main() {
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#ffffff'),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      locale: Locale('th', 'TH'),
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('th', 'TH'), // Thai
      ],
      title: 'PKB App Base',
      home: Splash(),
      // home: Text('data'),
      // routes: _route,
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Init.instance.initialize(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//         return const MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Splash());
//         } else {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             localizationsDelegates: [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             locale: Locale('th', 'TH'),
//             supportedLocales: [
//               const Locale('en', 'US'), // English
//               const Locale('th', 'TH'), // Thai
//             ],
//             title: 'PKB App Base',
//             home: Pins(),
//             // home: Text('data'),
//             // routes: _route,
//           );
//         }
//       },
//     );
//   }
// }
//
// class Init {
//   Init._();
//
//   static final instance = Init._();
//
//   Future initialize() async {
//     // This is where you can initialize the resources needed by your app while
//     // the splash screen is displayed.  Remove the following example because
//     // delaying the user experience is a bad design practice!
//     await Future.delayed(const Duration(seconds: 3));
//   }
// }


