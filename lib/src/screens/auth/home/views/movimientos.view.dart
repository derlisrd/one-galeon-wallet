import 'package:flutter/material.dart';
import 'package:onegaleon/src/config/constants.dart';

class MovimientosView extends StatelessWidget {

  final String description;
  final String value;
  final IconData icono;
  
  const MovimientosView({ required this.icono, required this.value, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      constraints: const BoxConstraints(
        maxWidth: Constants.maxWidth,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icono),
          Text(description),
          Text(value)
        ],
      ),
    );
  }
}