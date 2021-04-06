import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/services/data.service_v2.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class DetailScreenV1 extends GetWidget<DataServiceV2> {
  final logger = LoggingService().logger;

  @override
  Widget build(BuildContext context) {
    logger.v('DetailScreen 1.1');
    controller.fetchUserDataProfile();
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            if (controller.userDataProfileStatus() == Status.loading) {
              return Text('Loading ...');
            } else {
              return Text(controller.userDataProfile().name);
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
          if (controller.userDataProfileStatus() == Status.loading) {
            return Center(child: Text('Loading ...', style: style));
          } else {
            return Center(
                child: Text(
              controller.userDataProfile().email,
              style: style,
            ));
          }
        }));
  }
}
