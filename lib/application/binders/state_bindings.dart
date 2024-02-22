import 'package:future_it_task/presentation/ui/controllers/customer_controller.dart';
import 'package:future_it_task/presentation/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

class StateBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => LoginController());
    Get.put(() => CustomerController());
  }
}
