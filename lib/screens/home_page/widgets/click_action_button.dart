import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/providers/providers.dart';
import 'package:timezy/utils/random_number_geenrator.dart';

class ClickMeButton extends ConsumerWidget {
  const ClickMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        ref.watch(randomNumberGeneratorStateProvider.notifier).state =
            randomNumberGenerator();
        ref.read(remainingTimeStateProvider.notifier).state = 5;
      },
      child: const Text(
        'Click',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
