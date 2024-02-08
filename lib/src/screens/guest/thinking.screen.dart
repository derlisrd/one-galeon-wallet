import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:onegaleon/src/services/api.services.dart';
import 'package:onegaleon/src/utils/local.storage.dart';
import 'package:onegaleon/src/providers/auth.provider.dart';

class ThinkingScreen extends StatefulWidget {
  const ThinkingScreen({super.key});

  @override
  State<ThinkingScreen> createState() => _ThinkingScreenState();
}

class _ThinkingScreenState extends State<ThinkingScreen> {

   LocalStorage local =  LocalStorage();
   ApiServices api = ApiServices();
  
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false);
    _verify();
  }

  void _verify()async{
   var token = await local.getString('token');
   if(token == null){
    if (context.mounted) Navigator.pushReplacementNamed(context, 'login');
    //Navigator.pushReplacementNamed(context, 'login');
   }else{
    var res = await api.checkToken(token);

    if(res.success){
      setState(() {
        context.read<AuthProvider>().setIsAuth(true);
        context.read<AuthProvider>().setUser(res.results);
      });
    }

    if (context.mounted) Navigator.pushReplacementNamed(context, 'authmain');
   }


   
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}