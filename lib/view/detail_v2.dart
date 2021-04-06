import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_websocket_example/model/user-data-profile.entity.dart';
import 'package:getx_websocket_example/services/data.service_v2.dart';
import 'package:getx_websocket_example/services/logging.service.dart';
import 'package:rx_widgets/rx_widgets.dart';

class DetailScreenV2 extends GetWidget<DataServiceV2> {
  final logger = LoggingService().logger;

  @override
  Widget build(BuildContext context) {
    logger.v('DetailScreen 1.1');
    controller.fetchUserDataProfile();
    return Scaffold(
        appBar: AppBar(
          title: ReactiveBuilder<UserDataProfile>(
            stream: controller.userDataProfile.stream,
            builder: (BuildContext context, data) {
              return Text(data.name);
            },
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ReactiveBuilder<UserDataProfile>(
          stream: controller.userDataProfile.stream,
          builder: (BuildContext context, data) {
            return Center(
              child: Text(
                data.email,
                style: TextStyle(fontSize: 24),
              ),
            );
          },
        ));
  }
}
