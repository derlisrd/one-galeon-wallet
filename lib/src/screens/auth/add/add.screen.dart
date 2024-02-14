import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/cat.response.model.dart';
import 'package:onegaleon/src/providers/auth.provider.dart';
import 'package:onegaleon/src/providers/info.providers.dart';
import 'package:onegaleon/src/services/api.movimientos.dart';
import 'package:onegaleon/src/widgets/buttons/secondary.button.dart';
import 'package:onegaleon/src/widgets/index.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  
  int? categoryId = 0;
  int? tipo = 0;
  bool loading = false;
  TextEditingController desc = TextEditingController();
  TextEditingController val = TextEditingController();
  

 @override
  void initState() {
    super.initState();
  }

  Future<void> _enviar()async{
    String token = Provider.of<AuthProvider>(context).user.token;
    Map<String,dynamic> body = {
      'category_id': categoryId,
      'tipo': tipo,
      'description': desc.text,
      'value': val.text
    };
    var res = await ApiMovimientos().store(body, token);
  }
  

  @override
  Widget build(BuildContext context) {
    List<CatModel> categorias = Provider.of<InfoProviders>(context).categorias;
    void salir(){
      Navigator.pop(context);
    }

 

    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap:()=> FocusManager.instance.primaryFocus?.unfocus(),
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
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        hint: const Text('Seleccionar categoria'),
                        value: (categoryId==0) ? null : categoryId,
                        items: categorias.map((op) => DropdownMenuItem(value: op.id, child: Text(op.description))).toList() ,
                        onChanged: (value){
                          setState(() {
                            categoryId = value;
                          });
                        }
                      ),
                ),
                Column(children: [
                  ListTile(
                      title: const Text('Ingreso'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: tipo,
                        onChanged: (int? value) {
                          setState(() {
                            tipo = value;
                          });
                        },
                      ),
                    ),
                  ListTile(
                      title: const Text('Egreso'),
                      leading: Radio<int>(
                        value: 0,
                        groupValue: tipo,
                        onChanged: (int? value) {
                          setState(() {
                            tipo = value;
                          });
                        },
                      ),
                    ),
                ],
                
                ),
                FieldPrimary(hintText: 'Descripción', controller: desc,),
                FieldPrimaryNum(hintText: 'Valor',controller: val,),
                PrimaryButton(text: 'Agregar',onTap: _enviar,),
                SecondaryButton(text: 'Cancelar',onTap: salir)
              ],
            ),
          ),
        ),
      ),
    );
  }
}