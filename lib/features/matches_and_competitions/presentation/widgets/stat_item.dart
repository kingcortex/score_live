import 'dart:math';

import 'package:flutter/material.dart';
import 'package:score_live/core/utils/extentions/space.dart';

import '../../../../core/theme/color.dart';

class StatItem extends StatelessWidget {
  final String label;
  final double homeValue;
  final double awayValue;
  const StatItem(
      {super.key,
      required this.label,
      required this.homeValue,
      required this.awayValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: double.infinity,
      //color: AppColors.success500,
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 32,
                  child: Text(
                    "6",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.slateGray,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  width: 182,
                  child: Text(
                    textAlign: TextAlign.center,
                    label,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.slateGray,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  width: 32,
                  child: Text(
                    textAlign: TextAlign.end,
                    "6",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.slateGray,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Transform.rotate(
                      angle: pi,
                      child: LinearProgressIndicator(
                        color: AppColors.rose500,
                        backgroundColor: Color(0xffD2D2D2),
                        value: homeValue,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  6.horizontalSpace,
                  Expanded(
                    child: LinearProgressIndicator(
                      color: AppColors.slateGray,
                      backgroundColor: Color(0xffD2D2D2),
                      value: awayValue,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
