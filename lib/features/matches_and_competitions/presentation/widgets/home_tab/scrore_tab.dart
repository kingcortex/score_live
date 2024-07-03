import 'package:flutter/material.dart';
import 'package:score_live/core/utils/extentions/space.dart';

import '../fixture_widget.dart';

class ScroreTab extends StatelessWidget {
  const ScroreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        12.verticalSpace,
        const FixtureWidget(
          matchState: MatchState.end,
        ),
        12.verticalSpace,
        const FixtureWidget(
          matchState: MatchState.live,
        ),
        12.verticalSpace,
        const FixtureWidget(
          matchState: MatchState.noStart,
        ),
        12.verticalSpace,
        FixtureWidget(
          matchState: MatchState.live,
        ),
        12.verticalSpace,
      ],
    );
  }
}
