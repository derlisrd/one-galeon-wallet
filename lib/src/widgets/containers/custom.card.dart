


import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 480,
      ),
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.white)
          ),
      width: double.infinity,
      child:child,
    );
  }
}
