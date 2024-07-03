import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  final String label;
  const CustomTabBarItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Text(label),
    );
  }
}
