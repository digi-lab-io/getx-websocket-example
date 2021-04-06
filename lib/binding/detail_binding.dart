import 'package:get/get.dart';
import 'package:getx_websocket_example/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    print("------> DetailBinding");
    Get.put<DetailController>(DetailController());
  }
}
