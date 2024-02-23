import 'package:get/get.dart';

import '../../presentation/ui/controllers/customer_controller.dart';
import '../../presentation/ui/controllers/login_controller.dart';

class StateBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => CustomerController());
    Get.put(() => LoginController());
  }
}
