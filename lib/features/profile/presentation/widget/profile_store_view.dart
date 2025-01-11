import 'package:flutter/material.dart';

class ProfileStoreWidget extends StatelessWidget {
  const ProfileStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        Text(
          'Store',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
