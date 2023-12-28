import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timezy/providers/providers.dart';
import 'package:timezy/services/shared_preferences_service.dart';

class TimeLeftProgressBar extends ConsumerStatefulWidget {
  const TimeLeftProgressBar({
    super.key,
  });

  @override
  ConsumerState<TimeLeftProgressBar> createState() =>
      _TimeLeftProgressBarState();
}

class _TimeLeftProgressBarState extends ConsumerState<TimeLeftProgressBar> {
  int currentSecond = 5;

  updateCurrentTime() async {
    if (ref.watch(remainingTimeStateProvider) == 0) {
      ref.read(remainingTimeStateProvider.notifier).state = 5;
      ref.read(showWinCardProvider.notifier).state = false;
      ref.read(attemptRemainingStateProvider.notifier).state--;
      await StorageData.setAttemptCurrentValue(
          ref.watch(attemptRemainingStateProvider));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(attemptRemainingStateProvider.notifier).state =
          await StorageData.getAttemptCurrentValue();

      Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (ref.watch(letsStartGameWidgetProvider)) {
          return;
        }
        if (ref.watch(showResetStateProvider)) {
          return;
        }
        ref.read(remainingTimeStateProvider.notifier).state--;

        await updateCurrentTime();
      });
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
      percent: ((ref.watch(remainingTimeStateProvider) / 5)),
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "0:0${ref.watch(remainingTimeStateProvider)}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      progressColor: Colors.green,
    );
  }
}
