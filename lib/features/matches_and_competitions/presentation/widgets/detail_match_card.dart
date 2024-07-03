import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/flag_or_logo_display.dart';

import '../../../../core/theme/color.dart';
import '../../../../core/utils/device/device_utils.dart';
import 'game_time_widget.dart';

class DetailMatchCard extends StatelessWidget {
  const DetailMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
      padding: const EdgeInsets.all(12),
      height: 197,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.charcoalBlack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                  ),
                  6.horizontalSpace,
                  const Text("Premier Ligue"),
                ],
              ),
              const GameTimeWidget(
                time: 67,
              )
            ],
          ),
          12.verticalSpace,
          Container(
            height: 76,
            //width: 277,
            // decoration: const BoxDecoration(
            //   color: Colors.amber,
            // ),
            child: Row(
              children: [
                _buildTeam(
                    "https://media.api-sports.io/football/teams/142.png"),
                _builScrore(context),
                _buildTeam(
                    "https://media.api-sports.io/football/teams/124.png"),
              ],
            ),
          ),
          12.verticalSpace,
          const Divider(
            height: 1,
            color: Color(0xff3A3A3A),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                88.horizontalSpace,
                SvgPicture.asset(
                    "assets/icons/fluent_sport-soccer-24-filled.svg"),
                SizedBox(
                  width: 88,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "L.Messi",
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.slateGray),
                      ),
                      Text(
                        "L.Messi",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.slateGray),
                      ),
                      Text(
                        "L.Messi",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.slateGray),
                      ),
                      Text(
                        "L.Messi",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.slateGray),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _builScrore(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                  ),
            ),
            Text(
              "-",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 20, letterSpacing: 5),
            ),
            Text(
              "2",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTeam(String url) {
    return Container(
      width: 104,
      height: 76,
      //color: Colors.blue,
      child: Column(
        children: [
          Expanded(
              child: FlagOrLogoDisplay(
            url: url,
          )),
          const Expanded(
            child: SizedBox(
              child: Text(
                "Nottingham\n Forest",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
