import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services_provider/app/services/firebase_messaging_service.dart';

import '../../../../common/ui.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class AuthController extends GetxController {
  final Rx<User> currentUser = Get.find<AuthService>().user;
  GlobalKey<FormState> loginFormKey;
  GlobalKey<FormState> registerFormKey;
  final hidePassword = true.obs;
  final loading = false.obs;
  UserRepository _userRepository;

  AuthController() {
    registerFormKey = new GlobalKey<FormState>();
    _userRepository = UserRepository();
  }

  void login() async {
    Get.focusScope.unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      loading.value = true;
      try {
        await Get.find<FireBaseMessagingService>().setDeviceToken();
        currentUser.value = await _userRepository.login(currentUser.value);
        currentUser.value.auth = true;
        await _userRepository.signInWithEmailAndPassword(currentUser.value.email, currentUser.value.apiToken);
        loading.value = false;
        await Get.toNamed(Routes.ROOT, arguments: 0);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      } finally {
        loading.value = false;
      }
    }
  }

  void register() async {
    Get.focusScope.unfocus();
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      loading.value = true;
      try {
        await Get.find<FireBaseMessagingService>().setDeviceToken();
        currentUser.value = await _userRepository.register(currentUser.value);
        await _userRepository.signUpWithEmailAndPassword(currentUser.value.email, currentUser.value.apiToken);
        currentUser.value.auth = true;
        loading.value = false;
        await Get.toNamed(Routes.ROOT, arguments: 0);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      } finally {
        loading.value = false;
      }
    }
  }
}
