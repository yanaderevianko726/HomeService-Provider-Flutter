import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../models/address_model.dart';
import '../models/user_model.dart';
import '../providers/laravel_provider.dart';
import '../services/auth_service.dart';

class UserRepository {
  LaravelApiClient _laravelApiClient;
  fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;

  UserRepository() {}

  Future<User> login(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    return _laravelApiClient.login(user);
  }

  Future<User> get(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    return _laravelApiClient.getUser(user);
  }

  Future<User> update(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    return _laravelApiClient.updateUser(user);
  }

  Future<User> getCurrentUser() {
    return this.get(Get.find<AuthService>().user.value);
  }

  Future<User> register(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    return _laravelApiClient.register(user);
  }

  Future<List<Address>> getAddresses() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    return _laravelApiClient.getAddresses();
  }

  Future<void> setDeviceToken() async {
    Get.find<AuthService>().user.value.deviceToken = await FirebaseMessaging.instance.getToken();
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      fba.UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return await signUpWithEmailAndPassword(email, password);
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    fba.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if (result.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future signOut() async {
    return await _auth.signOut();
  }
}
