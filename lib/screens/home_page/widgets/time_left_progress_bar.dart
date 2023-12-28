import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimeLeftProgressBar extends StatefulWidget {
  const TimeLeftProgressBar({
    super.key,
  });

  @override
  State<TimeLeftProgressBar> createState() => _TimeLeftProgressBarState();
}

class _TimeLeftProgressBarState extends State<TimeLeftProgressBar> {
  int currentSecond = 5;

  updateCurrentTime() {
    setState(() {
      currentSecond--;
    });
    if (currentSecond == 0) {
      setState(() {
        currentSecond = 5;
      });
    }
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateCurrentTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 8.0,
      reverse: true,
      curve: Curves.easeIn,
      percent: ((currentSecond / 5)),
      circularStrokeCap: CircularStrokeCap.round,
      center: Text("${currentSecond} seconds"),
      progressColor: Colors.green,
    );
  }
}
