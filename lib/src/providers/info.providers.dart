import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/cat.response.model.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';

class InfoProviders extends ChangeNotifier{

  List<MovModel> _movimientos = [];

  List<CatModel> _categorias = [];


  List<MovModel> get movimientos => _movimientos;

  void setMovimientos (List<MovModel> valor){
    _movimientos = valor;
    notifyListeners();
  }
  List<CatModel> get categorias => _categorias;

  void setCategorias (List<CatModel> valor){
    _categorias = valor;
    notifyListeners();
  }

  
}