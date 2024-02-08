import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MontseText extends StatelessWidget {
  final String data;
  final TextStyle? textStyle;
  const MontseText(this.data,{super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: GoogleFonts.poppins( textStyle: textStyle  ));
  }
}