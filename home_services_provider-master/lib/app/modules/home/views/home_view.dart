import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/notifications_button_widget.dart';
import '../../../global_widgets/tab_bar_widget.dart';
import '../../../services/settings_service.dart';
import '../controllers/home_controller.dart';
import '../widgets/bookings_list_widget.dart';
import '../widgets/statistics_carousel_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.initScrollController();
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshHome(showMessage: true);
          },
          child: CustomScrollView(
            controller: controller.scrollController,
            shrinkWrap: false,
            slivers: <Widget>[
              Obx(() {
                return SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 290,
                  elevation: 0.5,
                  floating: false,
                  iconTheme: IconThemeData(color: Get.theme.primaryColor),
                  title: Text(
                    Get.find<SettingsService>().setting.value.appName,
                    style: Get.textTheme.headline6,
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: new IconButton(
                    icon: new Icon(Icons.sort, color: Colors.black87),
                    onPressed: () => {Scaffold.of(context).openDrawer()},
                  ),
                  actions: [NotificationsButtonWidget()],
                  bottom: controller.bookingStatuses.isEmpty
                      ? TabBarLoadingWidget()
                      : TabBarWidget(
                    tag: 'home',
                    tabs: List.generate(controller.bookingStatuses.length, (index) {
                      var _status = controller.bookingStatuses.elementAt(index);
                      return ChipWidget(
                        tag: 'home',
                        text: _status.status.tr,
                        id: _status.id,
                        onSelected: (id) {
                          controller.changeTab(id);
                        },
                      );
                    }),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: StatisticsCarouselWidget(
                        statisticsList: controller.statistics,
                      ).paddingOnly(top: 70, bottom: 50)),
                );
              }),
              SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    BookingsListWidget(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
