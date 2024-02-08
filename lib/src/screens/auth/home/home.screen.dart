import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';
import 'package:onegaleon/src/screens/auth/home/views/movimientos.view.dart';
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

  List<MovModel> mov = [];
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
    List<MovModel> newmov = [];
    if(res.success){
      newmov = res.results;
      for (var el in res.results) {
        if(el.tipo == 0){
          nuevoBalance -= el.value;
        }else{
          nuevoBalance += el.value;
        }
      }
    }
    setState(() {
      mov = newmov;
      var f = NumberFormat ("#,##0", "de_DE");
      balance = f.format(nuevoBalance);
      loadingBalance = false;
    });
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
              ),
              /* CustomScrollView(
                slivers: [
                 SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return const MovimientosView(icono: Icons.shop, value: '10', description: "description");
                  },
                  childCount: mov.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent( maxCrossAxisExtent: 200 ),
                 )
                ],
              ) */
            ],
          )
    );
  }
}
