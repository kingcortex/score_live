import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:score_live/core/utils/device/device_utils.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/flag_or_logo_display.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/stat_item.dart';

import '../../../../../core/theme/color.dart';

class TabStatsMatch extends StatelessWidget {
  const TabStatsMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: DeviceUtils.appPadding,
        top: DeviceUtils.appPadding,
        right: DeviceUtils.appPadding,
        //bottom: 40,
      ),
      height: 724,
      width: double.infinity,
      color: AppColors.charcoalBlack,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlagOrLogoDisplay(
                url: "https://media.api-sports.io/football/teams/142.png",
              ),
              FlagOrLogoDisplay(
                url: "https://media.api-sports.io/football/teams/124.png",
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 97,
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3A),
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => StatItem(
                label: [
                  "Shots",
                  "Shots on Attempt",
                  "Shots on Attempt",
                  "Ball Possession",
                  "Pass",
                  "Fouls",
                  "Yellow Card",
                  "Red Card",
                  "Corners",
                  "Offside",
                ][index],
                homeValue: Random().nextDouble(),
                awayValue: Random().nextDouble(),
              ),
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
