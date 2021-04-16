import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/booking_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class BookingOptionsPopupMenuWidget extends GetView<HomeController> {
  const BookingOptionsPopupMenuWidget({
    Key key,
    @required Booking booking,
  })  : _booking = booking,
        super(key: key);

  final Booking _booking;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onSelected: (item) {
        switch (item) {
          case "accept":
            {
              // TODO accept the booking
            }
            break;
          case "decline":
            {
              // TODO decline the booking
            }
            break;
          case "view":
            {
              Get.toNamed(Routes.BOOKING, arguments: _booking);
            }
            break;
        }
      },
      itemBuilder: (context) {
        var list = <PopupMenuEntry<Object>>[];
        list.add(
          PopupMenuItem(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.assignment_outlined, color: Get.theme.hintColor),
                Text(
                  "ID #".tr + _booking.id,
                  style: TextStyle(color: Get.theme.hintColor),
                ),
              ],
            ),
            value: "view",
          ),
        );
        list.add(
          PopupMenuItem(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.assignment_outlined, color: Get.theme.hintColor),
                Text(
                  "View Details".tr,
                  style: TextStyle(color: Get.theme.hintColor),
                ),
              ],
            ),
            value: "view",
          ),
        );
        list.add(
          PopupMenuItem(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.check_circle_outline, color: Get.theme.hintColor),
                Text(
                  "Accept".tr,
                  style: TextStyle(color: Get.theme.hintColor),
                ),
              ],
            ),
            value: "accept",
          ),
        );
        list.add(
          PopupMenuItem(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                Text(
                  "Decline".tr,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
            value: "decline",
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
