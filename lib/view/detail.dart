import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/user_data_profile.controller_v2.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class DetailScreen extends GetWidget<UserDataProfileControllerV2> {
  final logger = LoggingService().logger;

  @override
  Widget build(BuildContext context) {
    logger.v('DetailScreen 1.1');
    controller.fetchData();
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            if (controller.status() == Status.loading) {
              return Text('Loading ...');
            } else {
              return Text(controller.data().name);
            }
          }),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          const style = TextStyle(fontSize: 24);
          if (controller.status() == Status.loading) {
            return Center(child: Text('Loading ...', style: style));
          } else {
            return Center(
                child: Text(
              controller.data().email,
              style: style,
            ));
          }
        }));
  }
}
