import 'package:aby_eatery/controllers/comments_controller.dart';
import 'package:get/instance_manager.dart';

import '../controllers/products_controller.dart';
import '../controllers/user_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<Controller>(Controller());
    // Get.put<PrescriptionController>(PrescriptionController());
    Get.put(UserController());
    Get.put(ProductsController());
    Get.put(CommentController());
  }
}
