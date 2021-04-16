import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../common/ui.dart';
import 'auth_service.dart';

class FireBaseMessagingService extends GetxService {
  Future<FireBaseMessagingService> init() async {
    firebaseCloudMessagingListeners();
    return this;
  }

  void firebaseCloudMessagingListeners() {
    FirebaseMessaging.instance.requestPermission(sound: true, badge: true, alert: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      Get.showSnackbar(Ui.notificationSnackBar(
        title: notification.title,
        message: notification.body,
      ));
    });
  }

  Future<void> setDeviceToken() async {
    Get.find<AuthService>().user.value.deviceToken = await FirebaseMessaging.instance.getToken();
  }
}
