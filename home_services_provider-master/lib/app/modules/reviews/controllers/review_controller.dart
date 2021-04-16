import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/review_model.dart';
import '../../../repositories/e_provider_repository.dart';

class ReviewController extends GetxController {
  final review = Review().obs;
  EProviderRepository _eProviderRepository;

  ReviewController() {
    _eProviderRepository = new EProviderRepository();
  }
  @override
  void onInit() {
    review.value = Get.arguments as Review;
    super.onInit();
  }

  @override
  void onReady() async {
    await refreshReview();
    super.onReady();
  }

  Future refreshReview({bool showMessage = false}) async {
    await getReview();
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Reviews refreshed successfully".tr));
    }
  }

  Future getReview() async {
    try {
      review.value = await _eProviderRepository.getReview(review.value.id);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
