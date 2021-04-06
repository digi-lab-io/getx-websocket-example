import 'package:get/get.dart';
import 'package:getx_websocket_example/model/user-data-profile.entity.dart';
import 'package:getx_websocket_example/services/data.service_v1.dart';

class UserDataProfileControllerV1 extends GetxController with StateMixin<UserDataProfile> {
  final dataService = Get.find<DataServiceV1>();
  Worker getxWorker;

  void fetchData() {
    getxWorker = ever(dataService.fetchUserDataProfile(), (_profile) {
      if (_profile.uuid != null) {
        change(_profile, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.loading());
      }
    });
  }

  @override
  void onClose() {
    getxWorker?.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
