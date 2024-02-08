import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:onegaleon/src/providers/auth.provider.dart';
import 'package:onegaleon/src/services/api.services.dart';
import 'package:onegaleon/src/utils/local.storage.dart';
import 'package:onegaleon/src/widgets/buttons/secondary.button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

    LocalStorage local = LocalStorage();
    ApiServices api = ApiServices();
  
  @override 
  void initState(){ 
      super.initState(); 
  }
  
  void _salir(BuildContext context) async{
    context.read<AuthProvider>().setIsLoading(false);
    context.read<AuthProvider>().setIsAuth(false);
    
    await api.logOut(context.read<AuthProvider>().user.token);
    await local.removeString('token');
    if (context.mounted) Navigator.pushReplacementNamed(context, 'login'); 
  }
  

  @override
  Widget build(BuildContext context) {

    String email =  Provider.of<AuthProvider>(context).user.email;
    String token =  Provider.of<AuthProvider>(context).user.token;
    int id =  Provider.of<AuthProvider>(context).user.id;
    return  SafeArea(child: 
        Column(
          children: [
            Text( email ),
            Text( id.toString() ),
            Text( token ),
            SecondaryButton(text: 'SALIR', onTap: (){ _salir(context); })
          ],
        )
      );
  }
}