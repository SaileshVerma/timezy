import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/providers/providers.dart';
import 'package:timezy/screens/home_page/widgets/click_action_button.dart';
import 'package:timezy/screens/home_page/widgets/current_second_card.dart';
import 'package:timezy/screens/home_page/widgets/failure_card.dart';
import 'package:timezy/screens/home_page/widgets/random_number_text_card.dart';
import 'package:timezy/screens/home_page/widgets/success_card.dart';
import 'package:timezy/screens/home_page/widgets/time_left_progress_bar.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'TimeZy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrentSecondsCard(),
                RandomNumberCard(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
                child: ref.watch(showWinCardProvider)
                    ? const SuccessCard()
                    : const FailureCard(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: TimeLeftProgressBar(),
            ),
            const ClickMeButton()
          ],
        ),
      ),
    );
  }
}
