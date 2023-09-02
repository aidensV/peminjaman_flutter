import 'package:get/get.dart';


import 'dashboardcontroller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<AccountController>(() => AccountController());
  }
}
