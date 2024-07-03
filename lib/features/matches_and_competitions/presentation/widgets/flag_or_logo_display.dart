import 'package:flutter/material.dart';

import '../../../../core/theme/color.dart';

class FlagOrLogoDisplay extends StatelessWidget {
  final String url;
  final double? size;
  const FlagOrLogoDisplay({super.key, required this.url, this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      radius: size ?? 16,
      child: Image.network(
        url,
        height: 55,
        fit: BoxFit.contain,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.rose500,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Icon(
            Icons.error,
            color: AppColors.rose500,
          );
        },
      ),
    );
  }
}
