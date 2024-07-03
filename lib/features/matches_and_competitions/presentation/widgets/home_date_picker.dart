import 'package:flutter/material.dart';

import '../../../../core/theme/color.dart';
import 'home_date_pricker_item.dart';

class HomeDatePicker extends StatelessWidget {
  final TabController controller;
  final List<DateTime> dates;
  const HomeDatePicker(
      {super.key, required this.controller, required this.dates});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      tabAlignment: TabAlignment.center,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      labelColor: AppColors.white,
      indicatorColor: AppColors.rose500,
      isScrollable: true,
      controller: controller,
      tabs: List.generate(
        controller.length,
        (index) {
          return HomeDatePrickerItem(
            date: dates[index],
          );
        },
      ),
    );
  }
}
