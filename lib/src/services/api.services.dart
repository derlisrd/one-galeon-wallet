import 'package:http/http.dart' as http;
import 'package:onegaleon/src/config/constants.dart';
import 'package:onegaleon/src/models/login.response.model.dart';
import 'package:onegaleon/src/models/mov.response.model.dart';
import 'dart:convert';

import 'package:onegaleon/src/models/register.response.model.dart';


class ApiServices{

  

  Future<LoginResponseModel> loginWithEmailAndPassword({ required String email, required  String password}) async{
    try {

      http.Response res = await http.post(
        Uri.parse('${Constants.apiUrl}/auth/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey
        },
      );
      //print(res.body);
      Map<String,dynamic> json = jsonDecode(res.body);
       LoginResponseModel loginResponse = LoginResponseModel.fromMap(json);
       return loginResponse;
    } catch (e) {
      Map<String,dynamic> error = {"success": false, "message": e.toString()};
      LoginResponseModel loginResponseError = LoginResponseModel.fromMap(error);
      return loginResponseError;
    }

  }

  Future<RegisterModelResponse> registerWithEmailAndPassword({ required String email, required  String password, required String name, required String passwordConfirmation}) async{
    try {

      http.Response res = await http.post(
        Uri.parse('${Constants.apiUrl}/auth/register'),
        body: jsonEncode({
          'email': email,
          'name': name,
          'password': password,
          'password_confirmation': passwordConfirmation
        }),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey
        },
      );

      Map<String,dynamic> json = jsonDecode(res.body);

      RegisterModelResponse registerResponse = RegisterModelResponse.fromJson(json);
      return registerResponse;
      
    } catch (e) {
      Map<String,dynamic> error = {"success": false, "message": e.toString()};
      RegisterModelResponse registerResponseError = RegisterModelResponse.fromJson(error);
      return registerResponseError;
    }

  }


  Future<LoginResponseModel> checkToken(String token)async{
    try {

      http.Response res = await http.post(
        Uri.parse('${Constants.apiUrl}/auth/check'),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey,
          'Authorization': 'Bearer $token'
        },
      );

      Map<String,dynamic> json = jsonDecode(res.body);
       LoginResponseModel loginResponse = LoginResponseModel.fromMap(json);
       return loginResponse;
    } catch (e) {
      Map<String,dynamic> error = {"success": false, "message": e.toString()};
      LoginResponseModel loginResponseError = LoginResponseModel.fromMap(error);
      return loginResponseError;
    }
  }


  Future<void> logOut(String token)async{
      
      try {
       await http.post(
        Uri.parse('${Constants.apiUrl}/auth/logout'),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey,
          'Authorization': 'Bearer $token'
        },
      );

      //Map<String,dynamic> json = jsonDecode(res.body);

    } catch (e) {
      //Map<String,dynamic> error = {"success": false, "message": e.toString()};
      //LoginResponseModel loginResponseError = LoginResponseModel.fromMap(error);
      //return loginResponseError;
    }
  }


  Future<MovResponseModel> getMovements(String token) async {
     try {

      http.Response res = await http.get(
        Uri.parse('${Constants.apiUrl}/movements'),
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-api-key': Constants.xApiKey,
          'Authorization' : 'Bearer $token'
        },
      );

      Map<String,dynamic> json = jsonDecode(res.body);
      //print(json);
      MovResponseModel mov = MovResponseModel.fromJson(json);
      return mov;
    } catch (e) {
      
      Map<String,dynamic> error = {"success": false, "results": []};
      MovResponseModel movE = MovResponseModel.fromJson(error);
      return movE;
    }
  }


}