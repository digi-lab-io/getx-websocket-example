import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/home_controller.dart';
import 'package:getx_websocket_example/controller/user_data_profile.controller.dart';
import 'package:getx_websocket_example/services/data.service.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class InitialBinding extends Bindings {
  final logger = LoggingService().logger;

  @override
  void dependencies() {
    logger.i("InitialBinding");
    Get.put<DataService>(DataService());
    Get.put<UserDataProfileController>(UserDataProfileController());
    Get.put<HomeController>(HomeController());
  }
}
