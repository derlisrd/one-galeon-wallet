import 'package:flutter/material.dart';
import 'package:onegaleon/src/widgets/buttons/secondary.button.dart';
import 'package:onegaleon/src/widgets/index.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  
  String categoriasValue = '';
  final categorias = ['Cosas','Tipo','Ingro'];
 
 @override
  void initState() {
    super.initState();
  }

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
            Container(
              constraints: const BoxConstraints(
                maxWidth: 480
                ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: const  Text('Categoria'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                    isExpanded: true,
                    hint: const Text('Seleccionar categoria'),
                    value: (categoriasValue.isEmpty) ? null : categoriasValue,
                    items: categorias.map((op) => DropdownMenuItem( value: op, child: Text(op))).toList() ,
                    onChanged: (value){
                      setState(() {
                        categoriasValue = value.toString();
                      });
                    }
                  ),
            ),
            const FieldPrimary(hintText: 'Descripción',),
            const FieldPrimary(hintText: 'Valor',),
            const PrimaryButton(text: 'Agregar'),
            SecondaryButton(text: 'Cancelar',onTap: salir)
          ],
        ),
      ),
    );
  }
}