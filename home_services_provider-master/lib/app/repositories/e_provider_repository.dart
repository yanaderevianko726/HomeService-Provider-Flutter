import 'package:get/get.dart';

import '../models/award_model.dart';
import '../models/e_provider_model.dart';
import '../models/e_service_model.dart';
import '../models/experience_model.dart';
import '../models/review_model.dart';
import '../models/user_model.dart';
import '../providers/laravel_provider.dart';

class EProviderRepository {
  LaravelApiClient _laravelApiClient;

  EProviderRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<EProvider> get(String eProviderId) {
    return _laravelApiClient.getEProvider(eProviderId);
  }

  Future<List<Review>> getReviews(String userId) {
    return _laravelApiClient.getEProviderReviews(userId);
  }

  Future<Review> getReview(String reviewId) {
    return _laravelApiClient.getEProviderReview(reviewId);
  }

  Future<List<Award>> getAwards(String eProviderId) {
    return _laravelApiClient.getEProviderAwards(eProviderId);
  }

  Future<List<Experience>> getExperiences(String eProviderId) {
    return _laravelApiClient.getEProviderExperiences(eProviderId);
  }

  Future<List<EService>> getEServices({int page}) {
    return _laravelApiClient.getEProviderEServices(page);
  }

  Future<List<User>> getEmployees(String eProviderId) {
    return _laravelApiClient.getEProviderEmployees(eProviderId);
  }

  Future<List<EService>> getPopularEServices({int page}) {
    return _laravelApiClient.getEProviderPopularEServices(page);
  }

  Future<List<EService>> getMostRatedEServices({int page}) {
    return _laravelApiClient.getEProviderMostRatedEServices(page);
  }

  Future<List<EService>> getAvailableEServices({int page}) {
    return _laravelApiClient.getEProviderAvailableEServices(page);
  }

  Future<List<EService>> getFeaturedEServices({int page}) {
    return _laravelApiClient.getEProviderFeaturedEServices(page);
  }
}
