import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';


class RememberController extends GetxController {
  static RememberController get instance => Get.find();

  final GetStorage storage = GetStorage();
  final RxBool rememberMe = false.obs;

  //
  @override
  void onInit() {
    rememberMe.value = storage.read('rememberMe') ?? false;
    super.onInit();
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
    storage.write('rememberMe', value);
  }

  
}
