import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../global_widgets/block_button_widget.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../../../models/setting_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/settings_service.dart';
import '../controllers/auth_controller.dart';

class PhoneVerificationView extends GetView<AuthController> {
  // final _currentUser = Get.find<AuthService>().user;
  final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Forgot Password".tr,
            style: Get.textTheme.headline6.merge(TextStyle(color: context.theme.primaryColor)),
          ),
          centerTitle: true,
          backgroundColor: Get.theme.accentColor,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
          primary: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 180,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Get.theme.accentColor,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          _settings.appName,
                          style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor, fontSize: 24)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Welcome to the best service provider system!".tr,
                          style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor)),
                          textAlign: TextAlign.center,
                        ),
                        // Text("Fill the following credentials to login your account", style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor))),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Get.theme.primaryColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/icon/icon.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "We sent the OTP code to your email, please check it and enter below".tr,
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 20, vertical: 20),
            TextFieldWidget(
              labelText: "OTP Code".tr,
              hintText: "_______".tr,
              style: Get.textTheme.headline4.merge(TextStyle(letterSpacing: 8)),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              // iconData: Icons.add_to_home_screen_outlined,
            ),
            BlockButtonWidget(
              onPressed: () {
                Get.offAllNamed(Routes.ROOT);
              },
              color: Get.theme.accentColor,
              text: Text(
                "Verify".tr,
                style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor)),
              ),
            ).paddingSymmetric(vertical: 35, horizontal: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.REGISTER);
                  },
                  child: Text("You don't have an account?".tr),
                ),
              ],
            ),
          ],
        ));
  }
}
