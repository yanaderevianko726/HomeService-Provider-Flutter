import 'package:get/get.dart';

import '../models/e_service_model.dart';
import '../models/option_group_model.dart';
import '../models/review_model.dart';
import '../providers/laravel_provider.dart';

class EServiceRepository {
  LaravelApiClient _laravelApiClient;

  EServiceRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<EService>> search(String keywords, List<String> categories, {int page = 1}) {
    return _laravelApiClient.searchEServices(keywords, categories, page);
  }

  Future<EService> get(String id) {
    return _laravelApiClient.getEService(id);
  }

  Future<List<Review>> getReviews(String eServiceId) {
    return _laravelApiClient.getEServiceReviews(eServiceId);
  }

  Future<List<OptionGroup>> getOptionGroups(String eServiceId) {
    return _laravelApiClient.getEServiceOptionGroups(eServiceId);
  }
}
