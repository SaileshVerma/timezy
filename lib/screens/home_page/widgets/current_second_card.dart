import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/providers/providers.dart';
import 'package:timezy/services/shared_preferences_service.dart';
import 'package:timezy/utils/app_config.dart';

class CurrentSecondsCard extends ConsumerStatefulWidget {
  const CurrentSecondsCard({
    super.key,
  });

  @override
  ConsumerState<CurrentSecondsCard> createState() => _CurrentSecondsCardState();
}

class _CurrentSecondsCardState extends ConsumerState<CurrentSecondsCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        ref.read(attemptRemainingStateProvider.notifier).state =
            await StorageData.getAttemptCurrentValue();

        ref.read(currentScoreStateProvider.notifier).state =
            await StorageData.getCurrentScoreValue();

        final val = await StorageData.getCurrentScoreValue();
        print('@@@@@@@@@@@@@@@@  ---> $val');

        Timer.periodic(
          const Duration(seconds: 1),
          (timer) async {
            if (ref.watch(letsStartGameWidgetProvider)) {
              return;
            }
            if (ref.watch(attemptRemainingStateProvider) <= 0) {
              ref.read(showResetStateProvider.notifier).state = true;
              return;
            }
            if (ref.watch(currentScoreStateProvider) >=
                AppConfig.totalAttempt) {
              ref.read(showResetStateProvider.notifier).state = true;
              return;
            }

            ref.read(currentTimeInSeconds.notifier).state =
                DateTime.now().second;
            if (ref.watch(currentTimeInSeconds) ==
                ref.watch(randomNumberGeneratorStateProvider)) {
              ref.read(showWinCardProvider.notifier).state = true;

              ref.read(currentScoreStateProvider.notifier).state++;
              await StorageData.setCurrentScoreValue(
                  ref.watch(currentScoreStateProvider));
            }
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Current Second',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${ref.watch(currentTimeInSeconds)}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
