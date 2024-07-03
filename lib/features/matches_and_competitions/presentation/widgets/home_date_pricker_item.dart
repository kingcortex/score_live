import 'package:flutter/material.dart';
import 'package:score_live/core/utils/formater/date_formater.dart';

class HomeDatePrickerItem extends StatelessWidget {
  final DateTime date;
  const HomeDatePrickerItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 53,
      width: 60,
      child: Text(
        DateFormater.formatDateTime(date),
        textAlign: TextAlign.center,
      ),
    );
  }
}
