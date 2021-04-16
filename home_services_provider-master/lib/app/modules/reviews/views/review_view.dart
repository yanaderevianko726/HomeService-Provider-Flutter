import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../global_widgets/circular_loading_widget.dart';
import '../controllers/review_controller.dart';
import '../widgets/review_item_widget.dart';

class ReviewView extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshReview(showMessage: true);
        },
        child: CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              expandedHeight: 180,
              elevation: 0.5,
              primary: true,
              // pinned: true,
              floating: true,
              iconTheme: IconThemeData(color: Get.theme.hintColor),
              title: Text(
                "Review Details".tr,
                style: Get.textTheme.headline6
                    .merge(TextStyle(color: Get.theme.hintColor)),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: new IconButton(
                icon:
                    new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()},
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 75),
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Get.theme.accentColor.withOpacity(1),
                            Get.theme.scaffoldBackgroundColor
                          ],
                          begin: AlignmentDirectional.topCenter,
                          //const FractionalOffset(1, 0),
                          end: AlignmentDirectional.bottomCenter,
                          stops: [0.1, 0.8],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Text(controller.review.value.rate.toString(),
                            style: Get.textTheme.headline1.merge(TextStyle(
                                color: Get.theme.hintColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w600))),
                        Wrap(
                          children: Ui.getStarsList(
                              controller.review.value.rate,
                              size: 32),
                        ),
                      ],
                    ),
                  )),
            ),
            SliverToBoxAdapter(
              child: Obx(() {
                if (!controller.review.value.hasData) {
                  return CircularLoadingWidget(height: 100);
                }
                return ReviewItemWidget(review: controller.review.value);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
