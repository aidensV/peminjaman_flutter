import 'package:get/get.dart';
import '../view/Login/login.dart';

class GlobalController extends GetxController {
  //var user = SharedPrefs().getUser();

  checkUser() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(LoginScreen());
    });

  }
  @override
  void onInit() {
    checkUser();
    super.onInit();
  }
}