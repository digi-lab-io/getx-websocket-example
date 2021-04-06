import 'package:get/get.dart';
import 'package:getx_websocket_example/model/user-data-profile.entity.dart';
import 'package:getx_websocket_example/services/data.service.dart';

enum Status { loading, error, success }

class UserDataProfileControllerV2 extends GetxController {
  final Rx<UserDataProfile> data = UserDataProfile().obs;
  final status = Status.loading.obs;
  final dataService = Get.find<DataService>();
  Worker getxWorker;

  void change(UserDataProfile _profile, {Status newStatus}) {
    data(_profile);
    status(newStatus);
  }

  void fetchData() {
    getxWorker = ever(dataService.fetchUserDataProfile(), (_profile) {
      if (_profile.uuid != null) {
        change(_profile, newStatus: Status.success);
      } else {
        change(null, newStatus: Status.loading);
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
