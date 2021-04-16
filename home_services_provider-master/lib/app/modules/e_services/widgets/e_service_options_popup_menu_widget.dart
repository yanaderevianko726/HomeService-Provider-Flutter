import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/e_service_model.dart';
import '../../../routes/app_pages.dart';

class EServiceOptionsPopupMenuWidget extends StatelessWidget {
  const EServiceOptionsPopupMenuWidget({
    Key key,
    @required EService eService,
  })  : _eService = eService,
        super(key: key);

  final EService _eService;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onSelected: (item) {
        switch (item) {
          case "update":
            {
              // TODO update the eService
            }
            break;
          case "delete":
            {
              // TODO delete the eService
            }
            break;
          case "view":
            {
              Get.toNamed(Routes.E_SERVICE, arguments: {'eService': _eService, 'heroTag': 'e_provider_services_list_item'});
            }
            break;
        }
      },
      itemBuilder: (context) {
        var list = <PopupMenuEntry<Object>>[];
        list.add(
          PopupMenuItem(
            value: "view",
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.water_damage_outlined, color: Get.theme.hintColor),
                SizedBox(width: 10),
                Text(
                  "Service Details".tr,
                  style: TextStyle(color: Get.theme.hintColor),
                ),
              ],
            ),
          ),
        );
        return list;
      },
      child: Icon(
        Icons.more_vert,
        color: Get.theme.hintColor,
      ),
    );
  }
}
