import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/home_controller.dart';
import 'package:getx_websocket_example/services/logging.service.dart';

class HomeBinding extends Bindings {
  final logger = LoggingService().logger;

  @override
  void dependencies() {
    logger.v("HomeBinding getting initialized ...");
    Get.put<HomeController>(HomeController());
  }
}
