
import 'package:flutter/material.dart';


void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

bool isValidEmail(String email) {
    // Expresión regular para validar un correo electrónico
    String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }