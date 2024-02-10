import 'package:flutter/material.dart';
import 'package:onegaleon/src/widgets/buttons/secondary.button.dart';
import 'package:onegaleon/src/widgets/index.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  
  
  
  @override
  Widget build(BuildContext context) {
    
    void salir(){
      Navigator.pop(context);
    }

    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MontseText('Agregar un movimiento'),
            const FieldPrimary(hintText: 'Descripción',),
            const PrimaryButton(text: 'Agregar'),
            SecondaryButton(text: 'Cancelar',onTap: salir)
          ],
        ),
      ),
    );
  }
}