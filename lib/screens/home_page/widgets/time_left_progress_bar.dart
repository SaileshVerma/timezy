import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimeLeftProgressBar extends StatelessWidget {
  const TimeLeftProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 8.0,
      percent: 0.6,
      circularStrokeCap: CircularStrokeCap.round,
      center: const Text("3 seconds"),
      progressColor: Colors.green,
    );
  }
}
