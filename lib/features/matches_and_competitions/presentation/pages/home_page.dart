import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:score_live/core/theme/color.dart';
import 'package:score_live/core/utils/constants/icons_path.dart';
import 'package:score_live/core/utils/device/device_utils.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/core/utils/helpers/helpers_functions.dart';
import 'package:score_live/features/matches_and_competitions/presentation/controllers/home_page_controller.dart';
import 'package:score_live/features/matches_and_competitions/presentation/pages/home_page_body.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/custom_tab_bar_item.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/fixture_widget.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/home_date_picker.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/home_tab/scrore_tab.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/live_now_card.dart';

import '../../../../core/shared/widget/logo.dart';
import '../widgets/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomePageController controller = Get.put(HomePageController());
  @override
  void initState() {
    controller.setDateTabController(
      TabController(
          length: controller.listDates.length,
          vsync: this,
          initialIndex: controller.initialDateIndex),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.dateTabController,
        children: List.generate(
          controller.listDates.length,
          (index) => HomePageBody(date: controller.listDates[index]),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      leadingWidth: 110 + DeviceUtils.appPadding,
      leading: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(IconsPath.searchRegular),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(IconsPath.alertRegular),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HomeDatePicker(
          controller: controller.dateTabController,
          dates: controller.listDates,
        ),
      ),
    );
  }
}
