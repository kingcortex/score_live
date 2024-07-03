import 'package:flutter/material.dart';
import 'package:score_live/core/theme/color.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 110,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              "scorelive",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.rose500),
            ),
          )
        ],
      ),
    );
  }
}
