import 'package:get/get.dart';

import '../models/faq_category_model.dart';
import '../models/faq_model.dart';
import '../providers/laravel_provider.dart';

class FaqRepository {
  LaravelApiClient _laravelApiClient;

  FaqRepository() {
    _laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<FaqCategory>> getFaqCategories() {
    return _laravelApiClient.getFaqCategories();
  }

  Future<List<Faq>> getFaqs(String categoryId) {
    return _laravelApiClient.getFaqs(categoryId);
  }
}
