import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/providers/providers.dart';

class ResetStateActionIconWIdget extends ConsumerWidget {
  const ResetStateActionIconWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(showResetStateProvider),
      child: IconButton(
        onPressed: () {
          ref.invalidate(remainingTimeStateProvider);

          ref.invalidate(currentTimeInSeconds);

          ref.invalidate(randomNumberGeneratorStateProvider);

          ref.invalidate(attemptRemainingStateProvider);

          ref.invalidate(currentScoreStateProvider);

          ref.invalidate(showWinCardProvider);

          ref.invalidate(letsStartGameWidgetProvider);

          ref.read(showResetStateProvider.notifier).state = false;
        },
        icon: const Icon(
          Icons.refresh,
          size: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}
