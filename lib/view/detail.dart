import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/user_data_profile.controller.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class DetailScreen extends StatelessWidget {
  final logger = LoggingService().logger;

  @override
  Widget build(BuildContext context) {
    logger.v('DetailScreen 1.1');
    Get.find<UserDataProfileController>().fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Get.find<UserDataProfileController>().obx((_profile) => Text('' + _profile.uuid), onLoading: Text('Loading ...')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
