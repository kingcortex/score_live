import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';
import 'package:score_live/features/matches_and_competitions/presentation/controllers/home_page_body_controller.dart';

import '../../../../core/theme/color.dart';
import '../../../../core/utils/device/device_utils.dart';
import '../../../../core/utils/helpers/helpers_functions.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/custom_tab_bar_item.dart';
import '../widgets/home_tab/scrore_tab.dart';
import '../widgets/live_now_card.dart';

class HomePageBody extends StatefulWidget {
  final DateTime date;
  const HomePageBody({super.key, required this.date});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with TickerProviderStateMixin {
  late HomePageBodyController controller;

  @override
  void initState() {
    controller = Get.put(HomePageBodyController(widget.date),
        tag: widget.date.toIso8601String());
    controller.setSectionTabController(
      TabController(
        length: controller.tabLength,
        vsync: this,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
            child: Column(
          children: [
            if (controller.date == HelpersFunctions.getDateOnly(DateTime.now()))
              _buildLiveNow(),
            CustomTabBar(
              controller: controller.sectionTabController,
              labelPadding: const EdgeInsets.symmetric(horizontal: 30),
              tabs: [
                if (controller.hasUpcommig)
                  const CustomTabBarItem(
                    label: "Upcoming",
                  ),
                if (controller.hasScore)
                  const CustomTabBarItem(
                    label: "Score",
                  ),
                CustomTabBarItem(label: "Favorites"),
              ],
            ),
            18.verticalSpace,
          ],
        )),
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
        child: TabBarView(
          controller: controller.sectionTabController,
          children: [
            if (controller.hasUpcommig)
              Container(
                color: Colors.amber,
                height: 10000,
              ),
            if (controller.hasScore) const ScroreTab(),
            Container(
              color: Colors.red,
              height: 1000,
            )
          ],
        ),
      ),
    );
  }

  _buildLiveNow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      height: 240,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Live Now",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "See More",
                  style: HelpersFunctions.getTextTheme(context)
                      .bodySmall!
                      .copyWith(color: AppColors.rose500),
                )
              ],
            ),
          ),
          12.verticalSpace,
          SizedBox(
            height: 176,
            child: FutureBuilder<List<MatchUpInfo>>(
              future: controller.getLiveFixtures(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: DeviceUtils.appPadding),
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return LiveNowCard(
                        matchUpInfo: data[index],
                      );
                    },
                    separatorBuilder: (context, index) => 12.horizontalSpace,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
