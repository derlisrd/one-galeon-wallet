import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const SecondaryButton({super.key,required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 280,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        child:  Text(text, style: GoogleFonts.montserrat( textStyle: const TextStyle(fontSize: 16, color: Colors.black)  )),
      ),
    );
  }
}