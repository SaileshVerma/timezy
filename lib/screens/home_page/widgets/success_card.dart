import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/providers/providers.dart';
import 'package:timezy/utils/app_config.dart';

class SuccessCard extends ConsumerWidget {
  const SuccessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.green.shade700,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Success :)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            color: Colors.green.shade800,
            thickness: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (ref.watch(currentScoreStateProvider) >= AppConfig.totalAttempt)
                  ? '🎉 Winner Winner 🎉'
                  : 'Score: ${ref.watch(currentScoreStateProvider)}/${AppConfig.totalAttempt}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
