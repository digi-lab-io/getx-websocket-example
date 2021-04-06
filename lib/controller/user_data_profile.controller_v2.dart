import 'package:get/get.dart';
import 'package:getx_websocket_example/model/user-data-profile.entity.dart';
import 'package:getx_websocket_example/services/data.service_v1.dart';

enum Status { loading, error, success }

class UserDataProfileControllerV2 extends GetxController {
  Worker _getxWorker;

  final Rx<UserDataProfile> userProfileData = UserDataProfile().obs;
  final Rx<Status> status = Status.loading.obs;
  final DataServiceV1 _dataService = Get.find<DataServiceV1>();

  void fetchUserDataProfile() {
    _getxWorker = ever(_dataService.fetchUserDataProfile(), (_profile) {
      if (_profile.uuid != null) {
        userProfileData(_profile);
        status(Status.success);
      }
    });
  }

  @override
  void onClose() {
    _getxWorker?.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
