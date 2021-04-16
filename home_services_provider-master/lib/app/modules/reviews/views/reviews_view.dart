import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../global_widgets/circular_loading_widget.dart';
import '../../../global_widgets/notifications_button_widget.dart';
import '../controllers/reviews_controller.dart';
import '../widgets/review_item_widget.dart';

class ReviewsView extends GetView<ReviewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshReviews(showMessage: true);
        },
        child: CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              expandedHeight: 200,
              elevation: 0.5,
              primary: true,
              // pinned: true,
              floating: true,
              iconTheme: IconThemeData(color: Get.theme.hintColor),
              title: Text(
                "Reviews".tr,
                style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.hintColor)),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: new IconButton(
                icon: new Icon(Icons.sort, color: Get.theme.hintColor),
                onPressed: () => {Scaffold.of(context).openDrawer()},
              ),
              actions: [NotificationsButtonWidget()],
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 75),
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [Get.theme.accentColor.withOpacity(1), Get.theme.scaffoldBackgroundColor],
                          begin: AlignmentDirectional.topCenter,
                          //const FractionalOffset(1, 0),
                          end: AlignmentDirectional.bottomCenter,
                          stops: [0.1, 0.7],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    ),
                    child: Obx(() {
                      return Column(
                        children: [
                          Text(controller.rate.value.toStringAsFixed(2),
                              style: Get.textTheme.headline1.merge(TextStyle(color: Get.theme.hintColor, fontSize: 36, fontWeight: FontWeight.w600))),
                          Wrap(
                            children: Ui.getStarsList(controller.rate.value, size: 32),
                          ),
                          Text(
                            "Total Reviews (%s)".trArgs([controller.totalReviews.value.toString()]),
                            style: Get.textTheme.caption,
                          ).paddingOnly(top: 5),
                        ],
                      );
                    }),
                  )),
            ),
            SliverToBoxAdapter(
              child: Obx(() {
                if (controller.reviews.isEmpty) {
                  return CircularLoadingWidget(height: 100);
                }
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return ReviewItemWidget(review: controller.reviews.elementAt(index));
                  },
                  itemCount: controller.reviews.length,
                  primary: false,
                  shrinkWrap: true,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
