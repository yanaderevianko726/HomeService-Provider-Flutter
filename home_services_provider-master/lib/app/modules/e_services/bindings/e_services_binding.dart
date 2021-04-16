import 'package:get/get.dart';

import '../controllers/e_service_controller.dart';
import '../controllers/e_services_controller.dart';

class EServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EServicesController>(
      () => EServicesController(),
    );
    Get.lazyPut<EServiceController>(
      () => EServiceController(),
    );
  }
}
