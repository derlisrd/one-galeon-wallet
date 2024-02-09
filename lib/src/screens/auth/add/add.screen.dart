import 'package:flutter/material.dart';
import 'package:onegaleon/src/widgets/buttons/secondary.button.dart';
import 'package:onegaleon/src/widgets/index.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});


  

  @override
  Widget build(BuildContext context) {

    void salir(){
    Navigator.pop(context);
  }

    return  Scaffold(
      body: Column(
        children: [
          const MontseText('Agregar un movimiento'),
          const FieldPrimary(hintText: 'Valor',),
          const PrimaryButton(text: 'Agregar'),
          SecondaryButton(text: 'Cancelar',onTap: salir,)
        ],
      ),
    );
  }
}