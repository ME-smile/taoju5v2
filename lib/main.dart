/*
 * @Description: app入口
 * @Author: iamsmiling
 * @Date: 2020-12-15 12:05:52
 * @LastEditTime: 2021-01-12 22:36:05
 */

import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';

import 'app/app.dart';
import 'app/app_initializer.dart';

void main() async {
  await AppInitializer.init();
  return FlutterBugly.postCatchedException(() {
    runApp(App());
  });
}

// void main() {
//   runApp(FairApp(
//     child: MyApp(),
//     delegate: {
//       'home_page': (_, data) => MyHomePageDelegate(),
//     },
//   ));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: FairWidget(
//         name: 'home_page',
//         path: 'http://buyi.taoju5.com/lib_home_page.fair.json',
//         data: {
//           'title': 'Flutter Demo Home Page',
//         },
//       ) /*MyHomePage(title: 'Flutter Demo Home Page')*/,
//     );
//   }
// }
