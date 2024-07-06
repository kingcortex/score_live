import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:score_live/core/shared/widget/custom_button.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/data/models/fixture.dart';
import 'package:score_live/features/matches_and_competitions/data/models/match_up_info.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/flag_or_logo_display.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/game_time_widget.dart';

import '../../../../core/theme/color.dart';

class LiveNowCard extends StatelessWidget {
  final MatchUpInfo matchUpInfo;
  const LiveNowCard({super.key, required this.matchUpInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 176,
      width: 301,
      decoration: BoxDecoration(
        color: AppColors.charcoalBlack,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    foregroundImage: NetworkImage(matchUpInfo.league.logo),
                  ),
                  6.horizontalSpace,
                  Text(matchUpInfo.league.name),
                ],
              ),
              GameTimeWidget(
                time: matchUpInfo.fixture.status.elapsed ?? 000,
              )
            ],
          ),
          12.verticalSpace,
          Container(
            height: 76,
            width: 277,
            // decoration: const BoxDecoration(
            //   color: Colors.amber,
            // ),
            child: Row(
              children: [
                _buildTeam(matchUpInfo.teams.home),
                _builScrore(context),
                _buildTeam(matchUpInfo.teams.away),
              ],
            ),
          ),
          12.verticalSpace,
          CustomButton(
              onTap: () => context.push('/detail-match'), label: "Details"),
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
              matchUpInfo.goals.home.toString(),
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
              matchUpInfo.goals.away.toString(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTeam(dynamic team) {
    return Container(
      width: 104,
      height: 76,
      //color: Colors.blue,
      child: Column(
        children: [
          Expanded(child: FlagOrLogoDisplay(url: team["logo"])),
          Expanded(
            child: SizedBox(
              child: Text(
                team["name"] ?? "dd",
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
