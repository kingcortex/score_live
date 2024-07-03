import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:score_live/core/theme/color.dart';
import 'package:score_live/core/utils/extentions/space.dart';
import 'package:score_live/features/matches_and_competitions/presentation/widgets/flag_or_logo_display.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FixtureWidget extends StatelessWidget {
  final MatchState matchState;
  const FixtureWidget({super.key, required this.matchState});

  @override
  Widget build(BuildContext context) {
    Widget leading;
    switch (matchState) {
      case MatchState.end:
        leading = _leadingEnd(context);
        break;
      case MatchState.noStart:
        leading = _leadingnoStart(context);
        break;
      case MatchState.live:
        leading = _leadingLive(context);
        break;
      default:
        leading = Text("Error");
    }
    return ZoomTapAnimation(
      onTap: () => context.push("/detail-match"),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.charcoalBlack,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              height: 40,
              width: 36,
              //color: Colors.amber,
              child: FittedBox(child: leading),
            ),
            Expanded(
              child: Container(
                width: 36,
                //color: Colors.blue,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        child: _builTeam(context),
                      ),
                    ),
                    12.verticalSpace,
                    Expanded(
                      child: Container(
                        //color: Colors.green,
                        child: _builTeam(context),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _builTeam(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const FlagOrLogoDisplay(
                size: 12,
                url: "https://media.api-sports.io/football/teams/142.png"),
            12.horizontalSpace,
            Text(
              "West Ham United",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
          matchState == MatchState.noStart ? "-" : "2",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _leadingEnd(BuildContext context) {
    return Text(
      "FT\n15/4",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.slateGray,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  _leadingLive(BuildContext context) {
    return Text(
      "'78",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.success500,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  _leadingnoStart(BuildContext context) {
    return Text(
      "22/9",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.slateGray,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

enum MatchState {
  live,
  end,
  noStart,
}
