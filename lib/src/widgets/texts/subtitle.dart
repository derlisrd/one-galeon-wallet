import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subtitle extends StatelessWidget {
  final String data;
  const Subtitle(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Text(data, style: GoogleFonts.poppins( textStyle: const TextStyle(fontSize: 15)  ))
    );
  }
}