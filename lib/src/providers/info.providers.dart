import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/cat.response.model.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';

class InfoProviders extends ChangeNotifier{

  List<MovModel> _movimientos = [];
  int _balance = 0;
  List<CatModel> _categorias = [];

  int get balance => _balance;

  List<MovModel> get movimientos => _movimientos;

  void setMovimientos (List<MovModel> valor){
    _movimientos = valor;
    notifyListeners();
  }
  void setMovimientosConBalance (List<MovModel> valor){
    int nuevoBalance = 0;
    for (var el in valor) {
        if(el.tipo == 0){
          nuevoBalance -= el.value;
        }else{
          nuevoBalance += el.value;
        }
      }
      _balance = nuevoBalance;
    _movimientos = valor;
    notifyListeners();
  }
  List<CatModel> get categorias => _categorias;

  void setCategorias (List<CatModel> valor){
    _categorias = valor;
    notifyListeners();
  }

  
}