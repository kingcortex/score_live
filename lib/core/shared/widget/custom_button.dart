import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../theme/color.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final dynamic Function()? onTap;
  const CustomButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.rose500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "Details",
        ),
      ),
    );
  }
}
