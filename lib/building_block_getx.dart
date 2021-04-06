import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/detail_binding.dart';
import 'binding/home_binding.dart';
import 'binding/initial_binding.dart';
import 'view/detail.dart';
import 'view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      enableLog: true,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: "/home", page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(name: "/detail", page: () => DetailScreen(), binding: DetailBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
