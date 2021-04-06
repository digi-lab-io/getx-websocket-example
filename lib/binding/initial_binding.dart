import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/home_controller.dart';
import 'package:getx_websocket_example/controller/user_data_profile.controller_v1.dart';
import 'package:getx_websocket_example/controller/user_data_profile.controller_v2.dart';
import 'package:getx_websocket_example/services/data.service.dart';
import 'package:getx_websocket_example/services/data.service_v2.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class InitialBinding extends Bindings {
  final logger = LoggingService().logger;

  @override
  void dependencies() {
    logger.i("InitialBinding");
    Get.put<DataServiceV1>(DataServiceV1());
    Get.put<DataService2>(DataService2());
    Get.put<UserDataProfileControllerV1>(UserDataProfileControllerV1());
    Get.put<UserDataProfileControllerV2>(UserDataProfileControllerV2());
    Get.put<HomeController>(HomeController());
  }
}
