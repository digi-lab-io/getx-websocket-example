import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/home_controller.dart';

import 'detail_v2.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${homeController.count}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () {
                homeController.increment();
              },
              child: Text("count++"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => DetailScreenV2());
              },
              child: Text("Go to details page"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
