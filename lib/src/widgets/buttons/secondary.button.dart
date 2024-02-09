import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onegaleon/src/config/constants.dart';


class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const SecondaryButton({super.key,required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      constraints: const BoxConstraints(
        minWidth: 280,
        maxWidth: 320
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.backgroundLightColor,
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        child:  Text(text, style: GoogleFonts.poppins( textStyle: const TextStyle(fontSize: 16, color: Colors.black)  )),
      ),
    );
  }
}