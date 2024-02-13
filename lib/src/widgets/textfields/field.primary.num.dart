import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldPrimaryNum extends StatelessWidget {
  
  final String? errorText;
  final String? hintText;
  final TextEditingController? controller;

  const FieldPrimaryNum({super.key, this.hintText, this.controller ,this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: TextField(
              keyboardType:  const TextInputType.numberWithOptions(signed: true,decimal: true),
              maxLength: 20,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: controller,
              decoration: InputDecoration(
/*                   fillColor: Colors.white, */
                  filled: true,
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