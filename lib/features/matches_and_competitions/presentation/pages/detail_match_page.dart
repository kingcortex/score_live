import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:score_live/core/theme/color.dart';
import 'package:score_live/core/utils/constants/icons_path.dart';
import 'package:score_live/core/utils/device/device_utils.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/presentation/controllers/detail_match_page_controller.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/custom_tab_bar.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/custom_tab_bar_item.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/detail_match_card.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/detail_match_tab/tab_stats_match.dart';

class DetailMatchPage extends StatefulWidget {
  const DetailMatchPage({super.key});

  @override
  State<DetailMatchPage> createState() => _DetailMatchPageState();
}

class _DetailMatchPageState extends State<DetailMatchPage>
    with TickerProviderStateMixin {
  final DetailMatchPageController controller =
      Get.put(DetailMatchPageController());

  @override
  void initState() {
    controller.setTabController(
        TabController(length: 6, vsync: this, initialIndex: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                48.verticalSpace,
                const DetailMatchCard(),
                16.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
                  child: CustomTabBar(
                    controller: controller.tabController,
                    tabs: const <CustomTabBarItem>[
                      CustomTabBarItem(
                        label: "Summary",
                      ),
                      CustomTabBarItem(
                        label: "Line Up",
                      ),
                      CustomTabBarItem(
                        label: "Stats",
                      ),
                      CustomTabBarItem(
                        label: "H2H",
                      ),
                      CustomTabBarItem(
                        label: "Standings",
                      ),
                      CustomTabBarItem(label: "Report")
                    ],
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          )
        ],
        body: TabBarView(
          controller: controller.tabController,
          children: [
            Container(
              color: Colors.lightBlue,
            ),
            Container(
              color: Colors.lightBlue,
            ),
            const TabStatsMatch(),
            Container(
              color: Colors.lightBlue,
            ),
            Container(
              color: Colors.lightBlue,
            ),
            Container(
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: SvgPicture.asset(
          IconsPath.chevronLeft,
          height: 24,
          width: 24,
        ),
      ),
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Premiere ligue",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            "Today",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.slateGray),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            IconsPath.share,
            height: 24,
            width: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            IconsPath.star,
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }
}
