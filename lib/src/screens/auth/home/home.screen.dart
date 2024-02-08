import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:onegaleon/src/providers/auth.provider.dart';
import 'package:onegaleon/src/services/api.services.dart';
import 'package:onegaleon/src/widgets/index.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String balance = '0';
  bool loadingBalance = true;
  
  @override
  void initState() {
    super.initState();
    String token = context.read<AuthProvider>().user.token;
    _getMov(token);
  }

  void _getMov (token)async{
    var res = await ApiServices().getMovements(token);
    int nuevoBalance = 0;
    if(res.success){
      for (var el in res.results) {
        if(el.tipo == 0){
          nuevoBalance -= el.value;
        }else{
          nuevoBalance += el.value;
        }
      }
    }
    setState(() {
      var f = NumberFormat ("#,##0", "de_DE");
      balance = f.format(nuevoBalance);
      loadingBalance = false;
    });
  }

  void _salir(BuildContext context) {
    context.read<AuthProvider>().setIsLoading(false);
    context.read<AuthProvider>().setIsAuth(false);
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<AuthProvider>(context).user.email;
    return SafeArea(
        child: Column(
      children: [
        Text(email),
         CustomCard(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const MontseText('Balance'),
                TitlePrimary(loadingBalance ? '...' : balance),
              ]
          ),
        )
      ],
    ));
  }
}
