import 'package:flutter/material.dart';
import 'package:timezy/screens/home_page/widgets/click_action_button.dart';
import 'package:timezy/screens/home_page/widgets/current_second_card.dart';
import 'package:timezy/screens/home_page/widgets/failure_card.dart';
import 'package:timezy/screens/home_page/widgets/random_number_text_card.dart';
import 'package:timezy/screens/home_page/widgets/time_left_progress_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrentSecondsCard(),
                RandomNumberCard(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: FailureCard(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: TimeLeftProgressBar(),
            ),
            ClickMeButton()
          ],
        ),
      ),
    );
  }
}
