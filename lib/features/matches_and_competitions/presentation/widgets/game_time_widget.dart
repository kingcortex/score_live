import 'package:flutter/material.dart';
import 'package:score_live/core/utils/extentions/space.dart';

import '../../../../core/theme/color.dart';

class GameTimeWidget extends StatelessWidget {
  final int time;
  const GameTimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 22,
      decoration: BoxDecoration(
        color: AppColors.success50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: const BoxDecoration(
              color: AppColors.success500,
              shape: BoxShape.circle,
            ),
          ),
          4.horizontalSpace,
          Text(
            time.toString(),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.success700),
          )
        ],
      ),
    );
  }
}
