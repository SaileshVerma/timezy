import 'dart:async';

import 'package:flutter/material.dart';

class CurrentSecondsCard extends StatefulWidget {
  const CurrentSecondsCard({
    super.key,
  });

  @override
  State<CurrentSecondsCard> createState() => _CurrentSecondsCardState();
}

class _CurrentSecondsCardState extends State<CurrentSecondsCard> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
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
            '${DateTime.now().second}',
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
