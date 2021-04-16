import 'package:get/get.dart';

import '../models/payment_model.dart';
import '../providers/laravel_provider.dart';

class PaymentRepository {
  LaravelApiClient _laravelApiClient;

  PaymentRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<Payment> update(Payment payment) {
    return _laravelApiClient.updatePayment(payment);
  }
}
