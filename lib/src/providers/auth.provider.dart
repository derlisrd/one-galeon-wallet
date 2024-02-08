import 'package:flutter/material.dart';
import 'package:onegaleon/src/models/login.response.model.dart';

class AuthProvider extends ChangeNotifier {

  bool _isLoading = false;

  bool _isAuth = false;
 ResultsLoginUserModel _user = ResultsLoginUserModel(email: '', id: 0, token: '', username: '');

 ResultsLoginUserModel get user => _user;

  bool get isAuth => _isAuth;

  bool get isLoading => _isLoading;


  void setIsLoading (bool valor){
    _isLoading = valor;
    notifyListeners();
  }
  void setIsAuth (bool valor){
    _isAuth = valor;
    notifyListeners();
  }

  void setUser(ResultsLoginUserModel usuario){
    _user = usuario;
    notifyListeners();
  }

  /* void setUserFromModel(UserModel userProveido){
    _user = userProveido;
    notifyListeners();
  } */

}