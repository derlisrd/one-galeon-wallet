import 'package:flutter/material.dart';

class FieldPassword extends StatelessWidget {
  
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final bool oscureText;
  final void Function()? onPressed;
  const FieldPassword({super.key, this.hintText, this.controller, required this.oscureText, this.onPressed, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: TextField(
              controller: controller,
              obscureText: oscureText,
              decoration: InputDecoration(
/*                   fillColor: Colors.white, */
                  filled: true,
                  suffixIcon: IconButton(
                     icon: Icon( oscureText ?  Icons.visibility_off : Icons.visibility),
                     onPressed: onPressed,
                   ),
                  hintText: hintText,
                  errorText: errorText,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red
                    )
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red
                    )
                  ),
                  enabledBorder:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.black38,
                          width: 1
                        )
                      ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Color del borde cuando está enfocado
                      width: 1.0,
                    ),
                  ),
                  ),
                  
            ),
          );
  }
}