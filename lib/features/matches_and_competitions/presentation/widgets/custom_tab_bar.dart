import 'package:flutter/material.dart';

import '../../../../core/theme/color.dart';

class CustomTabBar extends StatelessWidget {
  final bool? isScrallable;
  final EdgeInsets? labelPadding;
  final TabAlignment? tabAlignment;
  final TabController controller;
  final List<Widget> tabs;
  const CustomTabBar(
      {super.key,
      required this.controller,
      required this.tabs,
      this.isScrallable,
      this.tabAlignment,
      this.labelPadding});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: labelPadding,
      isScrollable: isScrallable ?? true,
      tabAlignment: tabAlignment ?? TabAlignment.center,
      indicatorColor: AppColors.rose500,
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColors.white,
      controller: controller,
      tabs: tabs,
    );
  }
}
