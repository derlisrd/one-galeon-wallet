import 'package:flutter/material.dart';
import 'package:onegaleon/src/widgets/index.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: TitlePrimary('AGREGAR MOVIMIENTO')),
    );
  }
}