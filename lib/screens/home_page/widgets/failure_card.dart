import 'package:flutter/material.dart';

class FailureCard extends StatelessWidget {
  const FailureCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.shade400,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.amber.shade700,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sorry try Again !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            color: Colors.amber.shade800,
            thickness: 0.3,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Attempts: 1',
              style: TextStyle(
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
