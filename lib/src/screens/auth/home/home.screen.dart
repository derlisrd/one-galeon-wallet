import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/cat.response.model.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';
import 'package:onegaleon/src/providers/info.providers.dart';
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


  String balance = '0';
  bool loadingBalance = true;
  
  @override
  void initState() {
    super.initState();
    String token = context.read<AuthProvider>().user.token;
    _getInfo(token);
  }

  

  void _getInfo (token)async{
    var res = await ApiServices().getMovements(token);
    var cat = await ApiServices().getCategories(token);
    int nuevoBalance = 0;
    List<MovModel> newmov = [];
    List<CatModel> newCat = [];
    
    if(cat.success){
      newCat = cat.results  ;
    }
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
      Provider.of<InfoProviders>(context, listen: false).setCategorias(newCat);
      Provider.of<InfoProviders>(context, listen: false).setMovimientos(newmov);
      var f = NumberFormat ("#,##0", "de_DE");
      balance = f.format(nuevoBalance);
      loadingBalance = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    var mov = Provider.of<InfoProviders>(context).movimientos;
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
              Flexible(child: 
                ListView.builder(
                      shrinkWrap: true,
                      itemCount: mov.length,
                      itemBuilder: (BuildContext context, int i) {
                        return MovimientosView(icono: Icons.payment, value: mov[i].value.toString() , description: mov[i].description);
                      },
                    )
              ),
              const SizedBox(height: 40,)
            ],
          )
    );
  }
}
